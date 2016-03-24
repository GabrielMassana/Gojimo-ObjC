//
//  GOJValueOrDefault.h
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOJValueOrDefault : NSObject

+ (id)value:(id)value orDefault:(id)defaultValue;

+ (id)valueIsNotNil:(id)value;

@end
