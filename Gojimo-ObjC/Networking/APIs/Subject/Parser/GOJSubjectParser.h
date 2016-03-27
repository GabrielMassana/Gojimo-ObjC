//
//  GOJSubjectParser.h
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJParser.h"

@interface GOJSubjectParser : GOJParser

/**
 Parser for an array of subjects.
 
 @param subjectsResponse - an array with subjects from the API service.
 
 @return an array with GOJSubject objects.
 */
- (NSArray *)parseSubjects:(NSArray *)subjectsResponse;

@end
