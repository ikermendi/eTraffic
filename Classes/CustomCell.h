//
//  CustomCell.h
//  table
//
//  Created by Iker Mendilibar Fernandez on 31/01/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
	IBOutlet UILabel *titulo;
	IBOutlet UIImageView *imagen1;
	IBOutlet UIImageView *imagen2;
}

@property (nonatomic,retain) UILabel *titulo;
@property (nonatomic,retain) UIImageView *imagen1;
@property (nonatomic,retain) UIImageView *imagen2;
@end
