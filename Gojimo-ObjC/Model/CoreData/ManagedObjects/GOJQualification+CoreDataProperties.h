//
//  GOJQualification+CoreDataProperties.h
//  
//
//  Created by Gabriel Massana on 25/3/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOJQualification.h"

@class GOJQualificationsFeed;
@class GOJCountry;
@class GOJSubject;

NS_ASSUME_NONNULL_BEGIN

@interface GOJQualification (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *qualificationID;
@property (nullable, nonatomic, retain) GOJCountry *country;
@property (nullable, nonatomic, retain) GOJQualificationsFeed *feed;
@property (nullable, nonatomic, retain) NSSet<GOJSubject *> *subjects;

@end

@interface GOJQualification (CoreDataGeneratedAccessors)

- (void)addSubjectsObject:(GOJSubject *)value;
- (void)removeSubjectsObject:(GOJSubject *)value;
- (void)addSubjects:(NSSet<GOJSubject *> *)values;
- (void)removeSubjects:(NSSet<GOJSubject *> *)values;

@end

NS_ASSUME_NONNULL_END
