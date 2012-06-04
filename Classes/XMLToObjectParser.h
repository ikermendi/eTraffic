//
//  XMLToObjectParser.h
//  Parser
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMLToObjectParser : NSObject {
	NSString *className;
	NSMutableArray *items;
	NSObject *ite; // stands for any class    
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
	Boolean dentro;
}
- (NSMutableArray *)items;
- (id)parseXMLAtURL:(NSURL *)url toObject:(NSString *)aClassName parseError:(NSError **)error;
@end
