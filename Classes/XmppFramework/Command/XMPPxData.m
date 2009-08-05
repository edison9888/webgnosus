//
//  XMPPData.m
//  webgnosus
//
//  Created by Troy Stribling on 3/29/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import "XMPPxData.h"
#import "NSXMLElementAdditions.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface XMPPxData (PrivateAPI)

- (NSMutableDictionary*)hashifyFields:(NSXMLElement*)structElement;

@end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation XMPPxData

//-----------------------------------------------------------------------------------------------------------------------------------

//===================================================================================================================================
#pragma mark XMPPxData

//-----------------------------------------------------------------------------------------------------------------------------------
+ (XMPPxData*)createFromElement:(NSXMLElement*)element {
	XMPPxData* result = (XMPPxData*)element;
	result->isa = [XMPPxData class];
	return result;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (XMPPxData*)init {
	if(self = [super initWithName:@"x"]) {
        [self addNamespace:[NSXMLNode namespaceWithName:@"" stringValue:@"jabber:x:data"]];
	}
	return self;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (XMPPxData*)initWithDataType:(NSString*)dataType {
	if([self init]) {
		[self addDataType:dataType];
	}
	return self;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSString*)dataType {
    return [[self attributeForName:@"type"] stringValue];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)addDataType:(NSString*)val {
    [self addAttributeWithName:@"type" stringValue:val];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSMutableDictionary*)fields {
    return [self hashifyFields:self];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)addField:(NSString*)fieldVal withValue:(NSString*)val {
    [self addAttributeWithName:@"type" stringValue:val];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSMutableArray*)reported {
    NSArray* reportedElements = [[self elementForName:@"reported"]  elementsForName:@"field"];
    NSMutableArray* reportedArray = [[NSMutableArray alloc] initWithCapacity:[reportedElements count]];
    if (reportedElements) {
        for(int i = 0; i < [reportedElements count]; i++) {
            NSXMLElement* reportedElement = [reportedElements objectAtIndex:i];
            [reportedArray addObject:[[reportedElement attributeForName:@"var"] stringValue]];
        }
    }
    return reportedArray;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSMutableArray*)items {
    NSArray* itemElementArray = [self elementsForName:@"item"];
    NSMutableArray* itemArray = [[NSMutableArray alloc] initWithCapacity:[itemElementArray count]];
    if (itemElementArray) {
        for(int i = 0; i < [itemElementArray count]; i++) {
            [itemArray addObject:[self hashifyFields:[itemElementArray objectAtIndex:i]]];
        }
    }
    return itemArray;
}

//===================================================================================================================================
#pragma mark XMPPxData PrivateAPI

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSMutableDictionary*)hashifyFields:(NSXMLElement*)fieldsElement {
    NSArray* fieldArray = [fieldsElement elementsForName:@"field"];
    NSMutableDictionary* fieldHash = [[NSMutableDictionary alloc] initWithCapacity:[fieldArray count]];
    if (fieldArray) {
        for(int i = 0; i < [fieldArray count]; i++) {
            NSXMLElement* fieldElement = [fieldArray objectAtIndex:i];
            NSString* field = [[fieldElement attributeForName:@"var"] stringValue];
            if (!field) {
                field = [[NSString alloc] initWithString:@"field"];
            }
            NSArray* valElements = [fieldElement elementsForName:@"value"];
            if (valElements) {
                NSMutableArray* vals = [[NSMutableArray alloc] initWithCapacity:[valElements count]];
                for(int i = 0; i < [valElements count]; i++) {
                    [vals addObject:[[valElements objectAtIndex:i] stringValue]];
                }
                [fieldHash setObject:vals forKey:field];
            }
        }
    }
    return fieldHash;
}

@end
