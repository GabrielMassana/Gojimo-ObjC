//
//  GOJQualificationsAPIManager.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsAPIManager.h"

#import "GOJQualificationsRequest.h"
#import "GOJQualificationsParserOperation.h"

@implementation GOJQualificationsAPIManager

+ (void)retrieveQualificationsWithSuccess:(GOJNetworkingOnSuccess)success
                                  failure:(GOJNetworkingOnFailure)failure
{
    GOJQualificationsRequest *request = [GOJQualificationsRequest qualificationsRequest];
    
    CNMURLSessionDataTask *task = [[CNMSession defaultSession] dataTaskFromRequest:request];

    task.onCompletion = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        if (error)
        {
            NSLog(@"error = %@", error);
            
            if (failure)
            {
                failure(error);
            }
        }
        else
        {
            // Raw data to JSON.
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:nil];
            
            // Call parse operation
            GOJQualificationsParserOperation *operation = [[GOJQualificationsParserOperation alloc] initWithQualifications:json];
            operation.operationQueueIdentifier = GOJLocalDataOperationQueueTypeIdentifier;
            
            operation.onSuccess = ^(id result)
            {
                if (success)
                {
                    success(result);
                }
            };
            
            [[COMOperationQueueManager sharedInstance] addOperation:operation];
        }
    };
    
    [task resume];
}

@end
