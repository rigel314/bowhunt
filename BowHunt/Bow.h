//
//  Bow.h
//  bowhuntnew
//
//  Created by Alexander Maricich on 4/23/13.
//  Copyright (c) 2013 Focalframe. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BOW_WIDTH 30
#define BOW_HEIGHT 30
#define BOW_RADIUS 20

@interface Bow : NSObject

-(void)drawBowAtPoint:(CGPoint)point forContext:(CGContextRef)context withAngle:(float)angle;

@end
