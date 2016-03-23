//
//  GOJQualificationsFeed+CoreDataProperties.h
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOJQualificationsFeed.h"

NS_ASSUME_NONNULL_BEGIN

@class GOJQualification;

@interface GOJQualificationsFeed (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *qualificationsFeedID;
@property (nullable, nonatomic, retain) NSSet<GOJQualification *> *qualifications;

@end

@interface GOJQualificationsFeed (CoreDataGeneratedAccessors)

- (void)addQualificationsObject:(GOJQualification *)value;
- (void)removeQualificationsObject:(GOJQualification *)value;
- (void)addQualifications:(NSSet<GOJQualification *> *)values;
- (void)removeQualifications:(NSSet<GOJQualification *> *)values;

@end

NS_ASSUME_NONNULL_END
