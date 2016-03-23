//
//  ViewController.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJQualificationsViewController.h"

#import "GOJQualificationsAPIManager.h"

@interface GOJQualificationsViewController ()

@end

@implementation GOJQualificationsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [GOJQualificationsAPIManager retrieveQualificationsWithSuccess:^(id result)
    {
        
    }
                                                           failure:^(NSError *error)
    {
        
    }];
}

@end
