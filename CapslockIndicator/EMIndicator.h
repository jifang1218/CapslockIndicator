//
//  EMIndicator.h
//  CapslockIndicator
//
//  Created by Ji Fang on 7/10/15.
//  Copyright (c) 2015 EaseMob Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EMKeyboard;

@interface EMIndicator : NSObject

- (BOOL)toggleCapsLock:(NSUInteger)keyboardId;
- (BOOL)toggleNumberLock:(NSUInteger)keyboardId;
- (BOOL)toggleInsert:(NSUInteger)keyboardId;
- (EMKeyboard *)findKeyboard:(NSUInteger)keyboardId;

@property (nonatomic, strong) NSArray *keyboards;
@property (nonatomic) NSUInteger activeKeyboardId;

@end
