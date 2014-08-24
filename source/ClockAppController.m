//
//  AppController.m
//  Clock
//
//  Created by Zach Waugh on 2/15/08.
//  Copyright 2008 zachwaugh.com. All rights reserved.
//

#import "ClockAppController.h"
#import "ClockView.h"
#import "ClockWindow.h"

NSString *const kCLKStateKey = @"24-Hour State";
NSString *const ClockStateChangedNotification = @"24-Hour State Changed";

// Private methods
@interface ClockAppController ()

- (void)tick:(NSTimer *)aTimer;
- (void)startClock;
- (void)stopClock;

@end


@implementation ClockAppController

@synthesize clockView, clockWindow, timer;


- (void)awakeFromNib
{	
	[self startClock];
}


- (void)tick:(NSTimer *)aTimer
{
	[self.clockView setNeedsDisplay:YES];
}


- (void)startClock
{
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tick:) userInfo:NULL repeats:YES];
}


- (void)stopClock
{
	[self.timer invalidate];
}

- (IBAction)setMilitaryTime:(NSMenuItem *)sender
{
    NSInteger state = [sender state];

    if (state == NSOnState) {
        self.militaryTimeItem.state = NSOffState;
        [[NSUserDefaults standardUserDefaults] setInteger:NSOffState forKey:kCLKStateKey];
    }
    else if (state == NSOffState) {
        self.militaryTimeItem.state = NSOnState;
        [[NSUserDefaults standardUserDefaults] setInteger:NSOnState forKey:kCLKStateKey];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:ClockStateChangedNotification object:nil];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    NSInteger state = [[NSUserDefaults standardUserDefaults] integerForKey:kCLKStateKey];
    self.militaryTimeItem.state = state;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	// Probably don't really need to do this, but it's good to clean up after ourselves
	[self stopClock];
}


@end
