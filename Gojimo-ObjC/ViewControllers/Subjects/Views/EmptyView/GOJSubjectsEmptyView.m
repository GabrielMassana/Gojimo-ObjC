//
//  GOJSubjectsEmptyView.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJSubjectsEmptyView.h"

@interface GOJSubjectsEmptyView ()

/**
 Title text Label with information for the empty view.
 */
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation GOJSubjectsEmptyView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor goj_alto];
        
        [self addSubview:self.titleLabel];
    }
    
    return self;
}

#pragma mark - Subviews

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel newAutoLayoutView];
        
        _titleLabel.backgroundColor = [UIColor goj_alto];
        _titleLabel.numberOfLines = 3;
        _titleLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:20.0f];
        _titleLabel.textColor = [UIColor goj_scorpion];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 8;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"🙈 Wops!\nNo Subjects for this Qualification!\nSorry! 😇", nil)];
        
        [attributedText addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range: NSMakeRange(0,
                                                  attributedText.length)];
        
        _titleLabel.attributedText = attributedText;
    }
    
    return _titleLabel;
}

#pragma mark - Constraints

- (void)updateConstraints
{
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop
                                      withInset:200.0 * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*----------------*/

    [super updateConstraints];
}

@end
