//
//  AppController.h
//  Clock
//
//  Created by Zach Waugh on 2/15/08.
//  Copyright 2008 zachwaugh.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ClockView;
@class ClockWindow;

@interface ClockAppController : NSObject <NSApplicationDelegate>
{
	IBOutlet ClockView *clockView;
	IBOutlet ClockWindow *clockWindow;
	NSTimer *timer;
}

@property (strong) ClockView *clockView;
@property (strong) ClockWindow *clockWindow;
@property (strong) NSTimer *timer;

@end
