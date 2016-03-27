//
//  GOJSubjectsAdapter.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJSubjectsAdapter.h"

#import "GOJSubject.h"
#import "GOJQualification.h"
#import "GOJSectionTableViewCell.h"
#import "GOJSectionTableViewCell.h"

@interface GOJSubjectsAdapter () <UITableViewDataSource, UITableViewDelegate>

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
 Qualification to update the view controller.
 */
@property (nonatomic, strong) GOJQualification *qualification;

/**
 Configure the cell.
 
 @param cell - cell to be configured.
 @param indexPath - cell indexPath.
 */
- (void)configureCell:(GOJSectionTableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

/**
 Register the cells to be used in the table view.
 */
- (void)registerCells;

@end

@implementation GOJSubjectsAdapter

#pragma mark - Init

- (instancetype)initWithQualification:(GOJQualification *)qualification
{
    self = [super init];
    
    if (self)
    {
        self.qualification = qualification;
    }
    
    return self;
}

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
    self.tableView.rowHeight = 40.0 * [GOJDeviceSizeService sharedInstance].resizeFactor;
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
                                                                                    sectionNameKeyPath:nil
                                                                                             cacheName:nil];
        
        
        _fetchedResultsController.tableView = self.tableView;
        _fetchedResultsController.updateRowAnimation = UITableViewRowAnimationNone;
    }
    
    return _fetchedResultsController;
}

- (NSFetchRequest *)fetchRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    fetchRequest.entity = [NSEntityDescription entityForName:NSStringFromClass([GOJSubject class])
                                      inManagedObjectContext:[[CDFCoreDataManager sharedInstance] managedObjectContext]];
    
    fetchRequest.sortDescriptors = self.sortDescriptors;
    fetchRequest.predicate = self.predicate;
    
    return fetchRequest;
}

- (NSPredicate *)predicate
{
    if (!_predicate)
    {
        _predicate = [NSPredicate predicateWithFormat:@"qualification.qualificationID == %@", self.qualification.qualificationID];
    }
    
    return _predicate;
}

- (NSArray *)sortDescriptors
{
    NSSortDescriptor *nameSort = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                               ascending:YES];
    
    return @[nameSort];
}

#pragma mark - RegisterCells

- (void)registerCells
{
    [self.tableView registerClass:[GOJSectionTableViewCell class]
           forCellReuseIdentifier:[GOJSectionTableViewCell reuseIdentifier]];
}

#pragma mark - ConfigureCell

- (void)configureCell:(GOJSectionTableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    GOJSubject *subject = self.fetchedResultsController.fetchedObjects[indexPath.row];
    
    [cell configureWithSubject:subject];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    GOJSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[GOJSectionTableViewCell reuseIdentifier]
                                                                    forIndexPath:indexPath];
    
    [self configureCell:cell
              indexPath:indexPath];
    
    [cell layoutByApplyingConstraints];
    
    return cell;
}

@end
