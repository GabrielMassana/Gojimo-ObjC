//
//  GOJQualificationsAdapter.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GOJQualificationsAdapterDelegate <NSObject>

@end

@interface GOJQualificationsAdapter : NSObject

@property (nonatomic, weak) id<GOJQualificationsAdapterDelegate> delegate;

@property (nonatomic, strong) UITableView *tableView;

@end
