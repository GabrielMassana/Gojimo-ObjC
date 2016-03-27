//
//  GOJSubjectsAdapter.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOJQualification;

@interface GOJSubjectsAdapter : NSObject

/**
 Table view to display data.
 */
@property (nonatomic, strong) GOJTableView *tableView;

/**
 Main init for the adapter with a qualification.
 
 @param qualification - qualification to update the view controller.
 */
- (instancetype)initWithQualification:(GOJQualification *)qualification;

@end
