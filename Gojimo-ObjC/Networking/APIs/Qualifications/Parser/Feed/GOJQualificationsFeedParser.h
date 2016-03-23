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

- (GOJQualificationsFeed *)parseFeed:(NSArray *)qualificationsResponse;

@end
