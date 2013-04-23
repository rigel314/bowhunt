//
//  Player.m
//  BowHunt
//
//  Created by Cody Creager on 4/15/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)init
{
    bow = [Bow new];
    _angle = 3;
    return self;
}


-(void)drawForContext:(CGContextRef)context AtGround:(float)bottom AtRightFoot:(float)left
{
	//Legs
	CGContextMoveToPoint(context, left, bottom);
	CGContextAddLineToPoint(context, left+.707*_length, bottom-2*.707*_length);
	CGContextAddLineToPoint(context, left+2*.707*_length, bottom);
	
	//Body
	CGContextMoveToPoint(context, left+.707*_length, bottom-2*.707*_length);
	CGContextAddLineToPoint(context, left+.707*_length, bottom-2*.707*_length-1.5*_length);
	
	//Head
	CGContextAddEllipseInRect(context, CGRectMake(left+.707*_length-.5*_length, bottom-2*.707*_length-2.5*_length, _length, _length));
	
	//Arms
	CGContextMoveToPoint(context, left+.707*_length, bottom-2*.707*_length-1.5*_length+_length/5);
	CGContextAddLineToPoint(context, left+.3*_length, bottom-2*.707*_length-1.5*_length+_length/5+.3*_length);
	
	CGContextMoveToPoint(context, left+.707*_length, bottom-2*.707*_length-1.5*_length+_length/5);
	CGContextAddLineToPoint(context, left+2*.707*_length, bottom-2*.707*_length-1.5*_length+_length/5+.3*_length);
    
    //Bow
    CGPoint bowPoint = CGPointMake(left+.707*_length, bottom-2*.707*_length-.75*_length);
    [bow drawBowAtPoint:bowPoint forContext:context withAngle:_angle+3.14159];
	
	CGContextStrokePath(context);
}

@end
