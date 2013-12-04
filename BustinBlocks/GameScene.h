//
//  GameScene.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Game;

@interface GameScene : SKScene

@property SKSpriteNode *grid;
@property SKSpriteNode *grid2;

@property SKAction *moveLeft;

@property Game *game;

@end
