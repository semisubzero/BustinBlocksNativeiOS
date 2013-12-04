//
//  Game.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "Game.h"

@implementation Game

static Game *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (Game *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

-(id)init {
    if (self = [super init] ){
        // Square is 60 pixels wide on iphone
        self.squareSize = 60;
        
        // Initial speed (in seconds) at which the blocks move to the left by 1 square
        self.moveSpeed = 1;
    }
    
    return self;
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

+(NSArray *)validDifficultys{
    return @[@"Easy",@"Medium",@"Hard"];
}

@end
