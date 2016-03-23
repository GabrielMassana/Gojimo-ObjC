//
//  GOJParser.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreDataFullStack/CoreDataFullStack.h>

/**
 Abstract parser instance with a class function to init it.
 */
@interface GOJParser : NSObject

/**
 Convenience alloc/init that will return a parser instance.
 
 @param managedObjectContext - context that will be used to access and create NSManagedObject subclasses.
 
 @return GOJParser instance.
 */
+ (instancetype)parserWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 Context that will be used to access and create NSManagedObject subclasses.
 */
@property (nonatomic, strong, readonly) NSManagedObjectContext *parserManagedObjectContext;

@end
