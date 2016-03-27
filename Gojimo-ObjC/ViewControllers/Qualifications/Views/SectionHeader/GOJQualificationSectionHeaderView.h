//
//  GOJQualificationSectionHeaderView.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GOJCountry;

@interface GOJQualificationSectionHeaderView : UIView

/**
 Main init for the qualificationsection header view.
 
 @param frame - view frame.
 @param countryName - the nameof the country to be showed.
 */
- (instancetype)initWithFrame:(CGRect)frame countryName:(NSString *)countryName;

@end
