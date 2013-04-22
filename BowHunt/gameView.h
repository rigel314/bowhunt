//
//  gameView.h
//  BowHunt
//
//  Created by Cody Creager on 4/10/13.
//  Copyright (c) 2013 CS330. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Path.h"
#import "Arrow.h"

@interface gameView : UIView
{
	Player* player;
	Path* path;
	Arrow* arrow;
	
	NSTimer* timer;
	
	BOOL drawPath;
	BOOL drawArrow;
	
}
-(void)newGame;
-(void)trueArcTanOpp: (float) opp Adj:(float) adj;
@end
