//
//  Particles.m
//  BowHunt
//
//  Created by Cody Creager on 4/29/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import "Particles.h"

@implementation Particles

-(id)init
{
	CGRect bounds = [UIScreen mainScreen].bounds;
	for (int i=0; i<numPoints; i++) {
		points[i] = CGPointMake(rand()%(int)bounds.size.height, rand()%(int)bounds.size.width);
	}
	return self;
}

-(void)drawParticlesWithContext:(CGContextRef)context
{
	for (int i=0; i<numPoints; i++) {
		CGContextSetRGBFillColor(context, 0, 0, 0, .75);
		CGContextFillEllipseInRect(context, CGRectMake(points[i].x, points[i].y, 2, 2));
	}
}

-(void)moveParticlesWithWind:(float)wind
{
	CGRect bounds = [UIScreen mainScreen].bounds;
	for (int i=0; i<numPoints; i++) {
		points[i].x += wind;
		if (points[i].x < 0)
			points[i].x = bounds.size.height;
		else if (points[i].x > bounds.size.height)
			points[i].x = 0;
	}
}

@end
