//
//  Bow.m
//  bowhuntnew
//
//  Created by Alexander Maricich on 4/23/13.
//  Copyright (c) 2013 Focalframe. All rights reserved.
//

#import "Bow.h"

#define BOW_WIDTH 10
#define BOW_HEIGHT 10

@implementation Bow

-(void)drawBowAtPoint:(CGPoint)point forContext:(CGContextRef)context
{
    CGContextAddEllipseInRect(context, CGRectMake(point.x, point.y, BOW_HEIGHT, BOW_WIDTH));
}

-(void)updateBowAngle:(float)angle
{
    // update the bows angle on the screen
}

@end
