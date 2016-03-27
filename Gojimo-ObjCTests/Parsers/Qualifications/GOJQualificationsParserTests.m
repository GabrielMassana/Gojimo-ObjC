//
//  GOJQualificationsParserTests.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 26/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <CoreDataFullStack/CoreDataFullStack.h>

#import "GOJQualificationsParser.h"
#import "GOJQualification.h"
#import "GOJCountry.h"

@interface GOJQualificationsParserTests : XCTestCase <CDFCoreDataManagerDelegate>

@property (nonatomic, strong) GOJQualificationsParser *parser;

@property (nonatomic, strong) NSArray *qualificationsJSON;
@property (nonatomic, strong) NSArray *qualificationsEmptyJSON;

@property (nonatomic, strong) NSDictionary *qualificationJSON;
@property (nonatomic, strong) NSDictionary *qualificationUpdatedJSON;
@property (nonatomic, strong) NSDictionary *qualificationEmptyJSON;
@property (nonatomic, strong) NSDictionary *qualificationOnlyIDJSON;

@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *countryCreated_at;
@property (nonatomic, strong) NSString *countryLink;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *countryOpdated_at;
@property (nonatomic, strong) NSString *qualificationId;
@property (nonatomic, strong) NSString *qualificationLink;
@property (nonatomic, strong) NSString *qualificationName;
@property (nonatomic, strong) NSString *subjectId;
@property (nonatomic, strong) NSString *qualificationNameUpdated;

@end

@implementation GOJQualificationsParserTests

#pragma mark - TestSuiteLifecycle

- (void)setUp
{
    [super setUp];
    
    self.parser = [GOJQualificationsParser parserWithManagedObjectContext:[CDFCoreDataManager sharedInstance].managedObjectContext];
    
    self.countryCode = @"US";
    self.countryCreated_at = @"2014-04-12T10:06:33.000Z";
    self.countryLink = @"/api/v4/countries/US";
    self.countryName = @"United States";
    self.countryOpdated_at = @"2014-04-12T10:06:33.000Z";
    self.qualificationId = @"04ec172d-0c8f-4c09-94b4-d797b9481171";
    self.qualificationLink = @"/api/v4/qualifications/04ec172d-0c8f-4c09-94b4-d797b9481171";
    self.qualificationName = @"ASVAB";
    self.subjectId = @"91a1b8dc-1021-4ddd-a498-8d4a3f2dadf6";
    self.qualificationNameUpdated = @"ABCDEFG";

    self.qualificationOnlyIDJSON = @{
                                     @"id" : self.qualificationId,
                                     };
    
    self.qualificationEmptyJSON = @{
                                    };
    self.qualificationJSON = @{
                               @"country" :     @{
                                       @"code" : self.countryCode,
                                       @"created_at" : self.countryCreated_at,
                                       @"link" : self.countryLink,
                                       @"name" : self.countryName,
                                       @"updated_at" : self.countryOpdated_at,
                                       },
                               @"default_products" :     @[],
                               @"id" : self.qualificationId,
                               @"link" : self.qualificationLink,
                               @"name" : self.qualificationName,
                               @"subjects" :     @[
                                       @{
                                           @"colour" : @"<null>",
                                           @"id" : self.subjectId,
                                           @"link" : @"/api/v4/subjects/91a1b8dc-1021-4ddd-a498-8d4a3f2dadf6",
                                           @"title" : @"Music",
                                           },
                                       @{
                                           @"colour" : @"#F1F1F1",
                                           @"id" : @"79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                           @"link" : @"/api/v4/subjects/79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                           @"title" : @"Latin",
                                           }
                                       ],
                               };
    
    self.qualificationUpdatedJSON = @{
                                      @"country" :     @{
                                              @"code" : self.countryCode,
                                              @"created_at" : self.countryCreated_at,
                                              @"link" : self.countryLink,
                                              @"name" : self.countryName,
                                              @"updated_at" : self.countryOpdated_at,
                                              },
                                      @"default_products" :     @[],
                                      @"id" : self.qualificationId,
                                      @"link" : self.qualificationLink,
                                      @"name" : self.qualificationNameUpdated,
                                      @"subjects" :     @[
                                              @{
                                                  @"colour" : @"<null>",
                                                  @"id" : self.subjectId,
                                                  @"link" : @"/api/v4/subjects/91a1b8dc-1021-4ddd-a498-8d4a3f2dadf6",
                                                  @"title" : @"Music",
                                                  },
                                              @{
                                                  @"colour" : @"#F1F1F1",
                                                  @"id" : @"79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                                  @"link" : @"/api/v4/subjects/79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                                  @"title" : @"Latin",
                                                  }
                                              ],
                                      };
    
    self.qualificationsEmptyJSON = @[
                                     ];
    
    self.qualificationsJSON = @[
                                self.qualificationJSON,
                                @{
                                    @"country" :     @{
                                            @"code" : self.countryCode,
                                            @"created_at" : self.countryCreated_at,
                                            @"link" : self.countryLink,
                                            @"name" : self.countryName,
                                            @"updated_at" : self.countryOpdated_at,
                                            },
                                    @"default_products" :     @[],
                                    @"id" : @"00000000-1111-2222-3333-444455556666",
                                    @"link" : self.qualificationLink,
                                    @"name" : self.qualificationName,
                                    @"subjects" :     @[
                                            @{
                                                @"colour" : @"<null>",
                                                @"id" : self.subjectId,
                                                @"link" : @"/api/v4/subjects/91a1b8dc-1021-4ddd-a498-8d4a3f2dadf6",
                                                @"title" : @"Music",
                                                },
                                            @{
                                                @"colour" : @"#F1F1F1",
                                                @"id" : @"79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                                @"link" : @"/api/v4/subjects/79ab192a-9cd7-4d07-859b-6e8f4668ddfa",
                                                @"title" : @"Latin",
                                                }
                                            ],
                                    }
                                ];
}

