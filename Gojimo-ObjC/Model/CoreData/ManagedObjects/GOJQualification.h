//
//  GOJQualifications.h
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface GOJQualification : NSManagedObject

+ (instancetype)fetchQualificationWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                           qualificationID:(NSString *)qualificationID;

@end

NS_ASSUME_NONNULL_END

#import "GOJQualification+CoreDataProperties.h"
