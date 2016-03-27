//
//  GOJQualificationsTableViewCell.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationTableViewCell.h"

#import "GOJQualification.h"

@interface GOJQualificationTableViewCell ()

/**
 Separation line for the cells.
 */
@property (nonatomic, strong) UIView *separationLine;

/**
 Qualification name label.
 */
@property (nonatomic, strong) UILabel *nameLabel;

/**
 Total number of subjects for this qualification Label.
 */
@property (nonatomic, strong) UILabel *totalSubjects;

@end

@implementation GOJQualificationTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self.contentView addSubview:self.separationLine];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.totalSubjects];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

#pragma mark - Configure

- (void)configureWithQualification:(GOJQualification *)qualification
{
    self.nameLabel.text = qualification.name;
    
    if (qualification.subjects)
    {
        self.totalSubjects.text = [NSString stringWithFormat:@"%@: %@" , NSLocalizedString(@"Total subjects", nil), @(qualification.subjects.count)];
    }
    else
    {
        self.totalSubjects.text = NSLocalizedString(@"Sorry, no subjects. 😇", nil);
    }
    
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

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [UILabel newAutoLayoutView];
        
        _nameLabel.font = [UIFont goj_tradeGothicLTWithSize:20.0f];
        _nameLabel.textColor = [UIColor blackColor];
    }
    
    return _nameLabel;
}

- (UILabel *)totalSubjects
{
    if (!_totalSubjects)
    {
        _totalSubjects = [UILabel newAutoLayoutView];
        
        _totalSubjects.font = [UIFont goj_tradeGothicLightWithSize:15.0f];
        _totalSubjects.textColor = [UIColor goj_scorpion];
    }
    
    return _totalSubjects;
}

#pragma mark - Constraints

- (void)updateConstraints
{
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop
                                     withInset:10.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft
                                     withInset:5.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    /*-------------------*/
    
    [self.totalSubjects autoPinEdgeToSuperviewEdge:ALEdgeBottom
                                     withInset:10.0f * [GOJDeviceSizeService sharedInstance].resizeFactor];
    
    [self.totalSubjects autoPinEdgeToSuperviewEdge:ALEdgeLeft
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

@end
