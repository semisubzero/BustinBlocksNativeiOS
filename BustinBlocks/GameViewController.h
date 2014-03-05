//
//  GameViewController.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameScene;
@class Block;

@interface GameViewController : UIViewController

@property GameScene *scene;
@property Block *activeBlock;

@end
