//
//  GOJQualifications.m
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//

#import "GOJQualification.h"

@implementation GOJQualification

+ (instancetype)fetchQualificationWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                           qualificationID:(NSString *)qualificationID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"qualificationID MATCHES %@", qualificationID];
    
    GOJQualification *qualification = [CDFRetrievalService retrieveFirstEntryForEntityClass:[GOJQualification self]
                                                                                  predicate:predicate
                                                                       managedObjectContext:managedObjectContext];
    
    return qualification;
}

@end
