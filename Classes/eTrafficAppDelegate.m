//
//  tableAppDelegate.m
//  table
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "eTrafficAppDelegate.h"
#import "RootViewController.h"
#import "XMLToObjectParser.h"
#import "cargandoViewController.h"
#import "LeyendaViewController.h"
#import "item.h"


@implementation eTrafficAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize cargandoController;
@synthesize myParser;
@synthesize leyendaController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	//[imagen release];
	[NSThread detachNewThreadSelector:@selector(parser) toTarget:self withObject:nil];

	// Configure and show the window
	[window addSubview:[cargandoController view]];
	[window makeKeyAndVisible];
}

-(void)parser
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *opcion = [[NSUserDefaults standardUserDefaults] stringForKey:@"comunidad"];
	NSString *dire = [[NSString alloc] initWithString: @"http://infocar.dgt.es/etraffic/rss_ca_"];
	dire = [dire stringByAppendingString:opcion];
	dire = [dire stringByAppendingString:@".xml"];
	NSLog(@"Opcion antes: %i",[opcion retainCount]);
	myParser = [[XMLToObjectParser alloc] parseXMLAtURL:[NSURL URLWithString:dire] toObject:@"item" parseError:nil];
	int n = [[myParser items] count];
	for(int i=0;i<n; ++i)
	{
		[[[myParser items] objectAtIndex:i] parseFotos];
		[[[myParser items] objectAtIndex:i] parseTitulo];
	}
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:1.25];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:YES];
	[navigationController viewWillAppear:YES];
	[cargandoController viewWillDisappear:YES];
	[cargandoController.view removeFromSuperview];
	[window insertSubview:navigationController.view atIndex:1];
	[cargandoController viewDidDisappear:YES];
	[navigationController viewDidAppear:YES];
	[UIView commitAnimations];
	[pool release];
}

-(void)info:(id)sender
{
	LeyendaViewController *leyendaView = [[LeyendaViewController alloc] initWithNibName:@"LeyendaView" bundle:[NSBundle mainBundle]];
	self.leyendaController = leyendaView;
	[leyendaView release];
	[navigationController pushViewController:self.leyendaController animated:YES];
}

-(NSMutableArray *)items
{
	return [myParser items];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[cargandoController release];
	[navigationController release];
	[window release];
	[myParser release];
	[super dealloc];
}

@end
