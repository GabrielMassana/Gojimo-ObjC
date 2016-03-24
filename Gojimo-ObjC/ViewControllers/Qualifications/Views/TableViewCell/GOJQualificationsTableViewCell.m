//
//  GOJQualificationsTableViewCell.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 24/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsTableViewCell.h"

#import "GOJQualification.h"

@implementation GOJQualificationsTableViewCell

#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
    }
    
    return self;
}

#pragma mark - Update

- (void)configureWithQualification:(GOJQualification *)qualification
{
    self.textLabel.text = qualification.name;
}

#pragma mark - Subviews

#pragma mark - Constraints

- (void)updateConstraints
{
    
    /*-------------------*/
    

    
    /*-------------------*/
    
    [super updateConstraints];
}

#pragma mark - PrepareForReuse

- (void)prepareForReuse
{
    [super prepareForReuse];
}

@end