- (void)tearDown
{
    [[CDFCoreDataManager sharedInstance] reset];
    
    self.parser = nil;
    
    self.countryCode = nil;
    self.countryCreated_at = nil;
    self.countryLink = nil;
    self.countryName = nil;
    self.countryOpdated_at = nil;
    self.qualificationId = nil;
    self.qualificationLink = nil;
    self.qualificationName = nil;
    self.subjectId = nil;
    self.qualificationNameUpdated = nil;
    
    self.qualificationOnlyIDJSON = nil;
    self.qualificationEmptyJSON = nil;
    self.qualificationJSON = nil;
    
    self.qualificationsEmptyJSON = nil;
    self.qualificationsJSON = nil;
    
    [super tearDown];
}

#pragma mark - CDFCoreDataManagerDelegate

- (NSString *)coreDataModelName
{
    return @"Gojimo";
}

#pragma mark - Qualification

- (void)test_parseQualification_newQualificationObjectReturned
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification, @"A valid GOJQualification object wasn't created");
}

- (void)test_parseQualification_nilQualificationObjectReturned
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationEmptyJSON];
    
    XCTAssertNil(qualification, @"A valid GOJQualification object was created");
}

- (void)test_parseQualification_alreadyInsertedQualificationObjectReturned
{
    GOJQualification *insertedQualification = [CDFInsertService insertNewObjectForEntityClass:[GOJQualification class]
                                                                       inManagedObjectContext:[CDFCoreDataManager sharedInstance].managedObjectContext];
    
    insertedQualification.qualificationID = self.qualificationId;
    
    /*---------------------*/
    
    GOJQualification *returnedQualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertEqualObjects(insertedQualification.objectID, returnedQualification.objectID,  @"Should have returned the existing Qualification");
}

#pragma mark EqualObjects

- (void)test_parseQualification_countryCode
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertEqualObjects(qualification.country.code, self.countryCode, @"countryCode was not properly set. Was set to: %@ rather than: %@", qualification.country.code, self.countryCode);
}

- (void)test_parseQualification_qualificationID
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertEqualObjects(qualification.qualificationID, self.qualificationId, @"qualificationID was not properly set. Was set to: %@ rather than: %@", qualification.qualificationID, self.qualificationId);
}

