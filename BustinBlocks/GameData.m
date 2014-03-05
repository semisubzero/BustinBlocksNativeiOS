//
//  Game.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameData.h"

@implementation GameData

static GameData *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (GameData *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

-(id)init {
    if (self = [super init] ){
        // Square is 60 pixels wide on iphone
        self.squareSize = 60;
        
        // Border size is 66 pixels tall on iphone
        self.borderSize = 70;
        
        // Initial speed (in pixels per second) at which the blocks move to the left by 1 square
        self.moveSpeed = 50;
        
        // Set gridOffset to zero since the game hasn't started yet
        self.gridOffset = 0;
    }
    
    return self;
}

-(void)incrementOffset:(float)deltaTime{
    self.gridOffset += self.moveSpeed * deltaTime;
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

+(NSArray *)validDifficultys{
    return @[@"Easy",@"Medium",@"Hard"];
}

@end
