//
//  GOJQualificationsAPIManager.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJAPIManager.h"

@interface GOJQualificationsAPIManager : GOJAPIManager

+ (void)retrieveQualificationsWithSuccess:(GOJNetworkingOnSuccess)success
                                  failure:(GOJNetworkingOnFailure)failure;

@end
