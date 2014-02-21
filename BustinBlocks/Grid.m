//
//  Grid.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "Grid.h"
#import "Block.h"
#import "GameData.h"
#import <SpriteKit/SpriteKit.h>

@implementation Grid

-(id)initWithParent:(SKScene *)parent{
    
    if (self = [super init]){
        // Set grids parent to the scene
        self.parent = parent;
        
        // Get shared instance of the game class
        self.game = [GameData sharedInstance];
        
        // Initialize and fill the block bag
        self.blockBag = [[NSMutableArray alloc] init];
        [self refillBag];
        
        // Allocate and initialize an empty array
        self.blockArray = [[NSMutableArray alloc] init];
        
        // There are 8 onscreen grid columns + 1 offscreen for block spawning
        // There are 3 rows for each column
        // We will add 9 empty arrays to each array index to create a 2 dimentional array to hold our blocks
        for (int i = 0; i < 9; i++) {
            // Create an empty array for the 2nd dimension
            NSMutableArray *column = [[NSMutableArray alloc]init];
            
            // Add 3 Empty blocks to the array
            for (int i = 0; i < 3; i++) {
                Block *block = [[Block alloc] initWithColor:@"Empty" withStyle:self.game.blockStyle withParent:self.parent];
                [column addObject:block];
            }
            
            // Add the column into the grid array
            [self.blockArray addObject:column];
        }
        
        // Create the move action to move the blocks by 1 square
        self.moveBlocks = [SKAction moveByX:-self.game.squareSize y:0 duration:self.game.moveSpeed];
    }
    
    return self;
}

-(void)spawnColumn{
    NSMutableArray *newColumn = [[NSMutableArray alloc] init];
    
    // Fill the column with empty blocks
    for (int i = 0; i < 3; i++) {
        [newColumn addObject:[[Block alloc] initEmptyBlock]];
    }
    
    // How many blocks will we spawn?
    int numberOfBlocks = arc4random_uniform(2) +1; // Generate random number from 1-2
    
    while (numberOfBlocks > 0){
        // Refill the bag if it's empty
        if ([self bagIsEmpty]) {
            [self refillBag];
        }
        
        // Where in the column will they be spawned?
        int blockLocation = arc4random_uniform(3); // Generate random number from 0-2 (3 total slots)
        
        Block *block = (Block *)[newColumn objectAtIndex:blockLocation];
        if( [block.blockColor caseInsensitiveCompare:@"Empty"] == NSOrderedSame){ // If that slot in the column is empty
            
            // Which block in the bag will we use?
            int blockIndex = arc4random_uniform(self.blockBag.count); // Generate a random number from 0-(number of blocks in the bag)
            
            // remove the block from the bag
            Block *spawnedBlock = self.blockBag[blockIndex];
            [self.blockBag removeObjectAtIndex:blockIndex];
            
            // Position the block
            spawnedBlock.blockImage.position = CGPointMake(480 + self.game.squareSize/2, self.game.borderSize + (self.game.squareSize*blockLocation) + 30);
            
            //NSLog(@"Positioned %@ Block",spawnedBlock.blockColor);
            
            // Insert spawned block into column
            [newColumn replaceObjectAtIndex:blockLocation withObject:spawnedBlock];
            
            // Reduce blocks to be spawned count
            numberOfBlocks = numberOfBlocks - 1;
        }
    }
    
    // Add the new column to the array
    [self.blockArray addObject:newColumn];
    newColumn = nil;
}

-(void)moveBlocksLeft{
    
    // Remove the first index so all columns shift left
    [self.blockArray removeObjectAtIndex:0];
    
    // Spawn a new column of blocks
    [self spawnColumn];
    
    // Iterate over all the columns in the array
    for (NSMutableArray *column in self.blockArray) {
        // Iterate over all the blocks in each column
        for (Block *block in column) {
            // if the block is not empty
            if ([block.blockColor caseInsensitiveCompare:@"Empty"] != NSOrderedSame){
                // If it's movable
                if(!block.isUnMovable){
                    // Move the block left
                    [block.blockImage runAction:self.moveBlocks];
                }
            }
        }
    }
}

-(Block *)getBlockAtTouchLocation:(CGPoint)touchLocation{
    
    int column;
    int row;
    
    Block *block = [[Block alloc] initEmptyBlock];
    NSArray *columnArray;
    GameData *game = [GameData sharedInstance];
    
    column = touchLocation.x / game.squareSize;
    row = (touchLocation.y - game.borderSize)/ game.squareSize;
    
    NSLog(@"X:%d Y:%d",column, row);
    
    if(column < 8){
        columnArray = [self.blockArray objectAtIndex:column];
    }
    if(row < 3){
        block = [columnArray objectAtIndex:row];
    }
    
    return block;
}

-(BOOL)isPointEmpty:(CGPoint)touchLocation{

    return NO;
}

-(void)moveBlockID:(int)blockID toPoint:(CGPoint)touchLocation{
}

-(BOOL)bagIsEmpty{
    if (self.blockBag.count <= 0) {
        return YES;
    }
    
    return NO;
}

-(void)refillBag{
    NSString *currentColor = @"Green";
    
    // Return if bag is not empty
    if (![self bagIsEmpty]) {
        return;
    }
    
    // Fill the bag
    for (int i = 1; i <= 12; i++) {
        
        // Break early if easier difficulty than hard
        if ([self.game.gameDifficulty caseInsensitiveCompare:@"Easy"] && 6 <= i){
            break;
        } else if ([self.game.gameDifficulty caseInsensitiveCompare:@"Medium"] && 9 <= i) {
            break;
        }
        
        if (3 < i && i <= 6) {
            currentColor = @"Red";
        } else if (6 < i && i <= 9) {
            currentColor = @"Blue";
        } else if (9 < i && i <= 12) {
            currentColor = @"Yellow";
        }
        // Create new block
        Block *block = [[Block alloc] initWithColor:currentColor withStyle:self.game.blockStyle withParent:self.parent];
        
        // Add new block to the bag
        [self.blockBag addObject:block];
        
    }
}

@end
