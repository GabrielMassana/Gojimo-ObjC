//
//  GOJQualificationsFeedParser.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsFeedParser.h"

#import "GOJQualificationsFeed.h"
#import "GOJQualification.h"
#import "GOJQualificationsParser.h"

@implementation GOJQualificationsFeedParser

- (GOJQualificationsFeed *)parseFeed:(NSArray *)qualificationsResponse
{
    GOJQualificationsFeed *feed = [GOJQualificationsFeed fetchQualificationsFeedWithManagedObjectContext:self.parserManagedObjectContext];
    
    GOJQualificationsParser *parser = [GOJQualificationsParser parserWithManagedObjectContext:self.parserManagedObjectContext];
    
    NSArray *qualifications = [parser parseQualifications:qualificationsResponse];
    
    for (GOJQualification *qualification in qualifications)
    {
        qualification.feed = feed;
    }
        
    return feed;
}

@end
