//
//  GameScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameScene.h"
#import "GameData.h"
#import "Block.h"
#import "Grid.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]){
        
        // Get the shared instance of our game data
        self.game = [GameData sharedInstance];
        
        // Create grid class
        self.grid = [[Grid alloc] initWithParent:self];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    // Initial frame time setup
    if (!self.lastFrameTime) {
        self.lastFrameTime = currentTime;
    }
    // Get Delta time
    float deltaTime = currentTime - self.lastFrameTime;

//** Update Methods Begin **//
    
    // Update the grid
    [self.grid moveGridSprites:deltaTime];
    // Move the blocks if they're movable
    [self.grid moveBlocksLeft:deltaTime];
    // Increment the grid offset
    [self.game incrementOffset:deltaTime];
    
    // Check to see if offset completed a movement
    if (self.game.gridOffset >= self.game.squareSize){
        // Reset the offset to zero
        self.game.gridOffset = 0;
        // Do everything that happens on a completed move
        [self.grid completedMove];
    }    
    
//** Update Methods End **//
    
    self.lastFrameTime = currentTime;
}

@end
