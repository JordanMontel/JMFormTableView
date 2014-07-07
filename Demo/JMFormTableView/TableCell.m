//
//  TableCell.m
//  JMFormTableView
//
//  Created by Jordan Montel on 03/07/2014.
//  Copyright 2014 Jordan Montel. All rights reserved.
//

#import "TableCell.h"
#import "JMKeyboardConfiguration.h"

@interface TableCell ()

// IBOutlet
@property (nonatomic, weak) IBOutlet UILabel *labelTitle;

@end

@implementation TableCell

#pragma mark - Custom Methods
- (void)configureCellWithData:(NSDictionary *)aDic
{    
    // Hold current data
    _currentData     = aDic;
    
    // Display label
	_labelTitle.text = [aDic objectForKey:TITLE_KEY];
        
    // Keyboard configurations
    _textField.keyboardAppearance = [JMKeyboardConfiguration keyboardAppearanceFromString:[aDic objectForKey:KEYBOARD_APPEARANCE]];
    _textField.keyboardType  = [JMKeyboardConfiguration keyboardTypeFromString:[aDic objectForKey:KEYBOARD_TYPE_KEY]];
    _textField.returnKeyType = [JMKeyboardConfiguration returnKeyTypeFromString:[aDic objectForKey:KEYBOARD_RETURN_TYPE_KEY]];
}

@end
