//
//  Bow.m
//  bowhuntnew
//
//  Created by Alexander Maricich on 4/23/13.
//  Copyright (c) 2013 Focalframe. All rights reserved.
//

#import "Bow.h"

@implementation Bow

-(void)drawBowAtPoint:(CGPoint)point forContext:(CGContextRef)context withAngle:(float)angle
{
    CGContextAddArc(context, point.x, point.y, BOW_RADIUS, angle, -45*3.14159/180+angle, 1);
    CGContextAddArc(context, point.x, point.y, BOW_RADIUS, 45*3.14159/180+angle, angle, 1);
}


@end
