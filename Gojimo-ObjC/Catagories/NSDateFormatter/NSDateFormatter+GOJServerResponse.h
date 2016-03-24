//
//  NSDateFormatter+GOJServerResponse.h
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (GOJServerResponse)

/**
 Date Formatter to parse date strings returned in JSON.
 
 @return NSDateFormatter instance.
 */
+ (NSDateFormatter *)goj_dateFormatter;

@end
