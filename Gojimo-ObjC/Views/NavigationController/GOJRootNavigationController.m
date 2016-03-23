//
//  GOJRootNavigationController.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJRootNavigationController.h"

#import "GOJQualificationsViewController.h"

@interface GOJRootNavigationController ()

@property (nonatomic, strong) GOJQualificationsViewController *rootViewController;

@end

@implementation GOJRootNavigationController

#pragma mark - Init

- (instancetype)init
{
    self =  [super initWithRootViewController:self.rootViewController];
    
    return self;
}

#pragma mark - RootViewController

- (GOJQualificationsViewController *)rootViewController
{
    if (!_rootViewController)
    {
        _rootViewController = [[GOJQualificationsViewController alloc] init];
    }
    
    return _rootViewController;
}

@end
