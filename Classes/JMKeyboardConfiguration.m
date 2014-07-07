//
//  JMKeyboardConfiguration.m
//  JMFormTableView
//
//  Created by Jordan Montel on 07/07/2014.
//  Copyright (c) 2014 Jordan Montel. All rights reserved.
//

#import "JMKeyboardConfiguration.h"

@interface JMKeyboardConfiguration ()

// Property
@property (nonatomic, retain) NSDictionary *dicKeyboardAppearance;
@property (nonatomic, retain) NSDictionary *dicKeyboardType;
@property (nonatomic, retain) NSDictionary *dicReturnKeyType;

@end

@implementation JMKeyboardConfiguration

#pragma mark - Singleton
static JMKeyboardConfiguration *sharedInstance;
+ (void)initialize
{
    @synchronized(self)
    {
        if (sharedInstance)
            return;
        sharedInstance = [[JMKeyboardConfiguration alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance
                                                 selector:@selector(singletonApplicationWillTerminate:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
}

- (void)singletonApplicationWillTerminate:(NSNotification*)notification
{
    sharedInstance = nil;
}

#pragma mark - Constructor
- (id)init
{
	if (self = [super init])
	{
        self.dicKeyboardAppearance = @{
                                       @"UIKeyboardAppearanceDefault"    : @(UIKeyboardAppearanceDefault),
                                       @"UIKeyboardAppearanceDark"       : @(UIKeyboardAppearanceDark),
                                       @"UIKeyboardAppearanceLight"      : @(UIKeyboardAppearanceLight),
                                       @"UIKeyboardAppearanceAlert"      : @(UIKeyboardAppearanceAlert)
                                       };
        
        self.dicKeyboardType = @{
                                 @"UIKeyboardTypeDefault"                : @(UIKeyboardTypeDefault),
                                 @"UIKeyboardTypeASCIICapable"           : @(UIKeyboardTypeASCIICapable),
                                 @"UIKeyboardTypeNumbersAndPunctuation"  : @(UIKeyboardTypeNumbersAndPunctuation),
                                 @"UIKeyboardTypeURL"                    : @(UIKeyboardTypeURL),
                                 @"UIKeyboardTypeNumberPad"              : @(UIKeyboardTypeNumberPad),
                                 @"UIKeyboardTypePhonePad"               : @(UIKeyboardTypePhonePad),
                                 @"UIKeyboardTypeNamePhonePad"           : @(UIKeyboardTypeNamePhonePad),
                                 @"UIKeyboardTypeEmailAddress"           : @(UIKeyboardTypeEmailAddress),
                                 @"UIKeyboardTypeDecimalPad"             : @(UIKeyboardTypeDecimalPad),
                                 @"UIKeyboardTypeTwitter"                : @(UIKeyboardTypeTwitter),
                                 @"UIKeyboardTypeWebSearch"              : @(UIKeyboardTypeWebSearch),
                                 @"UIKeyboardTypeAlphabet"               : @(UIKeyboardTypeAlphabet),
                                 };
        
        self.dicReturnKeyType = @{
                                  @"UIReturnKeyDefault"                  : @(UIReturnKeyDefault),
                                  @"UIReturnKeyGo"                       : @(UIReturnKeyGo),
                                  @"UIReturnKeyGoogle"                   : @(UIReturnKeyGoogle),
                                  @"UIReturnKeyJoin"                     : @(UIReturnKeyJoin),
                                  @"UIReturnKeyNext"                     : @(UIReturnKeyNext),
                                  @"UIReturnKeyRoute"                    : @(UIReturnKeyRoute),
                                  @"UIReturnKeySearch"                   : @(UIReturnKeySearch),
                                  @"UIReturnKeySend"                     : @(UIReturnKeySend),
                                  @"UIReturnKeyYahoo"                    : @(UIReturnKeyYahoo),
                                  @"UIReturnKeyDone"                     : @(UIReturnKeyDone),
                                  @"UIReturnKeyEmergencyCall"            : @(UIReturnKeyEmergencyCall),
                                  };
        
	}
    
	return self;
}

#pragma mark - Utils
+ (UIKeyboardAppearance)keyboardAppearanceFromString:(NSString *)aString
{
    if (!aString)
        return UIKeyboardAppearanceDefault;
    
    return [[sharedInstance.dicKeyboardAppearance objectForKey:aString] intValue];
}

+ (UIKeyboardType)keyboardTypeFromString:(NSString *)aString
{
    if (!aString)
        return UIKeyboardTypeDefault;
    
    return [[sharedInstance.dicKeyboardType objectForKey:aString] intValue];
}

+ (UIReturnKeyType)returnKeyTypeFromString:(NSString *)aString
{
    if (!aString)
        return UIReturnKeyDefault;
    
    return [[sharedInstance.dicReturnKeyType objectForKey:aString] intValue];
}

@end
