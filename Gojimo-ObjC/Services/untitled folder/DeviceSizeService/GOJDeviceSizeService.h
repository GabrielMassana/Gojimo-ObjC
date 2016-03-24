//
//  GOJDeviceSizeService.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOJDeviceSizeService : NSObject

/**
 The factor should be used to resize assets and fonts.
 */
@property (nonatomic, assign, readonly) CGFloat resizeFactor;

/**
 Singleton.
 */
+ (instancetype)sharedInstance;

@end
