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
#import "GOJSubjectParser.h"
#import "GOJSubject.h"

@implementation GOJQualificationsParser

- (NSArray *)parseQualifications:(NSArray *)qualificationsResponse
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:qualificationsResponse.count];
    
    for (NSDictionary *qualification in qualificationsResponse)
    {
        GOJQualification *aQualification = [self parseQualification:qualification];
        
        if (aQualification)
        {
            [array addObject:aQualification];
        }
    }
    
    return array;
}

- (GOJQualification *)parseQualification:(NSDictionary *)qualificationResponse
{
    NSString *qualificationID = qualificationResponse[@"id"];
    
    NSLog(@"%@", qualificationID);
    
    GOJQualification *qualification = nil;
    
    if ([GOJValueOrDefault valueIsNotNil:qualificationID])
    {
        qualification = [GOJQualification fetchQualificationWithManagedObjectContext:self.parserManagedObjectContext
                                                                     qualificationID:qualificationID];
        
        if (!qualification)
        {
            qualification = [CDFInsertService insertNewObjectForEntityClass:[GOJQualification self]
                                                     inManagedObjectContext:self.parserManagedObjectContext];
            
            qualification.qualificationID = qualificationID;
        }
        
        /*-------------------*/
        
        NSDictionary *country = qualificationResponse[@"country"];
        
        if ([GOJValueOrDefault valueIsNotNil:country])
        {
            GOJCountryParser *countryParser = [GOJCountryParser parserWithManagedObjectContext:self.parserManagedObjectContext];
            
            qualification.country = [countryParser parseCountry:country];
        }
        
        /*-------------------*/
        
        // protection for nil
        qualification.link = [GOJValueOrDefault value:qualificationResponse[@"link"]
                                            orDefault:qualification.link];
        
        qualification.name = [GOJValueOrDefault value:qualificationResponse[@"name"]
                                            orDefault:qualification.link];
        
        NSArray *subjectsArray = qualificationResponse[@"subjects"];
        
        if ([GOJValueOrDefault valueIsNotNil:subjectsArray])
        {
            GOJSubjectParser *subjectParser = [GOJSubjectParser parserWithManagedObjectContext:self.parserManagedObjectContext];
            
            NSArray *subjects = [subjectParser parseSubjects:subjectsArray];
            
            for (GOJSubject *subject in subjects)
            {
                subject.qualification = qualification;
            }
        }
    }

    return qualification;
}

@end
