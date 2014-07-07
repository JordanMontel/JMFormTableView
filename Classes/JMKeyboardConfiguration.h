//
//  JMKeyboardConfiguration.h
//  JMFormTableView
//
//  Created by Jordan Montel on 07/07/2014.
//  Copyright (c) 2014 Jordan Montel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMKeyboardConfiguration : NSObject

// Custom Methods
+ (UIKeyboardAppearance)keyboardAppearanceFromString:(NSString *)aString;
+ (UIKeyboardType)keyboardTypeFromString:(NSString *)aString;
+ (UIReturnKeyType)returnKeyTypeFromString:(NSString *)aString;

@end
