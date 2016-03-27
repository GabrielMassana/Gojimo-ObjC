//
//  GOJSubjectsViewController.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GOJQualification;

@interface GOJSubjectsViewController : UIViewController

/**
 Main init for this view controller.
 
 @param qualification -  The GOJQualification to be show in the view controller.
 */
- (instancetype)initWithQualification:(GOJQualification *)qualification;

@end
