//
//  ViewController.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsViewController.h"

#import "GOJQualificationsAPIManager.h"
#import "GOJQualificationsAdapter.h"

@interface GOJQualificationsViewController () <GOJQualificationsAdapterDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GOJQualificationsAdapter *adapter;

@end

@implementation GOJQualificationsViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    /*-------------------*/

    [self.view addSubview:self.tableView];
    
    self.adapter.tableView = self.tableView;
    
    [self updateViewConstraints];
    
    
    
    
    
    
    
    
    // with complition.
    // Remove success and failure
    [GOJQualificationsAPIManager retrieveQualificationsWithSuccess:^(id result)
    {
        
    }
                                                           failure:^(NSError *error)
    {
        
    }];
}

#pragma mark - Subviews

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [UITableView newAutoLayoutView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    return _tableView;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*----------------*/
    
    [self.tableView autoPinEdgesToSuperviewEdges];
}

#pragma mark - GOJQualificationsAdapterDelegate

@end
