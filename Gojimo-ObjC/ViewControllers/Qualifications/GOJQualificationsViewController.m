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
#import "GOJQualificationsEmptyView.h"
#import "GOJQualificationsLoadingView.h"

@interface GOJQualificationsViewController () <GOJQualificationsAdapterDelegate>

/**
 Table view to display data.
 */
@property (nonatomic, strong) GOJTableView *tableView;

/**
 Adapter to  manage the common logic of the tableView.
 */
@property (nonatomic, strong) GOJQualificationsAdapter *adapter;

/**
 NavigationItem titleView view.
 */
@property (nonatomic, strong) UILabel *titleViewLabel;

/**
 Empty View to be shown when no data in the Table View.
 */
@property (nonatomic, strong) GOJQualificationsEmptyView *emptyView;

/**
 Loading View to be shown when data isdownloading in the Table View from the API service.
 */
@property (nonatomic, strong) GOJQualificationsLoadingView *loadingView;

/**
 Download and load the content from the API service.
 */
- (void)loadContent;

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
    
    [self loadContent];
    
    [self updateViewConstraints];
}

#pragma mark - Subviews

- (GOJTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [GOJTableView newAutoLayoutView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.emptyView = self.emptyView;
        _tableView.loadingView = self.loadingView;
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

- (GOJQualificationsEmptyView *)emptyView
{
    if (!_emptyView)
    {
        _emptyView = [[GOJQualificationsEmptyView alloc] initWithFrame:CGRectMake(0.0f,
                                                                                  0.0f,
                                                                                  CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                                  CGRectGetHeight([UIScreen mainScreen].bounds) - 64.0f)];
    }
    
    return _emptyView;
}

- (GOJQualificationsLoadingView *)loadingView
{
    if (!_loadingView)
    {
        _loadingView = [[GOJQualificationsLoadingView alloc] initWithFrame:CGRectMake(0.0f,
                                                                                      0.0f,
                                                                                      CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                                      CGRectGetHeight([UIScreen mainScreen].bounds) - 64.0f)];
    }
    
    return _loadingView;
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

#pragma mark - LoadContent

- (void)loadContent
{
    [self.tableView willLoadContent];
    
    [GOJQualificationsAPIManager retrieveQualificationsWithSuccess:^(id result)
     {
         [self.tableView didFinishLoadingContent:YES];
     }
                                                           failure:^(NSError *error)
     {
         [self.tableView didFinishLoadingContent:NO];
     }];
}

#pragma mark - GOJQualificationsAdapterDelegate

- (void)didSelectQualification:(GOJQualification *)qualification
{
    GOJSubjectsViewController *subjectsViewController = [[GOJSubjectsViewController alloc] initWithQualification:qualification];
    
    [self.navigationController pushViewController:subjectsViewController
                                         animated:YES];
}

@end
