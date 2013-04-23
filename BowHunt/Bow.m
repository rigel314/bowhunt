//
//  Bow.m
//  bowhuntnew
//
//  Created by Alexander Maricich on 4/23/13.
//  Copyright (c) 2013 Focalframe. All rights reserved.
//

#import "Bow.h"

#define BOW_WIDTH 30
#define BOW_HEIGHT 30
#define BOW_RADIUS 20

@implementation Bow

-(void)drawBowAtPoint:(CGPoint)point forContext:(CGContextRef)context withAngle:(float)angle
{
    CGContextAddArc(context, point.x, point.y, BOW_RADIUS, angle, -45*3.14159/180+angle, 1);
    CGContextAddArc(context, point.x, point.y, BOW_RADIUS, 45*3.14159/180+angle, angle, 1);
//    CGContextAddLineToPoint(context, point.x, point.y);
    
}

//-(void)updateBowAngle:(float)angle
//{
//    // update the bows angle on the screen
//}

@end
