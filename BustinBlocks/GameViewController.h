//
//  GameViewController.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Grid;
@class GameScene;
@class Block;

@interface GameViewController : UIViewController

@property Grid *grid;
@property GameScene *scene;
@property NSTimer *timer;
@property Block *activeBlock;


-(void)moveLeft;

@end
