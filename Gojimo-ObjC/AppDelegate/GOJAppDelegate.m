//
//  AppDelegate.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJAppDelegate.h"

#import "GOJRootNavigationController.h"

@interface GOJAppDelegate () <CDFCoreDataManagerDelegate>

/**
 Root Navigation Controller for the Aplication
 */
@property (nonatomic, strong) GOJRootNavigationController *rootNavigationController;

/**
 Register Operation Queues to be used during the app life.
 */
- (void)registerOperationQueues;

@end

@implementation GOJAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CDFCoreDataManager sharedInstance].delegate = self;
    
    /*-------------------*/

    [self registerOperationQueues];
    
    /*-------------------*/

    self.window.backgroundColor = [UIColor clearColor];
    self.window.clipsToBounds = NO;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark - UIWindow

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        _window.rootViewController = self.rootNavigationController;
    }
    
    return _window;
}

#pragma mark - RootNavigationController

- (GOJRootNavigationController *)rootNavigationController
{
    if (!_rootNavigationController)
    {
        _rootNavigationController = [[GOJRootNavigationController alloc]  init];
    }
    
    return _rootNavigationController;
}

#pragma mark - OperationQueues

- (void)registerOperationQueues
{
    //Local Data
    NSOperationQueue *localDataOperationQueue = [[NSOperationQueue alloc] init];
    localDataOperationQueue.qualityOfService = NSQualityOfServiceBackground;
    localDataOperationQueue.maxConcurrentOperationCount = 1;
    localDataOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    
    [[COMOperationQueueManager sharedInstance] registerOperationQueue:localDataOperationQueue
                                             operationQueueIdentifier:GOJLocalDataOperationQueueTypeIdentifier];
}

#pragma mark - CDFCoreDataManagerDelegate

- (NSString *)coreDataModelName
{
    return @"Gojimo";
}

@end
