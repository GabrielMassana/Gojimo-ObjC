//
//  GOJParser.m
//  Gojimo-ObjC
//
//  Created by Gabriel Massana on 23/3/16.
//  Copyright © 2016 Gabriel Massana. All rights reserved.
//

#import "GOJParser.h"

@interface GOJParser ()

@property (nonatomic, strong, readwrite) NSManagedObjectContext *parserManagedObjectContext;

@end

@implementation GOJParser

+ (instancetype)parserWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    GOJParser *parser = [[self.class alloc] init];
    parser.parserManagedObjectContext = managedObjectContext;
    
    return parser;
}

@end
