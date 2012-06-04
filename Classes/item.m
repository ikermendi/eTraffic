//
//  Contact.m
//  Parser
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "item.h"

@implementation item

@synthesize title;
@synthesize link;
@synthesize pubDate;
@synthesize description;
@synthesize guid;
@synthesize dibujo1;
@synthesize dibujo2;
@synthesize titulo;
@synthesize subTitulo;
@synthesize mostrar;
@synthesize xPoint;
@synthesize yPoint;

- (void)parseFotos {
	
    NSScanner *theScanner;
    NSString *text = [[NSString alloc] init];
	int cont=0;
	int num=2;
    theScanner = [NSScanner scannerWithString:[self description]];
	
    while (num) {
		
        // find start of tag
        [theScanner scanUpToString:@"http://" intoString:NULL] ; 
		
        // find end of tag
        [theScanner scanUpToString:@".gif" intoString:&text] ;
		text = [text stringByAppendingString:@".gif"];
		if(cont==1)
		{
			self.dibujo2 = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:text]]];
			cont=0;
		} else {
			self.dibujo1 = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:text]]];
		}
		num--;
		cont++;
    }

}

- (void)parseTitulo {
	
    NSScanner *theScanner;
    NSString *text = nil;
	NSString *tmp = [[NSString alloc] initWithString:description];
	NSRange rango;
    theScanner = [NSScanner scannerWithString:tmp];
	
    while ([theScanner isAtEnd] == NO) {
		
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
		          // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
		
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        tmp = [tmp stringByReplacingOccurrencesOfString:
				[ NSString stringWithFormat:@"%@>", text]
											   withString:@" "];
	}
	tmp = [tmp stringByReplacingOccurrencesOfString:@"    " withString:@" "];
	tmp = [tmp stringByReplacingOccurrencesOfString:@"   " withString:@" "];
	tmp = [tmp stringByReplacingOccurrencesOfString:@"  " withString:@" "];
	
	rango = [tmp rangeOfString:@"2009"];


	titulo = [[NSString alloc] initWithString:[[tmp substringFromIndex:1] substringToIndex:(rango.location+4)]];
	subTitulo = [[NSString alloc] initWithString:[tmp substringFromIndex:(rango.location+5)]];
	
	rango = [titulo rangeOfString:@" - "];
	mostrar = [[NSString alloc] initWithString:[[titulo substringFromIndex:0] substringToIndex:(rango.location)]];
	[self parseCoordenadas];
}

-(void) parseCoordenadas
{
	NSRange rango;
	NSString *body = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:self.link]];
	rango = [body rangeOfString:@"new GLatLng( "];
	if(rango.length!=0)
	{
		body = [body substringFromIndex:(rango.location+13)];
		rango = [body rangeOfString:@")"];
		body = [[body substringFromIndex:0] substringToIndex:(rango.location)];
		rango = [body rangeOfString:@","];
		yPoint = [[body substringFromIndex:(rango.location+1)] floatValue];
		xPoint = [[[body substringFromIndex:0] substringToIndex:(rango.location)] floatValue];
	}
}


@end
