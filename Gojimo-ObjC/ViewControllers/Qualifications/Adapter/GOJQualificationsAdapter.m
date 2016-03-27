//
//  GOJQualificationsAdapter.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsAdapter.h"

#import "GOJQualification.h"
#import "GOJQualificationTableViewCell.h"
#import "GOJQualificationSectionHeaderView.h"

@interface GOJQualificationsAdapter () <UITableViewDataSource, UITableViewDelegate>

/**
 Used to connect the TableView with Core Data.
 */
@property (nonatomic, strong) CDFTableViewFetchedResultsController *fetchedResultsController;

/**
 Sort Descriptors to sort how characters should be ordered.
 */
@property (nonatomic, strong) NSArray *sortDescriptors;

/**
 Fetch request for retrieving qualifications.
 */
@property (nonatomic, strong) NSFetchRequest *fetchRequest;

/**
 Predicate to filter the data.
 */
@property (nonatomic, strong)  NSPredicate *predicate;

/**
 Configure the cell.
 
 @param cell - cell to be configured.
 @param indexPath - cell indexPath.
 */
- (void)configureCell:(GOJQualificationTableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

/**
 Register the cells to be used in the table view.
 */
- (void)registerCells;

@end

@implementation GOJQualificationsAdapter

#pragma mark - TableView

- (void)setTableView:(GOJTableView *)tableView
{
    [self willChangeValueForKey:NSStringFromSelector(@selector(tableView))];
    _tableView = tableView;
    [self didChangeValueForKey:NSStringFromSelector(@selector(tableView))];
    
    /*-------------------*/

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 70.0 * [GOJDeviceSizeService sharedInstance].resizeFactor;
    self.tableView.sectionHeaderHeight = 35.0 * [GOJDeviceSizeService sharedInstance].resizeFactor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /*-------------------*/
    
    [self registerCells];
    
    /*-------------------*/
    
    [self.fetchedResultsController performFetch:nil];
}

#pragma mark - FetchResultsController

- (CDFTableViewFetchedResultsController *)fetchedResultsController
{
    if (!_fetchedResultsController)
    {
        _fetchedResultsController = [[CDFTableViewFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                                  managedObjectContext:[CDFCoreDataManager sharedInstance].managedObjectContext
                                                                                    sectionNameKeyPath:@"country.name"
                                                                                             cacheName:nil];
        
        
        _fetchedResultsController.tableView = self.tableView;
        _fetchedResultsController.updateRowAnimation = UITableViewRowAnimationNone;
    }
    
    return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = [NSEntityDescription entityForName:NSStringFromClass([GOJQualification class])
                                      inManagedObjectContext:[[CDFCoreDataManager sharedInstance] managedObjectContext]];
    
    fetchRequest.sortDescriptors = self.sortDescriptors;
    fetchRequest.predicate = self.predicate;
    
    return fetchRequest;
}

- (NSPredicate *)predicate
{
    if (!_predicate)
    {
        _predicate = [NSPredicate predicateWithFormat:@"country != nil"];
    }
    
    return _predicate;
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *countryNameSort = [NSSortDescriptor sortDescriptorWithKey:@"country.name"
                                                               ascending:YES];

    NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                               ascending:YES];

    return @[countryNameSort, nameSort];
}

#pragma mark - RegisterCells

- (void)registerCells
{
    [self.tableView registerClass:[GOJQualificationTableViewCell class]
           forCellReuseIdentifier:[GOJQualificationTableViewCell reuseIdentifier]];
}

#pragma mark - ConfigureCell

- (void)configureCell:(GOJQualificationTableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[indexPath.section];
    GOJQualification *qualification = sectionInfo.objects[indexPath.row];
    
    [cell configureWithQualification:qualification];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedResultsController.sections[section].numberOfObjects;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GOJQualificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[GOJQualificationTableViewCell reuseIdentifier]
                                                                           forIndexPath:indexPath];
    
    [self configureCell:cell
              indexPath:indexPath];
    
    [cell layoutByApplyingConstraints];

    return cell;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    
    GOJQualificationSectionHeaderView *sectionHeaderView = [[GOJQualificationSectionHeaderView alloc] initWithFrame:CGRectMake(0.0f,
                                                                                                                               0.0f,
                                                                                                                               CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                                                                               35.0 * [GOJDeviceSizeService sharedInstance].resizeFactor)
                                                                                                        countryName:sectionInfo.name];
    
    return sectionHeaderView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[indexPath.section];
    GOJQualification *qualification = sectionInfo.objects[indexPath.row];

    [self.delegate didSelectQualification:qualification];
}

@end
