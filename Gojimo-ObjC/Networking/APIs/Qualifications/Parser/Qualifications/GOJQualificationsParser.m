//
//  GOJQualificationsParser.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsParser.h"

#import "GOJQualification.h"
#import "GOJCountryParser.h"

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
    // TODO:  protection for nil

    NSString *qualificationID = qualificationResponse[@"id"];
    
//   TODO:   if (!qualificationID || <null>) {
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
    /*-------------------*/

    NSDictionary *country = qualificationResponse[@"country"];
    
    GOJCountryParser *countryParser = [GOJCountryParser parserWithManagedObjectContext:self.parserManagedObjectContext];
    
    qualification.country = [countryParser parseCountry:country];
    
    /*-------------------*/

    // protection for nil
    qualification.link = qualificationResponse[@"country"];
    qualification.name = qualificationResponse[@"name"];
    
    NSArray *subjects = qualificationResponse[@"subjects"];

    // TODO:  parse subjects
    
    /*
      TODO: for each subject set qualification
     */
    
    // protection for nil
    return qualification;
}

@end
