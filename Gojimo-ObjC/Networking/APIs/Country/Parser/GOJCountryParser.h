//
//  GOJCountryParser.h
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJParser.h"

@class GOJCountry;

@interface GOJCountryParser : GOJParser

- (GOJCountry *)parseCountry:(NSDictionary *)countryResponse;

@end
