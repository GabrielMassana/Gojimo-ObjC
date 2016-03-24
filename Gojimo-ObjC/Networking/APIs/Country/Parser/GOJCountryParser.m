//
//  GOJCountryParser.m
//  Gojimo-ObjC
//
//  Created by GabrielMassana on 24/03/2016.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJCountryParser.h"

#import "GOJCountry.h"

@implementation GOJCountryParser

- (GOJCountry *)parseCountry:(NSDictionary *)countryResponse
{
    NSString *countryCode = countryResponse[@"code"];
    
    GOJCountry *country = [GOJCountry fetchCountryWithManagedObjectContext:self.parserManagedObjectContext
                                                               countryCode:countryCode];
    
    if (!country)
    {
        country = [CDFInsertService insertNewObjectForEntityClass:[GOJCountry self]
                                           inManagedObjectContext:self.parserManagedObjectContext];
        
        country.code = countryCode;
    }
    
    // TODO: Check nills
    
    country.name = countryResponse[@"name"];
    country.link = countryResponse[@"link"];
    country.createdAt = [[NSDateFormatter goj_dateFormatter] dateFromString:countryResponse[@"created_at"]];
    country.updatedAt = [[NSDateFormatter goj_dateFormatter] dateFromString:countryResponse[@"updated_at"]];
    
    return country;
}

@end
