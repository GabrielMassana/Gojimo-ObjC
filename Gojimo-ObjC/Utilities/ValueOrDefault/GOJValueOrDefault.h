//
//  GOJValueOrDefault.h
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOJValueOrDefault : NSObject

/**
 Returns the value if it is not nil. Otherwise retirns the defaultValue.
 
 @param value - data to be returned if it is not nil.
 @param defaultValue - data to be returned if value is nil.
 
 @return value or defaultValue.
 */
+ (id)value:(id)value orDefault:(id)defaultValue;


/**
 Checks if value is nil.
 
 @param value - data to checked.
 
 @return value if is not nil. Nil otherwise.
 */
+ (id)valueIsNotNil:(id)value;

@end
