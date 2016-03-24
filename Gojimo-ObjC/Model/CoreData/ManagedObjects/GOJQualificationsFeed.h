//
//  GOJQualificationsFeed.h
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GOJQualificationsFeed : NSManagedObject

+ (instancetype)fetchQualificationsFeedWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "GOJQualificationsFeed+CoreDataProperties.h"
