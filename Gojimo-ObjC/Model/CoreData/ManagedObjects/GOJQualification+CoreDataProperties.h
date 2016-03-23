//
//  GOJQualification+CoreDataProperties.h
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOJQualification.h"

@class GOJQualificationsFeed;

NS_ASSUME_NONNULL_BEGIN

@interface GOJQualification (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *qualificationsID;
@property (nullable, nonatomic, retain) GOJQualificationsFeed *feed;

@end

NS_ASSUME_NONNULL_END
