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
    // protection for nil

    NSString *qualificationID = qualificationResponse[@"id"];
    
//    if (!qualificationID || <null>) {
//        
//    }
    
    GOJQualification *qualification = [GOJQualification fetchQualificationWithManagedObjectContext:self.parserManagedObjectContext
                                                                                   qualificationID:qualificationID];
    
    if (!qualification)
    {
        qualification = [CDFInsertService insertNewObjectForEntityClass:[GOJQualification self]
                                                 inManagedObjectContext:self.parserManagedObjectContext];
        
        qualification.qualificationID = qualificationID;
    }
    
    NSDictionary *contry = qualificationResponse[@"country"];
    // parse country
    
//    qualification.country = []

    // protection for nil
    qualification.link = qualificationResponse[@"country"];
    qualification.name = qualificationResponse[@"name"];
    
    NSArray *subjects = qualificationResponse[@"subjects"];

    // parse subjects
    
    /*
     for each subject set qualification
     */
    
    // protection for nil
    return qualification;
}

@end
