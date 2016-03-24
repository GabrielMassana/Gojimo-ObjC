//
//  GOJQualification+CoreDataProperties.h
//  
//
//  Created by GabrielMassana on 24/03/2016.
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

@property (nullable, nonatomic, retain) NSString *qualificationID;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) GOJQualificationsFeed *feed;
@property (nullable, nonatomic, retain) GOJCountry *country;
@property (nullable, nonatomic, retain) GOJSubject *subjects;

@end

NS_ASSUME_NONNULL_END
