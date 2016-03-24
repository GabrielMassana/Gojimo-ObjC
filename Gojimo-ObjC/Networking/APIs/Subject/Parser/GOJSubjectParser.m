//
//  GOJSubjectParser.m
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJSubjectParser.h"

#import "GOJSubject.h"

@implementation GOJSubjectParser

- (NSArray *)parseSubjects:(NSArray *)subjectsResponse
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:subjectsResponse.count];
    
    for (NSDictionary *subject in subjectsResponse)
    {
        GOJSubject *aSubject = [self parseSubject:subject];
        
        if (aSubject)
        {
            [array addObject:aSubject];
        }
    }
    
    return array;
}

- (GOJSubject *)parseSubject:(NSDictionary *)subjectResponse
{
    NSString *subjectID = subjectResponse[@"id"];

    GOJSubject *subject = nil;
    
    if ([GOJValueOrDefault valueIsNotNil:subjectID])
    {
        
    }
    
    return subject;
}

@end
