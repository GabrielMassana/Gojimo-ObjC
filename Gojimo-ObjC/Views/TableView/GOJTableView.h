//
//  GOJTableView.h
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOJTableView : UITableView


@property (nonatomic, strong) UIView *emptyView;
@property (nonatomic, strong) UIView *loadingView;

- (void)willLoadContent;

- (void)didFinishLoadingContent:(BOOL)hasData;

@end
