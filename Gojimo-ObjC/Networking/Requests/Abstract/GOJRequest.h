//
//  GOJRequest.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <CoreNetworking/CoreNetworking.h>

@interface GOJRequest : CNMRequest

+ (instancetype)requestForAPI;

- (void)updateRequestWithEndpoint:(NSString *)endpoint;

@end
