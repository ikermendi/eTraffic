//
//  Contact.h
//  Parser
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface item : NSObject {
	NSString *title;
	NSString *link;
	NSString *pubDate;
	NSString *description;
	NSString *guid;
	//Los que se utilizan
	UIImage *dibujo1;
	UIImage *dibujo2;	//punto rojo,verde..
	NSString *titulo;
	NSString *subTitulo; 
	NSString *mostrar; //Texto de las cells
	float xPoint,yPoint;
}
-(void)parseFotos;
-(void)parseTitulo;
-(void)parseCoordenadas;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *guid;
@property (nonatomic, retain) UIImage *dibujo1;
@property (nonatomic, retain) UIImage *dibujo2;
@property (nonatomic, retain) NSString *titulo;
@property (nonatomic, retain) NSString *subTitulo;
@property (nonatomic, retain) NSString *mostrar;
@property (nonatomic,assign) float xPoint;
@property (nonatomic,assign) float yPoint;
@end
