//
//  GOJQualificationsAdapter.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GOJQualification.h"

@protocol GOJQualificationsAdapterDelegate <NSObject>

/**
 Callback for when the user selects one qualification.
 
 @param qualification - the selected qualification.
 */
- (void)didSelectQualification:(GOJQualification *)qualification;

@end

@interface GOJQualificationsAdapter : NSObject

/**
 Delegate
 */
@property (nonatomic, weak) id<GOJQualificationsAdapterDelegate> delegate;

/**
 Table view to display data.
 */
@property (nonatomic, strong) GOJTableView *tableView;

@end
