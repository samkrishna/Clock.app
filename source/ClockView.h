//
//  ClockView.h
//  Clock
//
//  Created by Zach Waugh on 2/15/08.
//  Copyright 2008 zachwaugh.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ClockView : NSView
{
	NSRect textRect;
	NSSize textSize;
	NSColor *backgroundColor;
	NSBezierPath *clipShape;
	NSMutableDictionary *textAttributes;
	NSMutableDictionary *dateAttributes;
}

@property (assign) NSRect textRect;
@property (assign) NSSize textSize;
@property (strong) NSColor *backgroundColor;
@property (strong) NSBezierPath *clipShape;
@property (strong) NSMutableDictionary *textAttributes;
@property (strong) NSMutableDictionary *dateAttributes;

@end
