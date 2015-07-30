//
//  EMIndicator.m
//  CapslockIndicator
//
//  Created by Ji Fang on 7/10/15.
//  Copyright (c) 2015 EaseMob Inc. All rights reserved.
//

#import "EMIndicator.h"
#import "EMIndicatorDelegate.h"
#import "EMKeyboard.h"
#import "DDHidKeyboard.h"

@interface EMIndicator() {
    id<EMIndicatorDelegate> _delegate;
    NSArray *_internalKeyboards;
    BOOL _isStarted;
}

- (void)start;
- (void)stop;
- (void)restart;
- (BOOL)isStarted;

@property (nonatomic, strong) id<EMIndicatorDelegate> delegate;

@end

@implementation EMIndicator

@synthesize keyboards = _keyboards;
@synthesize activeKeyboardId = _activeKeyboardId;

- (void)start {
    if (![self isStarted]) {
        for (DDHidKeyboard *internalKeyboard in _internalKeyboards) {
            [internalKeyboard startListening];
        }
        _isStarted = YES;
    }
}

- (void)stop {
    if ([self isStarted]) {
        for (DDHidKeyboard *internalKeyboard in _internalKeyboards) {
            [internalKeyboard stopListening];
        }
        _isStarted = NO;
    }
}

- (void)restart {
    [self stop];
    [self start];
}

- (BOOL)isStarted {
    BOOL ret = NO;
    
    ret = _isStarted;
    
    return ret;
}

- (BOOL)toggleCapsLock:(NSUInteger)keyboardId {
    BOOL ret = NO;
    
    EMKeyboard *keyboard = [self findKeyboard:keyboardId];
    if (keyboard) {
        keyboard.capsOn = !keyboard.capsOn;
        ret = YES;
    }
    
    return ret;
}

- (BOOL)toggleNumberLock:(NSUInteger)keyboardId {
    BOOL ret = NO;
    
    EMKeyboard *keyboard = [self findKeyboard:keyboardId];
    if (keyboard) {
        keyboard.numberOn = !keyboard.numberOn;
        ret = YES;
    }
    
    return ret;
}

- (BOOL)toggleInsert:(NSUInteger)keyboardId {
    BOOL ret = NO;
    
    EMKeyboard *keyboard = [self findKeyboard:keyboardId];
    if (keyboard) {
        keyboard.insertOn = !keyboard.insertOn;
        ret = YES;
    }
    
    return ret;
}

- (EMKeyboard *)findKeyboard:(NSUInteger)keyboardId {
    EMKeyboard *ret = nil;
    
    for (EMKeyboard *keyboard in _keyboards) {
        if (keyboard.keyboardId == keyboardId) {
            ret = keyboard;
            break;
        }
    }
    
    return ret;
}

@end
