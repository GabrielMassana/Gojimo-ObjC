//
//  GOJSubject.h
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GOJQualification;

NS_ASSUME_NONNULL_BEGIN

@interface GOJSubject : NSManagedObject

+ (instancetype)fetchSubjectWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                           subjectID:(NSString *)subjectID;

@end

NS_ASSUME_NONNULL_END

#import "GOJSubject+CoreDataProperties.h"
