//
//  GOJQualificationsLoadingView.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsLoadingView.h"

@interface GOJQualificationsLoadingView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end

@implementation GOJQualificationsLoadingView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
//        self.backgroundColor = [UIColor goj_alto];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.spinner];
    }
    
    return self;
}

#pragma mark - Subviews

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel newAutoLayoutView];
        
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:20.0f];
        _titleLabel.textColor = [UIColor goj_scorpion];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 8;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"DOWNLOADING\nQUALIFICATIONS", nil)];
        
        [attributedText addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range: NSMakeRange(0,
                                                  attributedText.length)];
        
        _titleLabel.attributedText = attributedText;
    }
    
    return _titleLabel;
}

- (UIActivityIndicatorView *)spinner
{
    if (!_spinner)
    {
        _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        [_spinner startAnimating];
    }
    
    return _spinner;
}

#pragma mark - Constraints

- (void)updateConstraints
{
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    
    [self.titleLabel autoSetDimension:ALDimensionHeight
                               toSize:60.0f];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop
                                      withInset:220.0 * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*----------------*/
    
    [self.spinner autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.spinner autoPinEdge:ALEdgeBottom
                       toEdge:ALEdgeTop
                       ofView:self.titleLabel
                   withOffset:-10.0 * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*----------------*/
    
    [super updateConstraints];
}

@end
