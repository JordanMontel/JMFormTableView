//
//  TableViewController.m
//  JMFormTableView
//
//  Created by Jordan Montel on 03/07/2014.
//  Copyright 2014 Jordan Montel. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"

#define PLIST_FILE_NAME @"Data"

@interface TableViewController ()

// Property
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UINib   *cellNib;

// IBOutlet
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet TableCell   *loadedCell;

@end

@implementation TableViewController

#pragma mark - Constructor
- (id)init
{
	if (self = [super initWithNibName:@"TableViewController" bundle:nil])
	{
		// Custom initialization here
	}
	
	return self;
}

#pragma mark - View management
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load cell nib
    self.cellNib = [UINib nibWithNibName:TableCell_XIB bundle:nil];
    
    // Init data
    self.data = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PLIST_FILE_NAME ofType:@"plist"]];
    
    // Reload table view
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
	return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	id cell = [aTableView dequeueReusableCellWithIdentifier:TableCell_ID];
	
	// If no cell is available, create a new one
	if (!cell)
	{
		// Load cell
		[_cellNib instantiateWithOwner:self
                               options:nil];
		
		cell = _loadedCell;
	}
	
	return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)aTableView willDisplayCell:(UITableViewCell *)aCell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	TableCell *cell = (TableCell *)aCell;
	
	// Configure cell with data
	[cell configureCellWithData:[_data objectAtIndex:indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TableCell_HEIGHT;
}

@end
