//
//  GOJAPIManager.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GOJNetworkingOnFailure)(NSError * error);
typedef void (^GOJNetworkingOnSuccess)(id result);

@interface GOJAPIManager : NSObject

@property (nonatomic, copy) GOJNetworkingOnFailure onFailure;
@property (nonatomic, copy) GOJNetworkingOnSuccess onSuccess;

@end
