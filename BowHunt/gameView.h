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
	Player* player1;
	Player* player2;
	Path* path;
	Arrow* arrow;
	
	NSTimer* timer;
	
	BOOL drawPath;
	BOOL drawArrow;
    float angle;
    
    int winner; // 0 - game continues
                // 1 - left wins
                // 2 - right wins
                //-------------------
    int turn;   // 0 - left
                // 1 - right
	
}
-(void)newGame;
@end
