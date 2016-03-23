//
//  GOJRequest.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJRequest.h"

@implementation GOJRequest

+ (instancetype)requestForAPI
{
    GOJRequest *request = [self request];
    
    return request;
}

- (void)updateRequestWithEndpoint:(NSString *)endpoint
{

}

@end
