//
//  Player.h
//  BowHunt
//
//  Created by Cody Creager on 4/15/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property float length;
-(void)drawForContext:(CGContextRef)context AtGround:(float)bottom AtRightFoot:(float)left WithTouch:(UITouch)touch;

@end
