//
//  GOJTableViewCell.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOJTableViewCell : UITableViewCell

/**
 Retrieves the reuse Identifier for the Cell.
 */
+ (NSString *)reuseIdentifier;

/**
 Trigger auto layout calls.
 */
- (void)layoutByApplyingConstraints;

@end
