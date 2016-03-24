//
//  GOJSubject+CoreDataProperties.h
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOJSubject.h"

NS_ASSUME_NONNULL_BEGIN

@interface GOJSubject (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *subjectID;
@property (nullable, nonatomic, retain) NSString *colour;
@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) GOJQualification *qualification;

@end

NS_ASSUME_NONNULL_END
