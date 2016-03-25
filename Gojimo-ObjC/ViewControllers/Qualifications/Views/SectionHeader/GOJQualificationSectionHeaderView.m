//
//  GOJQualificationSectionHeaderView.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 25/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationSectionHeaderView.h"

#import "GOJCountry.h"

@interface GOJQualificationSectionHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *flagImageView;
@property (nonatomic, strong) NSString *countryName;

@end

@implementation GOJQualificationSectionHeaderView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame countryName:(NSString *)countryName
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.countryName = countryName;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.flagImageView];
        [self addSubview:self.nameLabel];
    }
    
    return self;
}

#pragma mark - Subviews

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [UILabel newAutoLayoutView];
        
        _nameLabel.text = self.countryName;
        _nameLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:15.0];
        _nameLabel.textColor = [UIColor goj_scorpion];
    }
    
    return _nameLabel;
}

- (UIImageView *)flagImageView
{
    if (!_flagImageView)
    {
        _flagImageView = [UIImageView newAutoLayoutView];
        
        _flagImageView.backgroundColor = [UIColor orangeColor];
    }
    
    return _flagImageView;
}

#pragma mark - Constraints

- (void)updateConstraints
{
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
    [self.nameLabel autoPinEdge:ALEdgeLeft
                         toEdge:ALEdgeRight
                         ofView:self.flagImageView
                     withOffset:5.0f];

    /*-------------------*/

    [self.flagImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                         withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.flagImageView autoPinEdgeToSuperviewEdge:ALEdgeTop
                                         withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.flagImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom
                                         withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.flagImageView autoSetDimension:ALDimensionWidth
                                  toSize:(35.0f - 10.0f) * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*-------------------*/

    [super updateConstraints];
}

@end
