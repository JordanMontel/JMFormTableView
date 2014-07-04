//
//  JMEnhancedKeyboardDelegate.h
//  IFDIS-Sport
//
//  Created by Jordan Montel on 02/07/2014.
//  Copyright (c) 2014 Jordan Montel. All rights reserved.
//

@protocol JMEnhancedKeyboardDelegate <NSObject>
- (void)nextKeyboardAction;
- (void)previousKeyboardAction;
- (void)doneKeyboardAction;
@end

@interface JMEnhancedKeyboardDelegate : NSObject

// Property
@property (nonatomic, strong) id <JMEnhancedKeyboardDelegate> delegate;
@property (nonatomic, strong) UIColor *colorBackgroundToolBar;
@property (nonatomic, strong) UIColor *colorButtons;

// Custom Methods
- (UIToolbar *)getToolbarWithPreviousEnabled:(BOOL)previousEnabled nextEnabled:(BOOL)nextEnabled doneEnabled:(BOOL)doneEnabled;

@end
