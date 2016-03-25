//
//  GOJQualificationsAdapter.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsAdapter.h"

#import "GOJQualification.h"
#import "GOJQualificationsTableViewCell.h"

@interface GOJQualificationsAdapter () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CDFTableViewFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSArray *sortDescriptors;

@property (nonatomic, strong) NSFetchRequest *fetchRequest;

@property (nonatomic, strong)  NSPredicate *predicate;

@end

@implementation GOJQualificationsAdapter

#pragma mark - TableView

- (void)setTableView:(UITableView *)tableView
{
    [self willChangeValueForKey:NSStringFromSelector(@selector(tableView))];
    _tableView = tableView;
    [self didChangeValueForKey:NSStringFromSelector(@selector(tableView))];
    
    /*-------------------*/

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 70.0 * [GOJDeviceSizeService sharedInstance].resizeFactor;
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
    [self.tableView registerClass:[GOJQualificationsTableViewCell class]
           forCellReuseIdentifier:[GOJQualificationsTableViewCell reuseIdentifier]];
}

#pragma mark - ConfigureCell

- (void)configureCell:(GOJQualificationsTableViewCell *)cell indexPath:(NSIndexPath *)indexPath
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

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = self.fetchedResultsController.sections[section];
    
    return sectionInfo.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GOJQualificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[GOJQualificationsTableViewCell reuseIdentifier]
                                                                           forIndexPath:indexPath];
    
    [cell layoutByApplyingConstraints];
    
    if (indexPath.row % 2 == 0)
    {
        cell.backgroundColor = [UIColor redColor];
    }
    
    [self configureCell:cell
              indexPath:indexPath];
    
    return cell;
}

@end
