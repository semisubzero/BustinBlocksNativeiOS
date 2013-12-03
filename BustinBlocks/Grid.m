//
//  Grid.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "Grid.h"
#import "Block.h"
#import "Game.h"

@implementation Grid

-(id)init{
    
    if (self = [super init]){
        
        // Get shared instance of the game class
        self.game = [Game sharedInstance];
        
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
                Block *block = [[Block alloc] initWithColor:@"Empty" withStyle:self.game.blockStyle];
                [column addObject:block];
            }
            
            // Add the column into the grid array
            [self.blockArray addObject:column];
        }
    }
    
    return self;
}

-(void)spawnColumn{
    
    // How many blocks will we spawn?
    int numberOfBlocks = arc4random_uniform(2) +1; // Generate random number from 1-2
    
    // Where in the column will they be spawned?
    int blockLocation = arc4random_uniform(3) +1; // Generate random number from 1-3
    
    while (numberOfBlocks > 0){
        Block *block = (Block *)[[self.blockArray objectAtIndex:8] objectAtIndex:blockLocation];
        if( [block.blockColor caseInsensitiveCompare:@"Empty"] ){
            
            // Which block in the bag will we use?
            int blockIndex = arc4random_uniform(self.blockBag.count); // Generate a random number from 0-(number of blocks in the bag)
            
            // remove the block from the bag
            Block *spawnedBlock = self.blockBag[blockIndex];
            self.blockBag[blockIndex] = nil;
            
            // Refill the bag if it's empty
            if ([self bagIsEmpty]) {
                [self refillBag];
            }
            
            // Insert spawned block into grid
            [[self.blockArray objectAtIndex:8] setObject:spawnedBlock atIndex:blockLocation];
            
            // Reduce blocks to be spawned count
            numberOfBlocks -= 1;
        }
    }
}

-(void)moveBlocksLeft{
    
}

/*-(Block *)getBlockAtTouchLocation:(CGPoint)touchLocation{
    
}*/

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
    if (self.blockBag.count != 0) {
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
        Block *block = [[Block alloc] initWithColor:currentColor withStyle:self.game.blockStyle];
        
        // Add new block to the bag
        [self.blockBag addObject:block];
        
    }
}

@end
