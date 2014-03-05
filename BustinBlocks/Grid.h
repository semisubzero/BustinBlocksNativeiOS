//
//  Grid.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Block;
@class GameData;
@class SKScene;
@class SKSpriteNode;
@class SKAction;

@interface Grid : NSObject

// Contains all blocks inside the grid
@property NSMutableArray *blockArray;

//Contains bag of unspawned blocks
@property NSMutableArray *blockBag;

// The offset of the scrolling blocks to the grid location
@property int blockOffset;

// Shared instance of the Game class
@property GameData *game;

// The parent scene that uses the grid
@property SKScene *parent;

@property SKSpriteNode *gridSprite;
@property SKSpriteNode *gridSprite2;

// Overrides default initializer so we can setup our array
-(id)initWithParent:(SKScene *)parent;

// Moves and repositions the background grid sprites
-(void)moveGridSprites:(float)deltaTime;

// Creates a new row of blocks offscreen
-(void)spawnColumn;

// Moves all blocks in the grid left one array index
-(void)moveBlocksLeft:(float)deltaTime;

// Checks location on screen to see if the grid index contains a block or not
-(BOOL)isPointEmpty:(CGPoint)touchLocation;

// Returns the block from the array based on the touch location on screen
-(Block *)getBlockAtTouchLocation:(CGPoint)touchLocation;

// Moves a block to a new index based on touch location
-(void)moveBlockID:(int)blockID toPoint:(CGPoint)touchLocation;

// Checks to see if bag of blocks is empty
-(BOOL)bagIsEmpty;

// Refills bag of blocks
-(void)refillBag;

// Update the grid on offset movement
-(void)completedMove;

@end
