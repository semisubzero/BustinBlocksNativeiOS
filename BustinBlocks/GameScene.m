//
//  GameScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameScene.h"
#import "Game.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]){
        
        // Get the shared instance of our game data
        self.game = [Game sharedInstance];
        
        // Create the background grids
        self.grid = [SKSpriteNode spriteNodeWithImageNamed:@"DefaultBackgroundGrid.png"];
        self.grid.anchorPoint = CGPointMake(0, 0.5);
        self.grid.position = CGPointMake(0,size.width/2);
        [self addChild:self.grid];
        
        // Second grid
        self.grid2 = [SKSpriteNode spriteNodeWithImageNamed:@"DefaultBackgroundGrid.png"];
        self.grid2.anchorPoint = CGPointMake(0, 0.5);
        self.grid2.position = CGPointMake(self.grid.position.x + self.grid.size.width, size.width/2);
        [self addChild:self.grid2];
        
        // Setup the move left actions
        self.moveLeft = [SKAction moveByX:-self.game.squareSize y:0 duration:self.game.moveSpeed];
        SKAction *runLeftForever = [SKAction repeatActionForever:self.moveLeft];
        
        [self.grid runAction:runLeftForever];
        [self.grid2 runAction:runLeftForever];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        //CGPoint location = [touch locationInNode:self];
        
        //sprite.position = location;
        
        //SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        //[sprite runAction:[SKAction repeatActionForever:action]];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
