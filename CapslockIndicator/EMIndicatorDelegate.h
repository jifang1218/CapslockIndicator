//
//  EMIndicatorDelegate.h
//  CapslockIndicator
//
//  Created by Ji Fang on 7/10/15.
//  Copyright (c) 2015 EaseMob Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _EMIndicatorKey {
    EMIndicatorKey_CapsLock = 0,
    EMIndicatorKey_NumberLock,
    EMIndicatorKey_Insert
}EMIndicatorKey;

@protocol EMIndicatorDelegate <NSObject>

@optional
- (void)didKeyChanged:(EMIndicatorKey)key
             newState:(BOOL)isOn
          forKeyboard:(NSUInteger)keyboardId;

@end