- (void)test_parseQualification_link
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertEqualObjects(qualification.link, self.qualificationLink, @"link was not properly set. Was set to: %@ rather than: %@", qualification.link, self.qualificationLink);
}

- (void)test_parseQualification_name
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertEqualObjects(qualification.name, self.qualificationName, @"name was not properly set. Was set to: %@ rather than: %@", qualification.name, self.qualificationName);
}

#pragma mark NotNil

- (void)test_parseQualification_countryCode_NotNil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification.country, @"countryCode was not set");
}

- (void)test_parseQualification_qualificationID_NotNil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification.qualificationID, @"qualificationID was not set");
}

- (void)test_parseQualification_link_NotNil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification.link, @"link was not set");
}

- (void)test_parseQualification_name_NotNil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification.name, @"name was not set");
}

- (void)test_parseQualification_subjects_NotNil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationJSON];
    
    XCTAssertNotNil(qualification.subjects, @"subjects was not set");
}

#pragma mark Nil

- (void)test_parseQualification_countryCode_Nil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationOnlyIDJSON];
    
    XCTAssertNil(qualification.country, @"countryCode was not set");
}

- (void)test_parseQualification_link_Nil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationOnlyIDJSON];
    
    XCTAssertNil(qualification.link, @"link was not set");
}

- (void)test_parseQualification_name_Nil
{
    GOJQualification *qualification = [self.parser parseQualification:self.qualificationOnlyIDJSON];
    
    XCTAssertNil(qualification.name, @"name was not set");
}

#pragma mark Updated

- (void)test_parseQualification_nameUpdated
{
    [self.parser parseQualification:self.qualificationJSON];
    GOJQualification *qualificationUpdated = [self.parser parseQualification:self.qualificationUpdatedJSON];

    XCTAssertEqualObjects(qualificationUpdated.name, self.qualificationNameUpdated, @"name was not properly set. Was set to: %@ rather than: %@", qualificationUpdated.name, self.qualificationNameUpdated);
}

#pragma mark - Qualifications

- (void)test_parseQualification_arrayReturned
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsJSON];
    
    XCTAssertNotNil(qualifications, @"A valid array object wasn't created");
}

- (void)test_parseQualification_arrayReturned2
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsEmptyJSON];
    
    XCTAssertNotNil(qualifications, @"A valid array object wasn't created");
}

- (void)test_parseQualification_arrayCount
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsJSON];
    
    XCTAssertEqualObjects(@(qualifications.count), @(self.qualificationsJSON.count), @"Parsed qualifications count is wrong");
}

- (void)test_parseQualification_arrayCountEmpty
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsEmptyJSON];
    
    XCTAssertEqualObjects(@(qualifications.count), @(self.qualificationsEmptyJSON.count), @"Parsed qualifications count is wrong");
}

- (void)test_parseQualification_uniqueObjects
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsJSON];
    
    XCTAssertNotEqualObjects(qualifications.firstObject, qualifications.lastObject, @"Parsed array without different objects");
}

- (void)test_parseQualification_arrayWithSameOrderFirstObject
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsJSON];
    
    GOJQualification *firstObjectParsed = qualifications.firstObject;
    NSDictionary *firstObject = self.qualificationsJSON.firstObject;
    
    XCTAssertEqualObjects(firstObjectParsed.qualificationID, firstObject[@"id"], @"Should have the same id: %@", firstObjectParsed.qualificationID);
}

- (void)test_parseQualification_arrayWithSameOrderLastObject
{
    NSArray *qualifications = [self.parser parseQualifications:self.qualificationsJSON];
    
    GOJQualification *lastObjectParsed  = qualifications.lastObject;
    NSDictionary *lastObject = self.qualificationsJSON.lastObject;
    
    XCTAssertEqualObjects(lastObjectParsed.qualificationID, lastObject[@"id"], @"Should have the same id: %@", lastObjectParsed.qualificationID);
}

@end
