//
//  Path.m
//  BowHunt
//
//  Created by Cody Creager on 4/22/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Path.h"

@implementation Path

-(void)drawPath:(CGContextRef)context
{
	NSString* str;
	
	CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
	CGContextSetLineWidth(context, 1);
	
	CGContextMoveToPoint(context, _start.x, _start.y);
	CGContextAddLineToPoint(context, _end.x , _end.y);
	
	str = [[NSString alloc] initWithFormat:@"%f", atan2((_end.y-_start.y),(_end.x-_start.x))*180/3.141592653];
	CGContextTranslateCTM(context, 0, [UIScreen mainScreen].bounds.size.height);
	CGContextScaleCTM(context, 1, -1);
	CGContextSelectFont(context, "Helvetica", 10.0, kCGEncodingMacRoman);
	CGContextSetCharacterSpacing(context, 1.7);
	CGContextSetTextDrawingMode(context, kCGTextFill);
	CGContextShowTextAtPoint(context, _end.x+15, -_end.y+15, [str cStringUsingEncoding:NSASCIIStringEncoding], [str length]);
	
	CGContextStrokePath(context);
	
	// draw the text for angle and power
}

@end
