//
//  TableCell.m
//  JMFormTableView
//
//  Created by Jordan Montel on 03/07/2014.
//  Copyright 2014 Jordan Montel. All rights reserved.
//

#import "TableCell.h"

@interface TableCell ()

// IBOutlet
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation TableCell

#pragma mark - Custom Methods
- (void)configureCellWithData:(NSDictionary *)aDic
{
	_labelTitle.text = [aDic objectForKey:PLIST_TITLE_KEY];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setInputAccessoryView:[self getToolbarWithDoneEnabled:YES]];
}

#pragma mark - Keyboard customisations
- (UIToolbar *)getToolbarWithDoneEnabled:(BOOL)doneEnabled
{
    // Create toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    // Items
    NSMutableArray *toolbarItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolbarItems addObject:flexSpace];
    
    // Done button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneTouched)];
    [toolbarItems addObject:doneButton];
    
    toolbar.items = toolbarItems;
    
    // Color
    toolbar.tintColor       = [UIColor blueColor];
    toolbar.backgroundColor = [UIColor whiteColor];
    
    return toolbar;
}

- (void)doneTouched
{
    [self.textField resignFirstResponder];
}

@end