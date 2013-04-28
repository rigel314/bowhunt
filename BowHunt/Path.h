//
//  Path.h
//  BowHunt
//
//  Created by Cody Creager on 4/22/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Path : NSObject
@property CGPoint start;
@property CGPoint end;

-(void)drawPath:(CGContextRef)context forTurn:(int)turn;

@end
