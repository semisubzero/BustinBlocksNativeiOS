//
//  GameScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]){
        
        // Create the background grid
        SKSpriteNode *grid = [SKSpriteNode spriteNodeWithImageNamed:@"DefaultBackgroundGrid.png"];
        grid.position = CGPointMake(size.height/2, size.width/2);
        [self addChild:grid];
        
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
