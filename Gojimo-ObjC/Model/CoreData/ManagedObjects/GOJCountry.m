//
//  GOJCountry.m
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//

#import "GOJCountry.h"
#import "GOJQualification.h"

@implementation GOJCountry

+ (instancetype)fetchCountryWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                         countryCode:(NSString *)countryCode
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"code MATCHES %@", countryCode];
    
    GOJCountry *country = [CDFRetrievalService retrieveFirstEntryForEntityClass:[GOJCountry self]
                                                                                  predicate:predicate
                                                                       managedObjectContext:managedObjectContext];
    
    return country;
}

@end
