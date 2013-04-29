//
//  Particles.h
//  BowHunt
//
//  Created by Cody Creager on 4/29/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <Foundation/Foundation.h>
#define numPoints 50

@interface Particles : NSObject
{
	CGPoint points[numPoints];
}

-(void)drawParticlesWithContext:(CGContextRef)context;
-(void)moveParticlesWithWind:(float)wind;

@end
