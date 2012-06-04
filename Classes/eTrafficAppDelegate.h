//
//  tableAppDelegate.h
//  table
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLToObjectParser.h"


@interface eTrafficAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
	UIViewController *cargandoController;
	UIViewController *leyendaController;
	XMLToObjectParser *myParser;
}
-(NSMutableArray *)items;
-(IBAction)info:(id)sender;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIViewController *cargandoController;
@property (nonatomic, retain) IBOutlet UIViewController *leyendaController;
@property (nonatomic, retain) XMLToObjectParser *myParser;
@end

