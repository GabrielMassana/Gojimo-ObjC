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

/**
 Method to configure the cell with a given qualification.
 
 @param qualification - qualification to update the cell.
 */
- (void)configureWithQualification:(GOJQualification *)qualification;

@end
