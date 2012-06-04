//
//  InformacionViewController.m
//  table
//
//  Created by Iker Mendilibar Fernandez on 31/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "InformacionViewController.h"
#import "eTrafficAppDelegate.h"
#import "item.h"

@implementation InformacionViewController

@synthesize dibujo1;
@synthesize dibujo2;
@synthesize mapa;
@synthesize data;
@synthesize indicador;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	dibujo2.image = (UIImage *)[data dibujo2];
	dibujo1.image = (UIImage *)[data dibujo1];
	float x = [data xPoint];
	float y = [data yPoint];
	NSLog(@"%d",[[NSUserDefaults standardUserDefaults] stringForKey:@"zoom"]);
	NSString *urlStr = 	[NSString stringWithFormat:@"http://www.userland.es/mapa.php?&x=%f&y=%f&zoom=%d",x,y,[[[NSUserDefaults standardUserDefaults] stringForKey:@"zoom"] intValue]];
    [mapa loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
	[super viewDidLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[indicador stopAnimating];
}


-(IBAction)info:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[data titulo]
										message:[data subTitulo] delegate:self
										  cancelButtonTitle:@"Ok"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[data release];
	[dibujo1 release];
	[dibujo2 release];
	[mapa release];
    [super dealloc];
}


@end
