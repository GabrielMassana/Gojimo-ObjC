//
//  GOJTableView.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJTableView.h"

@interface GOJTableView ()

/**
 Indicates that loading actions have finished
 */
@property (nonatomic, assign) BOOL didFinishLoadingContentActions;

@end

@implementation GOJTableView

#pragma mark - ReloadData

- (void)reloadData
{
    [super reloadData];
    
    if (self.loadingView)
    {
        [self updateLoadingView];
    }
    else
    {
        [self updateEmptyView];
    }
}

#pragma mark - LayoutSubviews

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.loadingView)
    {
        if (!self.loadingView.superview)
        {
            [self updateLoadingView];
        }
        
        [self bringSubviewToFront:self.loadingView];
    }
    else
    {
        if (!self.emptyView.superview)
        {
            [self updateEmptyView];
        }
        
        [self bringSubviewToFront:self.emptyView];
    }
}

#pragma mark - EndUpdates

- (void)endUpdates
{
    [super endUpdates];
    
    if (self.loadingView)
    {
        [self updateLoadingView];
    }
    
    [self updateEmptyView];
}

#pragma mark - HasData

- (BOOL)hasData
{
    BOOL hasData = NO;

    NSUInteger numberOfRowsInSection = [self numberOfRowsInSection:0];
    
    if (self.numberOfSections)
    {
        if (numberOfRowsInSection > 0)
        {
            hasData = YES;
        }
    }
    
    
    
    return hasData;
}

#pragma mark - EmptyView

- (void)updateEmptyView
{
    if (self.emptyView)
    {
        if ([self hasData])
        {
            [UIView animateWithDuration:0.5
                             animations:^
             {
                 self.emptyView.alpha = 0.0f;
             }
                             completion:^(BOOL finished)
             {
                 [self.emptyView removeFromSuperview];
             }];
        }
        else
        {
            self.emptyView.alpha = 0.0f;
            [self addSubview:self.emptyView];
            [self.emptyView updateConstraints];
            
            [UIView animateWithDuration:0.5
                             animations:^
             {
                 self.emptyView.alpha = 1.0f;
             }];
        }
    }
}

#pragma mark - LoadingView

- (void)updateLoadingView
{
    if (self.loadingView)
    {
        if (self.didFinishLoadingContentActions ||
            [self hasData])
        {
            [UIView animateWithDuration:0.5
                             animations:^
             {
                 self.loadingView.alpha = 0.0f;
             }
                             completion:^(BOOL finished)
             {
                 [self.loadingView removeFromSuperview];
             }];
        }
        else
        {
            self.loadingView.alpha = 0.0f;
            [self addSubview:self.loadingView];
            [self.loadingView updateConstraints];
            
            [UIView animateWithDuration:0.5
                             animations:^
             {
                 self.loadingView.alpha = 1.0f;
             }];
        }
    }
}

#pragma mark - DidFinishLoadingContent

- (void)didFinishLoadingContent:(BOOL)hasData
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.loadingView.superview)
        {
            [UIView animateWithDuration:0.5
                             animations:^
             {
                 self.loadingView.alpha = 0.0f;
             }
                             completion:^(BOOL finished)
             {
                 [self.loadingView removeFromSuperview];
             }];
        }
        
        [self updateEmptyView];
        
        self.didFinishLoadingContentActions = YES;
    });
}

#pragma mark - WillLoadContent

- (void)willLoadContent
{
    self.didFinishLoadingContentActions = NO;
}

@end
