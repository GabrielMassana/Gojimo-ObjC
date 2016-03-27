//
//  GOJSectionTableViewCell.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJSectionTableViewCell.h"

#import "GOJSubject.h"

@interface GOJSectionTableViewCell ()

/**
 Separation line for the cells.
 */
@property (nonatomic, strong) UIView *separationLine;

/**
 Section name label.
 */
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation GOJSectionTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self.contentView addSubview:self.separationLine];
        [self.contentView addSubview:self.titleLabel];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

#pragma mark - Configure

- (void)configureWithSubject:(GOJSubject *)subject
{
    self.titleLabel.text = subject.title;
    
    self.contentView.backgroundColor = [UIColor colorWithHex:subject.colour];
}

#pragma mark - Subviews

- (UIView *)separationLine
{
    if (!_separationLine)
    {
        _separationLine = [UIView newAutoLayoutView];
        
        _separationLine.backgroundColor = [UIColor goj_alto];
    }
    
    return _separationLine;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel newAutoLayoutView];
        
        _titleLabel.font = [UIFont goj_tradeGothicLTWithSize:20.0f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    
    return _titleLabel;
}

#pragma mark - Constraints

- (void)updateConstraints
{
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                      withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*-------------------*/
    
    [self.separationLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    [self.separationLine autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                          withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.separationLine autoPinEdgeToSuperviewEdge:ALEdgeRight
                                          withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.separationLine autoSetDimension:ALDimensionHeight
                                   toSize:0.5f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*-------------------*/
    
    [super updateConstraints];
}


#pragma mark - PrepareForReuse

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.backgroundColor = [UIColor whiteColor];
}

@end
