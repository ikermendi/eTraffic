//
//  XMLToObjectParser.m
//  Parser
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "XMLToObjectParser.h"


@implementation XMLToObjectParser

- (NSMutableArray *)items
{
	return items;
}

- (id)parseXMLAtURL:(NSURL *)url toObject:(NSString *)aClassName parseError:(NSError **)error
{
	[items release];
	items = [[NSMutableArray alloc] init];
	
	className = aClassName;
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[parser setDelegate:self];
	
	[parser parse];
	
	if([parser parserError] && error) {
		*error = [parser parserError];
	}
	dentro=false;
	[parser release];
	
	return self;
}



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	//NSLog(@"Open tag: %@", elementName);
	
	if([elementName isEqualToString:className]) {
		dentro=true;
		ite = [[NSClassFromString(className) alloc] init];
	}
	else {
		currentNodeName = [elementName copy];
		currentNodeContent = [[NSMutableString alloc] init];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	//NSLog(@"Close tag: %@", elementName);
	
	if([elementName isEqualToString:className]) {
		[items addObject:ite];
		[ite release];
		ite = nil;
	}
	else if([elementName isEqualToString:currentNodeName] && dentro) {
		[ite setValue:currentNodeContent forKey:elementName];
		
		[currentNodeContent release];
		currentNodeContent = nil;
		
		[currentNodeName release];
		currentNodeName = nil;
	}
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{   
	[currentNodeContent appendString:string];
}

- (void)dealloc
{
	[items release];
	[super dealloc];
}

@end