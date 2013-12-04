//
//  GameViewController.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@class Grid;
@class GameScene;

@interface GameViewController : UIViewController

@property Grid *grid;
@property GameScene *scene;

-(void)moveLeft;

@end
