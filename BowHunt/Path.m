//
//  Path.m
//  BowHunt
//
//  Created by Cody Creager on 4/22/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Path.h"

@implementation Path

-(void)drawPath:(CGContextRef)context forTurn:(int)turn
{
	NSString* str;
	
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
	CGContextSetLineWidth(context, 1);
	
	CGContextMoveToPoint(context, _start.x, _start.y);
	CGContextAddLineToPoint(context, _end.x , _end.y);
	
	CGContextStrokePath(context);
	
	str = [[NSString alloc] initWithFormat:@"Angle:%.2f", atan2((_end.y-_start.y),-(_end.x-_start.x))*180/3.141592653+180];
	
	CGRect bounds = [UIScreen mainScreen].bounds;
	
	CGContextTranslateCTM(context, 0, bounds.size.width);
	CGContextScaleCTM(context, 1, -1);
	CGContextSetRGBFillColor(context, 0, 0, 1, 1);
	CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);
	CGContextSelectFont(context, "Helvetica-Bold", 10.0, kCGEncodingMacRoman);
	CGContextSetCharacterSpacing(context, 1.7);
	CGContextSetTextDrawingMode(context, kCGTextFill);
    
    if (turn == 1) {
        // Draw left side label
        CGContextShowTextAtPoint(context, _end.x-120-30, [UIScreen mainScreen].bounds.size.width - _end.y, [str cStringUsingEncoding:NSUTF8StringEncoding], [str length]);
        [str release];
        str = [[NSString alloc] initWithFormat:@"Velocity:(%.2f,%.2f)", (_start.x-_end.x)/8, (_start.y-_end.y)/8];
        CGContextShowTextAtPoint(context, _end.x-120-30, [UIScreen mainScreen].bounds.size.width - _end.y - 10, [str cStringUsingEncoding:NSUTF8StringEncoding], [str length]);
        
        [str release];
    }
    else if (turn == 0) {
        // Draw right side label
        CGContextShowTextAtPoint(context, _end.x+15, [UIScreen mainScreen].bounds.size.width - _end.y, [str cStringUsingEncoding:NSUTF8StringEncoding], [str length]);
        [str release];
        str = [[NSString alloc] initWithFormat:@"Velocity:(%.2f,%.2f)", (_start.x-_end.x)/8, (_start.y-_end.y)/8];
        CGContextShowTextAtPoint(context, _end.x+15, [UIScreen mainScreen].bounds.size.width - _end.y - 10, [str cStringUsingEncoding:NSUTF8StringEncoding], [str length]);
        
        [str release];
    }
	
	
	// draw the text for angle and power
}

@end
