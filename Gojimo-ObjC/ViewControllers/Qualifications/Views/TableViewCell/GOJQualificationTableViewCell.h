//
//  GOJQualificationsTableViewCell.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJTableViewCell.h"

@class GOJQualification;

@interface GOJQualificationTableViewCell : GOJTableViewCell

- (void)configureWithQualification:(GOJQualification *)qualification;

@end
