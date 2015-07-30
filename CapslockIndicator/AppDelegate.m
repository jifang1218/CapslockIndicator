//
//  AppDelegate.m
//  CapslockIndicator
//
//  Created by Ji Fang on 7/10/15.
//  Copyright (c) 2015 EaseMob Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "EMIndicatorUI.h"

@interface AppDelegate () {
    EMIndicatorUI *_indicatorUI;
}

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _indicatorUI = [[EMIndicatorUI alloc] init];
    [_indicatorUI doInit];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [_indicatorUI doUninit];
}

@end
