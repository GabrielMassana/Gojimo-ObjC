//
//  GOJQualificationsParser.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJParser.h"

@class GOJQualification;

@interface GOJQualificationsParser : GOJParser

/**
 Parser for an array of qualifications.
 
 @param qualificationsResponse - an array with qualifications from the API service.
 
 @return an array with GOJQualification objects.
 */
- (NSArray *)parseQualifications:(NSArray *)qualificationsResponse;

/**
 Parser for a single qualifications.
 
 @param qualificationResponse - a qualification dictionary from the API service.
 
 @return a GOJQualification object.
 */
- (GOJQualification *)parseQualification:(NSDictionary *)qualificationResponse;

@end
