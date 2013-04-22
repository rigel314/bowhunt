//
//  Arrow.h
//  BowHunt
//
//  Created by Cody Creager on 4/8/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arrow : NSObject

@property CGPoint head;
@property CGPoint velocity;
@property CGPoint acceleration;
@property int timeAlive;
@property float angle;

-(void)drawArrow:(CGContextRef)context;
-(void)moveHead;

@end
