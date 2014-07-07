//
//  TableViewController.m
//  JMFormTableView
//
//  Created by Jordan Montel on 03/07/2014.
//  Copyright 2014 Jordan Montel. All rights reserved.
//

#import "TableViewController.h"
#import "TableCell.h"
#import "TextFieldFormElement.h"

#define PLIST_FILE_NAME @"Data"

@interface TableViewController ()

// Property
@property (nonatomic, strong) NSMutableArray             *data;
@property (nonatomic, strong) UINib                      *cellNib;
@property (nonatomic, strong) JMEnhancedKeyboardDelegate *enhancedKeyboard;
@property (nonatomic, assign) NSInteger                  currentIndex;

// IBOutlet
@property (nonatomic, weak) IBOutlet TableCell *loadedCell;

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
    
    // Init keyboard
    self.enhancedKeyboard          = [[JMEnhancedKeyboardDelegate alloc] init];
    self.enhancedKeyboard.delegate = self;
    
    // Init data
    self.data = [[NSMutableArray alloc] init];
    
    // Temporary data
    NSArray *temporaryData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PLIST_FILE_NAME ofType:@"plist"]];

    // Set data
    for (NSDictionary *dic in temporaryData)
    {
        TextFieldFormElement *textFieldFormElement = [[TextFieldFormElement alloc] init];
        textFieldFormElement.currentData           = dic;
        
        // Add data
        [_data addObject:textFieldFormElement];
    }
    
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
    
    // Pass delegate
    cell.textField.delegate = self;
	
	// Configure cell with data
	[cell configureCellWithData:[[_data objectAtIndex:indexPath.row] currentData]];
    
    // Configure TextFieldForm
    TextFieldFormElement *textFieldFormElement = [_data objectAtIndex:indexPath.row];
    textFieldFormElement.textField             = cell.textField;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TableCell_HEIGHT;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // Current cell
    TableCell *cell = (TableCell *)textField.superview.superview.superview;
    
    if (_currentIndex == 0)
    {
        // Set index
        _currentIndex = [[self.tableView indexPathForCell:cell] row];
        
        // Scroll to index
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }

    // Set keyboard toolbar
    if (_currentIndex == 0)
        [textField setInputAccessoryView:[self.enhancedKeyboard configureToolbarWithPreviousEnabled:NO nextEnabled:YES doneEnabled:YES]];
    else if (_currentIndex == _data.count-1)
        [textField setInputAccessoryView:[self.enhancedKeyboard configureToolbarWithPreviousEnabled:YES nextEnabled:NO doneEnabled:YES]];
    else
        [textField setInputAccessoryView:[self.enhancedKeyboard configureToolbarWithPreviousEnabled:YES nextEnabled:YES doneEnabled:YES]];
}

#pragma mark - JMEnhancedKeyboardDelegate
- (void)nextKeyboardAction
{
    // Increment index
    if (_currentIndex < self.data.count-1)
        _currentIndex++;
    
    // First responder
    [[[self.data objectAtIndex:_currentIndex] textField] becomeFirstResponder];
    
    // Scroll to index
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)previousKeyboardAction
{
    // Decrement index
    if (_currentIndex > 0)
        _currentIndex--;
    
    // First responder
    [[[self.data objectAtIndex:_currentIndex] textField] becomeFirstResponder];
    
    // Scroll to index
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_currentIndex inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)doneKeyboardAction
{
    // Resign keyboard
    [[[self.data objectAtIndex:_currentIndex] textField] resignFirstResponder];
    
    // Reset index
    _currentIndex = 0;
}

@end
