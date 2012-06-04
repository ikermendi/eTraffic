//
//  RootViewController.h
//  table
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformacionViewController.h"

@interface RootViewController : UITableViewController{
	NSMutableArray *listData;
	InformacionViewController *informacionViewController;
}
@property (nonatomic,retain) NSMutableArray *listData;
@property (nonatomic,retain) InformacionViewController *informacionViewController;
@end
