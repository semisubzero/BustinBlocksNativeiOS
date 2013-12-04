//
//  GameScene.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class GameData;

@interface GameScene : SKScene

@property SKSpriteNode *gridSprite;
@property SKSpriteNode *gridSprite2;

@property SKAction *moveSpritesLeft;

@property GameData *game;

-(void)moveLeft;

@end
