//
//  EMIndicatorUI.m
//  CapslockIndicator
//
//  Created by Ji Fang on 7/10/15.
//  Copyright (c) 2015 EaseMob Inc. All rights reserved.
//

#import "EMIndicatorUI.h"
#import "EMIndicator.h"
#import <AppKit/AppKit.h>

static const NSInteger kExitMenuItem = 100;
static NSString *kExitText = @"Exit";
static NSString *kExitKeyEquivalent = @"q";

static const NSInteger kToggleMenuItem = kExitMenuItem + 1;
static NSString *kToggleText = @"Toggle";
static NSString *kToggleKeyEquivalent = @"t";

static const NSUInteger kKeyEquivalentModifierMask = NSCommandKeyMask;

@interface EMIndicatorUI() {
    NSStatusItem *_statusItem;
    BOOL _isCapOn;
    NSArray *_keyboards;
    
    EMIndicator *_indicator;
}

- (void)setupStatusbar;
- (void)setupKeyboard;
- (void)setupIndicators;

- (void)menuItemAction:(NSMenuItem *)menuItem;
- (void)toggleCapslock;

@end

@implementation EMIndicatorUI

- (id)init {
    if (self=[super init]) {
        _indicator = [[EMIndicator alloc] init];
    }
    
    return self;
}

- (void)setupStatusbar {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    NSMenu *menu = nil;
    menu = [[NSMenu alloc] initWithTitle:@""];
    
    NSMenuItem *item = nil;
    // toggle
    item = [[NSMenuItem alloc] initWithTitle:kToggleText
                                      action:@selector(menuItemAction:)
                               keyEquivalent:kToggleKeyEquivalent];
    [item setKeyEquivalentModifierMask:kKeyEquivalentModifierMask];
    [item setTarget:self];
    item.tag = kToggleMenuItem;
    [menu addItem:item];
    
    // exit
    item = [[NSMenuItem alloc] initWithTitle:kExitText
                                      action:@selector(menuItemAction:)
                               keyEquivalent:kExitKeyEquivalent];
    [item setKeyEquivalentModifierMask:kKeyEquivalentModifierMask];
    [item setTarget:self];
    item.tag = kExitMenuItem;
    [menu addItem:item];
    [_statusItem setMenu:menu];
}

- (void)setupKeyboard {
//    NSArray *keyboards = [DDHidKeyboard allKeyboards];
//    for (DDHidKeyboard *keyboard in keyboards) {
//        [keyboard setDelegate:self];
//        [keyboard startListening];
//    }
//    _keyboards = keyboards;
}

- (void)setupIndicators {
    // capslock
    _isCapOn?[_statusItem setTitle:@"A"]:[_statusItem setTitle:@"a"];
}

- (void)menuItemAction:(NSMenuItem *)menuItem {
    if (menuItem.tag == kExitMenuItem) {
        [self doUninit];
        exit(0);
    } else if (menuItem.tag == kToggleMenuItem) {
        [self toggleCapslock];
    }
}

- (void)toggleCapslock {
    [_indicator toggleCapsLock:_indicator.activeKeyboardId];
}

- (void)doUninit {
    // stop keyboard queues.
//    for (DDHidKeyboard *keyboard in _keyboards) {
//        [keyboard stopListening];
//        [keyboard setDelegate:nil];
//    }
    
    // remove from statusbar.
    [[NSStatusBar systemStatusBar] removeStatusItem:_statusItem];
}

- (void)doInit {
    [self setupStatusbar];
    [self setupKeyboard];
    [self setupIndicators];
}

@end
