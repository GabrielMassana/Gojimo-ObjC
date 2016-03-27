//
//  GOJQualificationsParserOperation.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

@interface GOJQualificationsParserOperation : COMOperation

/**
 Operation to handle the parse of the qualifications data on a background thread.
 
 @param qualificationsResponse - a full API response for qualifications.
 */
- (instancetype)initWithQualifications:(NSArray *)qualificationsResponse;

@end
