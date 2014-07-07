//
//  TableCell.h
//  JMFormTableView
//
//  Created by Jordan Montel on 03/07/2014.
//  Copyright 2014 Jordan Montel. All rights reserved.
//

#define TableCell_ID     @"TableCellID"
#define TableCell_HEIGHT 44
#define TableCell_XIB    @"TableCell"

#define TITLE_KEY                @"title"
#define KEYBOARD_APPEARANCE      @"keyboardAppearance"
#define KEYBOARD_TYPE_KEY        @"keyboardType"
#define KEYBOARD_RETURN_TYPE_KEY @"returnKeyType"

@interface TableCell : UITableViewCell

// Custom Methods
- (void)configureCellWithData:(NSDictionary *)aDic;

// Property
@property (nonatomic, strong) NSDictionary *currentData;

// IBOutlet
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end
