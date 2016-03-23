//
//  GOJQualificationsParserOperation.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsParserOperation.h"

#import <CoreDataFullStack/CoreDataFullStack.h>

#import "GOJQualificationsFeedParser.h"
#import "GOJQualificationsFeed.h"

@interface GOJQualificationsParserOperation ()

@property (nonatomic, strong) NSArray *qualificationsResponse;

@end

@implementation GOJQualificationsParserOperation

#pragma mark - Identifier

@synthesize identifier = _identifier;

- (instancetype)initWithQualifications:(NSArray *)qualificationsResponse
{
    self = [super init];
    
    if (self)
    {
        self.qualificationsResponse = qualificationsResponse;
    }
    
    return self;
}

- (NSString *)identifier
{
    if (!_identifier)
    {
        _identifier = [NSString stringWithFormat:@"GOJQualificationsParserOperation"];
    }
    
    return _identifier;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    [[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext performBlockAndWait:^{
        
        GOJQualificationsFeedParser *parser = [GOJQualificationsFeedParser parserWithManagedObjectContext:[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext];
        
        GOJQualificationsFeed *feed = [parser parseFeed:self.qualificationsResponse];
        
        [[CDFCoreDataManager sharedInstance].backgroundManagedObjectContext save:nil];
        
        [self didSucceedWithResult:feed.qualificationsFeedID];
    }];
}

#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self didSucceedWithResult:nil];
}

@end
