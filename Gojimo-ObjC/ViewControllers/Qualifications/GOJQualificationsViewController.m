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
#import "GOJSubjectsViewController.h"

@interface GOJQualificationsViewController () <GOJQualificationsAdapterDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) GOJQualificationsAdapter *adapter;

@property (nonatomic, strong) UILabel *titleViewLabel;

@end

@implementation GOJQualificationsViewController

#pragma mark - ViewLifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    /*-------------------*/

    self.navigationItem.titleView = self.titleViewLabel;

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

- (GOJQualificationsAdapter *)adapter
{
    if (!_adapter)
    {
        _adapter = [[GOJQualificationsAdapter alloc] init];
        _adapter.delegate = self;
    }
    
    return _adapter;
}

- (UILabel *)titleViewLabel
{
    if (!_titleViewLabel)
    {
        _titleViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,
                                                                    0.0f,
                                                                    200.0f,
                                                                    25.0f)];
        
        _titleViewLabel.text = NSLocalizedString(@"Qualifications", nil);
        _titleViewLabel.textAlignment = NSTextAlignmentCenter;
        _titleViewLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:20.0f];
        _titleViewLabel.adjustsFontSizeToFitWidth = true;
        _titleViewLabel.minimumScaleFactor = 0.5;
    }
    
    return _titleViewLabel;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*----------------*/
    
    [self.tableView autoPinEdgesToSuperviewEdges];
}

#pragma mark - GOJQualificationsAdapterDelegate

- (void)didSelectQualification:(GOJQualification *)qualification
{
    GOJSubjectsViewController *subjectsViewController = [[GOJSubjectsViewController alloc] initWithQualification:qualification];
    
    [self.navigationController pushViewController:subjectsViewController
                                         animated:YES];
}

@end
