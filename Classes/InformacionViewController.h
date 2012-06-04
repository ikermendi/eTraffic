//
//  InformacionViewController.h
//  table
//
//  Created by Iker Mendilibar Fernandez on 31/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "item.h"


@interface InformacionViewController : UIViewController {
	item *data;
	IBOutlet UIImageView *dibujo1;
	IBOutlet UIImageView *dibujo2;
	IBOutlet UIWebView *mapa;
	IBOutlet UIActivityIndicatorView *indicador;

}

-(IBAction)info:(id)sender;

@property (nonatomic,retain) UIImageView *dibujo1;
@property (nonatomic,retain) UIImageView *dibujo2;
@property (nonatomic,retain) UIWebView *mapa;
@property (nonatomic,retain) UIActivityIndicatorView *indicador;
@property (nonatomic,retain) item *data;
@end
