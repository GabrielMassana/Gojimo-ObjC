//
//  GOJQualificationsFeed.m
//  
//
//  Created by Gabriel Massana on 23/3/16.
//
//

#import "GOJQualificationsFeed.h"

static NSString *const kGOJQualificationsFeedID = @"-1";

@implementation GOJQualificationsFeed

+ (instancetype)fetchQualificationsFeedQithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext feedID:(NSString *)feedID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"feedID MATCHES %@", feedID];
    
    GOJQualificationsFeed *feed = [CDFRetrievalService retrieveFirstEntryForEntityClass:[GOJQualificationsFeed self]
                                                                              predicate:predicate
                                                                   managedObjectContext:managedObjectContext];
    
    [managedObjectContext save:nil];
    
    return feed;
}

+ (instancetype)fetchQualificationsFeedWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    GOJQualificationsFeed *feed = [GOJQualificationsFeed fetchQualificationsFeedQithManagedObjectContext:managedObjectContext
                                                                                                  feedID:kGOJQualificationsFeedID];
    
    if (!feed)
    {
        feed = [CDFInsertService insertNewObjectForEntityClass:[GOJQualificationsFeed self] inManagedObjectContext:managedObjectContext];
        
        feed.qualificationsFeedID = kGOJQualificationsFeedID;
    }
    
    return feed;
}

@end
