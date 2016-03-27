//
//  NSDateFormatter+GOJServerResponse.m
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "NSDateFormatter+GOJServerResponse.h"

static NSString *const kGOJDateFormatterKey = @"kGOJDateFormatterKey";

@implementation NSDateFormatter (GOJServerResponse)

#pragma mark - DateFormatter

+ (NSDateFormatter *)goj_dateFormatter
{
    if (![NSThread currentThread].threadDictionary[kGOJDateFormatterKey])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_GB"]];
        
        [NSThread currentThread].threadDictionary[kGOJDateFormatterKey] = dateFormatter;
    }
    
    return [NSThread currentThread].threadDictionary[kGOJDateFormatterKey];
}

@end
