//
//  GOJValueOrDefault.m
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJValueOrDefault.h"

@implementation GOJValueOrDefault

+ (id)value:(id)value orDefault:(id)defaultValue;
{
    id returnValue = value;
    
    if (value == [NSNull null])
    {
        returnValue = nil;
    }
    else if (value == nil)
    {
        returnValue = defaultValue;
    }
    
    return returnValue;
}

+ (id)valueIsNotNil:(id)value
{
    id returnValue = value;

    if (value == [NSNull null] ||
        value == nil)
    {
        returnValue = nil;
    }
    
    return returnValue;
}

@end
