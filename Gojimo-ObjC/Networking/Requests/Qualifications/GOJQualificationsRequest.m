//
//  GOJQualificationsRequest.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsRequest.h"

@implementation GOJQualificationsRequest

+ (instancetype)qualificationsRequest
{
    GOJQualificationsRequest *request = [self requestForAPI];
    
    request.URL = [NSURL URLWithString:@"https://api.gojimo.net/api/v4/qualifications"];
    
    return request;
}

@end
