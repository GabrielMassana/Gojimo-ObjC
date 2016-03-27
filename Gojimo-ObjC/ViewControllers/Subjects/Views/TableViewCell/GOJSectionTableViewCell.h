//
//  GOJSectionTableViewCell.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJTableViewCell.h"

@class GOJSubject;

@interface GOJSectionTableViewCell : GOJTableViewCell

/**
 Method to configure the cell with a given subject.
 
 @param subject - subject to update the cell.
 */
- (void)configureWithSubject:(GOJSubject *)subject;

@end
