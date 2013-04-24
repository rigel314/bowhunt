//
//  Player.h
//  BowHunt
//
//  Created by Cody Creager on 4/15/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bow.h"

@interface Player : NSObject
{
    Bow* bow;
}
@property float length;
@property float angle;

-(void)drawForContext:(CGContextRef)context AtGround:(float)bottom AtRightFoot:(float)left Mirror:(bool)mir;

@end
