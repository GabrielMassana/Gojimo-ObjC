//
//  GOJQualificationsFeedParser.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJParser.h"

@class GOJQualificationsFeed;

@interface GOJQualificationsFeedParser : GOJParser

/**
 Parser for the qualifications feed.
 
 @param qualificationsResponse - a full API response for qualifications.
 
 @return a GOJQualificationsFeed object.
 */
- (GOJQualificationsFeed *)parseFeed:(NSArray *)qualificationsResponse;

@end
