//
//  UIFont+GOJFont.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "UIFont+GOJFont.h"

@implementation UIFont (GOJFont)

+ (UIFont *)goj_tradeGothicLightWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"TradeGothic-Light"
                           size:size * [GOJDeviceSizeService sharedInstance].resizeFactor];
}

+ (UIFont *)goj_tradeGothicLTWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"TradeGothicLT"
                           size:size * [GOJDeviceSizeService sharedInstance].resizeFactor];
}

+ (UIFont *)goj_tradeGothicNo2BoldWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"TradeGothicNo.2-Bold"
                           size:size * [GOJDeviceSizeService sharedInstance].resizeFactor];
}

@end
