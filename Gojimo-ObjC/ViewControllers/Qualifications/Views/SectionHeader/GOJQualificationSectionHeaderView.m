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

/**
 Label to show the name of the country.
 */
@property (nonatomic, strong) UILabel *nameLabel;

/**
 Image view o show the country flag.
 */
@property (nonatomic, strong) UIImageView *flagImageView;

/**
 The country name to be showed.
 */
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
        
        self.backgroundColor = [UIColor goj_alto];
        
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
        _nameLabel.font = [UIFont goj_tradeGothicNo2BoldWithSize:13.0];
        _nameLabel.textColor = [UIColor goj_scorpion];
    }
    
    return _nameLabel;
}

- (UIImageView *)flagImageView
{
    if (!_flagImageView)
    {
        _flagImageView = [UIImageView newAutoLayoutView];
        
        UIImage *image = [UIImage imageNamed:self.countryName];
        
        if (!image)
        {
            image = [UIImage imageNamed:@"United Nations"];
        }
        
        _flagImageView.image = image;
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
    
    [self.flagImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    [self.flagImageView autoSetDimension:ALDimensionWidth
                                  toSize:16.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.flagImageView autoSetDimension:ALDimensionHeight
                                  toSize:16.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*-------------------*/

    [super updateConstraints];
}

@end
