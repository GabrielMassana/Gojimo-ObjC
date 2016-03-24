//
//  GOJCountry+CoreDataProperties.h
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOJCountry.h"

NS_ASSUME_NONNULL_BEGIN

@interface GOJCountry (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSDate *createdAt;
@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSDate *updatedAt;
@property (nullable, nonatomic, retain) NSSet<GOJQualification *> *qualifications;

@end

@interface GOJCountry (CoreDataGeneratedAccessors)

- (void)addQualificationsObject:(GOJQualification *)value;
- (void)removeQualificationsObject:(GOJQualification *)value;
- (void)addQualifications:(NSSet<GOJQualification *> *)values;
- (void)removeQualifications:(NSSet<GOJQualification *> *)values;

@end

NS_ASSUME_NONNULL_END
