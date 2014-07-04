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

@end

@implementation TableCell

#pragma mark - Custom Methods
- (void)configureCellWithData:(NSDictionary *)aDic
{    
    // Hold current data
    _currentData     = aDic;
    
    // Display label
	_labelTitle.text = [aDic objectForKey:PLIST_TITLE_KEY];
}

@end
