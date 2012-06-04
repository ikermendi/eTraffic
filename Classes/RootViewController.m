//
//  RootViewController.m
//  table
//
//  Created by Iker Mendilibar Fernandez on 29/01/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "RootViewController.h"
#import "eTrafficAppDelegate.h"
#import "item.h"
#import "CustomCell.h"

@implementation RootViewController
@synthesize listData;
@synthesize informacionViewController;


- (void)viewDidLoad {
	self.title = @"eTraffic";
	eTrafficAppDelegate *appDelegate = (eTrafficAppDelegate *)[[UIApplication sharedApplication] delegate];
	listData = [[NSMutableArray alloc] initWithArray:[appDelegate items]];
	NSLog(@"No a petado");
	if([self.listData count] == 0)
	{
		NSArray *comunidades = [NSArray arrayWithObjects:
								@"Anadalucía", @"Aragón", @"Canarias", @"Cantabria", @"Castilla y León",
								@"Castilla-La Mancha", @"Cataluña", @"Ceuta", @"Madrid", @"Navarra",
								@"Valencia", @"Extremadura", @"Galicia", @"Illes Balears", @"La Rioja",
								@"Melilla", @"País Vasco", @"Asturías", @"Murcia", nil];
		NSString *opcion = [[NSUserDefaults standardUserDefaults] stringForKey:@"comunidad"];
		NSString *texto = [NSString stringWithFormat:@"%@ no tiene ninguna incidencia registrada.",[comunidades objectAtIndex:([opcion intValue]-1)]];	
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Información"
														message:texto delegate:self
											  cancelButtonTitle:@"Ok"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}	
	NSLog(@"No a petado2");
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)viewWillAppear:(BOOL)animated {
	// Update the view with current data before it is displayed
	[super viewWillAppear:animated];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSLog(@"return: %d",[self.listData count]);
	return [self.listData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"CustomCellIdentifier";
	
	CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
		cell = [nib objectAtIndex:0];
		[cell.titulo setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	}
	NSInteger row = [indexPath row];
	NSLog(@"Row: %d",row);
	cell.imagen1.image = (UIImage *)[[listData objectAtIndex:row] dibujo1];
	cell.imagen2.image = (UIImage *)[[listData objectAtIndex:row] dibujo2];
	cell.titulo.text = [[listData objectAtIndex:row] mostrar];
	return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	NSUInteger row = [indexPath row];
	if([[listData objectAtIndex:row] xPoint] == 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[listData objectAtIndex:row] titulo]
											  message:[[listData objectAtIndex:row] subTitulo] delegate:self
											  cancelButtonTitle:@"Ok"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	} else {
		InformacionViewController *informacionView = [[InformacionViewController alloc] initWithNibName:@"InformacionView" bundle:[NSBundle mainBundle]];
		self.informacionViewController = informacionView;
		[informacionView release];
		informacionView.data = [listData objectAtIndex:row];
		[self.navigationController pushViewController:self.informacionViewController animated:YES];
	}

}

- (void)dealloc {
	[super dealloc];
}

@end

