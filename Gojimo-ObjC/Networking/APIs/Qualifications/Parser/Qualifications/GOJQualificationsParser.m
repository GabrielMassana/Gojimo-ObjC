//
//  GOJQualificationsParser.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsParser.h"

#import "GOJQualification.h"

@implementation GOJQualificationsParser

- (NSArray *)parseQualifications:(NSArray *)qualificationsResponse
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:qualificationsResponse.count];
    
    for (NSDictionary *qualification in qualificationsResponse)
    {
        [array addObject:[self parseQualification:qualification]];
    }
    
    return array;
}

- (GOJQualification *)parseQualification:(NSDictionary *)qualificationResponse
{
    NSLog(@"qualification: %@", qualificationResponse);
    
    //Crash
    return nil;
}

@end
