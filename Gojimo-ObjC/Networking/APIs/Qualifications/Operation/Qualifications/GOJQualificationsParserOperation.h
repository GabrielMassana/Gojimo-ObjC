//
//  GOJQualificationsParserOperation.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <CoreOperation/CoreOperation.h>

@interface GOJQualificationsParserOperation : COMOperation

- (instancetype)initWithQualifications:(NSArray *)qualificationsResponse;

@end
