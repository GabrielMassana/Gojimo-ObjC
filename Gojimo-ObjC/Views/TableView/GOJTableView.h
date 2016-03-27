//
//  GOJTableView.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOJTableView : UITableView

/**
 View to display when the Data Source View is empty.
 */

@property (nonatomic, strong) UIView *emptyView;
/**
 View to display when the Data Source View is loading.
 */
@property (nonatomic, strong) UIView *loadingView;

/**
 Notify the tableView that the loading is starting.
 */
- (void)willLoadContent;

/**
 Notify the tableView that the loading has finished.
 
 @param hasData - YES if there is data in the tableView, NO otherwise.
 */
- (void)didFinishLoadingContent:(BOOL)hasData;

@end
