//
//  GOJSubjectsViewController.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJSubjectsViewController.h"

#import "GOJSubjectsAdapter.h"
#import "GOJQualification.h"
#import "GOJSubjectsEmptyView.h"

@interface GOJSubjectsViewController ()

@property (nonatomic, strong) GOJTableView *tableView;

@property (nonatomic, strong) GOJSubjectsAdapter *adapter;

@property (nonatomic, strong) UILabel *titleViewLabel;

@property (nonatomic, strong) GOJQualification *qualification;

@property (nonatomic, strong) UIBarButtonItem *backButton;

@property (nonatomic, strong) GOJSubjectsEmptyView *emptyView;

@end

@implementation GOJSubjectsViewController

#pragma mark - Init

- (instancetype)initWithQualification:(GOJQualification *)qualification
{
    self = [super init];
    
    if (self)
    {
        self.qualification = qualification;
        
        self.navigationItem.leftBarButtonItem = self.backButton;
    }
    
    return self;
}

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
}


#pragma mark - Subviews

- (GOJTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [GOJTableView newAutoLayoutView];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.emptyView = self.emptyView;
    }
    
    return _tableView;
}

- (GOJSubjectsAdapter *)adapter
{
    if (!_adapter)
    {
        _adapter = [[GOJSubjectsAdapter alloc] initWithQualification:self.qualification];
    }
    
    return _adapter;
}

- (GOJSubjectsEmptyView *)emptyView
{
    if (!_emptyView)
    {
        _emptyView = [[GOJSubjectsEmptyView alloc] initWithFrame:CGRectMake(0.0f,
                                                                            0.0f,
                                                                            CGRectGetWidth([UIScreen mainScreen].bounds),
                                                                            CGRectGetHeight([UIScreen mainScreen].bounds) - 64.0f)];
    }
    
    return _emptyView;
}

- (UILabel *)titleViewLabel
{
    if (!_titleViewLabel)
    {
        _titleViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,
                                                                    0.0f,
                                                                    200.0f,
                                                                    25.0f)];
        
        _titleViewLabel.text = self.qualification.name;
        _titleViewLabel.textAlignment = NSTextAlignmentCenter;
        _titleViewLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:20.0f];
        _titleViewLabel.adjustsFontSizeToFitWidth = true;
        _titleViewLabel.minimumScaleFactor = 0.5;
    }
    
    return _titleViewLabel;
}

- (UIBarButtonItem *)backButton
{
    if (!_backButton)
    {
        _backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"❮ Back",nil)
                                                       style:UIBarButtonItemStylePlain
                                                      target:self
                                                      action:@selector(backButtonPressed:)];
        
        [_backButton setTitleTextAttributes:@{
                                              NSFontAttributeName : [UIFont goj_tradeGothicLTWithSize:15.0],
                                            NSForegroundColorAttributeName : [UIColor blackColor]}
                                   forState:UIControlStateNormal];
    }
    
    return _backButton;
}

#pragma mark - Constraints

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    /*----------------*/
    
    [self.tableView autoPinEdgesToSuperviewEdges];
}

#pragma mark - ButtonActions

- (void)backButtonPressed:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
