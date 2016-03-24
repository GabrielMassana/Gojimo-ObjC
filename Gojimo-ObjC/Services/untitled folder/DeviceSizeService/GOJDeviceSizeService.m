//
//  GOJDeviceSizeService.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJDeviceSizeService.h"

/**
 iPhone 5 screen width in points.
 */
static CGFloat const kFSNiPhone5Width = 320.0f;

@interface GOJDeviceSizeService()

@property (nonatomic, assign, readwrite) CGFloat resizeFactor;

@end

@implementation GOJDeviceSizeService

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static GOJDeviceSizeService *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[GOJDeviceSizeService alloc] init];
                  });
    
    return sharedInstance;
}

#pragma mark - ObjectLifecycle

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self calculateFactor];
    }
    
    return self;
}

#pragma mark - Resize Factor

- (void)calculateFactor
{
    self.resizeFactor = CGRectGetWidth([UIScreen mainScreen].bounds) / kFSNiPhone5Width;
}

@end
