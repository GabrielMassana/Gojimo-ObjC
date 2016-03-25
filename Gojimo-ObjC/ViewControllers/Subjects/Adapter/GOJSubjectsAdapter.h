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

@property (nonatomic, strong) UITableView *tableView;

- (instancetype)initWithQualification:(GOJQualification *)qualification;

@end
