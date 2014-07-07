//
//  JMEnhancedKeyboardDelegate.m
//  IFDIS-Sport
//
//  Created by Jordan Montel on 02/07/2014.
//  Copyright (c) 2014 Jordan Montel. All rights reserved.
//

#import "JMEnhancedKeyboardDelegate.h"

@implementation JMEnhancedKeyboardDelegate

- (UIToolbar *)configureToolbarWithPreviousEnabled:(BOOL)previousEnabled nextEnabled:(BOOL)nextEnabled doneEnabled:(BOOL)doneEnabled
{
    // Create toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    // Items
    NSMutableArray *toolbarItems = [[NSMutableArray alloc] init];
    
    // Next/Previous buttons
    UISegmentedControl *leftItems = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"Previous", @""), NSLocalizedString(@"Next", @""), nil]];
    [leftItems setEnabled:previousEnabled forSegmentAtIndex:0];
    [leftItems setEnabled:nextEnabled forSegmentAtIndex:1];
    leftItems.momentary = YES;
    [leftItems addTarget:self action:@selector(nextPreviousButtonsTouched:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextPrevControl = [[UIBarButtonItem alloc] initWithCustomView:leftItems];
    [toolbarItems addObject:nextPrevControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolbarItems addObject:flexSpace];
    
    // Done button
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneDidClick:)];
    [toolbarItems addObject:doneButton];
    
    toolbar.items = toolbarItems;
    
    // Configuration
    toolbar.tintColor       = _colorButtons;
    toolbar.backgroundColor = _colorBackgroundToolBar;
    toolbar.translucent     = _isTranslucent;

    return toolbar;
}

- (void)nextPreviousButtonsTouched:(id)sender
{
    if (!self.delegate)
        return;
    
    switch ([(UISegmentedControl *)sender selectedSegmentIndex])
    {
        case 0:
            [self.delegate previousKeyboardAction];
            break;
        case 1:
            [self.delegate nextKeyboardAction];
            break;
        default:
            break;
    }
}

- (void)doneDidClick:(id)sender
{
    if (!self.delegate)
        return;
    
    [self.delegate doneKeyboardAction];
}

@end
