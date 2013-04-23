//
//  Bow.h
//  bowhuntnew
//
//  Created by Alexander Maricich on 4/23/13.
//  Copyright (c) 2013 Focalframe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bow : NSObject

-(void)drawBowAtPoint:(CGPoint)point forContext:(CGContextRef)context withAngle:(float)angle;

@end
