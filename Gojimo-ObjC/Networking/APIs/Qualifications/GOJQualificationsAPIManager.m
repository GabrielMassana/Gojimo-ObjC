//
//  GOJQualificationsAPIManager.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsAPIManager.h"

#import <CoreNetworking/CoreNetworking.h>

#import "GOJQualificationsRequest.h"

@implementation GOJQualificationsAPIManager

+ (void)retrieveQualificationsWithSuccess:(GOJNetworkingOnSuccess)success
                                  failure:(GOJNetworkingOnFailure)failure
{
    GOJQualificationsRequest *request = [GOJQualificationsRequest qualificationsrequest];
    
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
            
            //Parse json
            NSLog(@"json = %@", json);
            NSLog(@"json = %@", @(json.count));
            
            // Call parse operation
            
            if (success)
            {
                success(nil);
            }
        }
    };
    
    [task resume];
}

@end
