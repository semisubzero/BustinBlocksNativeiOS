//
//  Grid.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>

// Lets compiler know that there is a class called block
@class Block;
@class Game;

@interface Grid : NSObject

// Contains all blocks inside the grid
@property NSMutableArray *blockArray;

//Contains bag of unspawned blocks
@property NSMutableArray *blockBag;

// The offset of the scrolling blocks to the grid location
@property int blockOffset;

// Shared instance of the Game class
@property Game *game;

// Overrides default initializer so we can setup our array
-(id)init;

// Creates a new row of blocks offscreen
-(void)spawnColumn;

// Moves all blocks in the grid left one array index
-(void)moveBlocksLeft;

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

@end
