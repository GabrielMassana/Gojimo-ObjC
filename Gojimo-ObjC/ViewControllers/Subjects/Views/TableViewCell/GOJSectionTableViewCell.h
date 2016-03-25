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

- (void)configureWithSubject:(GOJSubject *)subject;

@end
