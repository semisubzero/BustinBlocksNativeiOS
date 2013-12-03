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
        
        // Allocate and initialize an empty array
        self.blockArray = [[NSMutableArray alloc] init];
        
        // There are 8 onscreen grid columns + 1 offscreen for block spawning
        // There are 3 rows for each column
        // We will add 9 empty arrays to each array index to create a 2 dimentional array to hold our blocks
        for (int i = 0; i < 9; i++) {
            // Create an empty array for the 2nd dimension
            NSMutableArray *column = [[NSMutableArray alloc]init];
            
            // Add 3 strings of "Empty" to the array
            for (int i = 0; i < 3; i++) {
                [column addObject:@"Empty"];
            }
            
            // Add the column into the grid array
            [self.blockArray addObject:column];
        }
        
        // Get shared instance of the game class
        self.game = [Game sharedInstance];
    }
    
    return self;
}

-(void)spawnRow{
    
    
    
}

-(void)moveBlocksLeft{
    
}

/*-(Block *)getBlockAtTouchLocation:(CGPoint)touchLocation{
    
}*/

-(BOOL)isPointEmpty:(CGPoint)touchLocation{

    return NO;
}

-(BOOL)moveBlockID:(int)blockID toPoint:(CGPoint)touchLocation{

    return NO;
}

-(BOOL)isBagEmpty{
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
