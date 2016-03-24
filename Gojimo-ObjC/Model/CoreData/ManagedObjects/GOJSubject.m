//
//  GOJSubject.m
//  
//
//  Created by GabrielMassana on 24/03/2016.
//
//

#import "GOJSubject.h"
#import "GOJQualification.h"

@implementation GOJSubject

+ (instancetype)fetchSubjectWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                           subjectID:(NSString *)subjectID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"subjectID MATCHES %@", subjectID];
    
    GOJSubject *subject = [CDFRetrievalService retrieveFirstEntryForEntityClass:[GOJSubject self]
                                                                      predicate:predicate
                                                           managedObjectContext:managedObjectContext];
    
    return subject;
}

@end
