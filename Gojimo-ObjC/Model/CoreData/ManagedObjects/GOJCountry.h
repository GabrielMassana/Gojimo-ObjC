//
//  GOJCountry.h
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GOJQualification;

NS_ASSUME_NONNULL_BEGIN

@interface GOJCountry : NSManagedObject

+ (instancetype)fetchCountryWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                         countryCode:(NSString *)countryCode;

@end

NS_ASSUME_NONNULL_END

#import "GOJCountry+CoreDataProperties.h"
