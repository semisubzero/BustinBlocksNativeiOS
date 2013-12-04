//
//  GameScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameScene.h"
#import "GameData.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]){
        
        // Get the shared instance of our game data
        self.game = [GameData sharedInstance];
        
        // Create the background grids
        self.gridSprite = [SKSpriteNode spriteNodeWithImageNamed:@"DefaultBackgroundGrid.png"];
        self.gridSprite.anchorPoint = CGPointMake(0, 0.5);
        self.gridSprite.position = CGPointMake(0,size.width/2);
        [self addChild:self.gridSprite];
        
        // Second grid
        self.gridSprite2 = [SKSpriteNode spriteNodeWithImageNamed:@"DefaultBackgroundGrid.png"];
        self.gridSprite2.anchorPoint = CGPointMake(0, 0.5);
        self.gridSprite2.position = CGPointMake(self.gridSprite.position.x + self.gridSprite.size.width, size.width/2);
        [self addChild:self.gridSprite2];
        
        // Setup the move left actions
        self.moveSpritesLeft = [SKAction moveByX:-self.game.squareSize y:0 duration:self.game.moveSpeed];
        
    }
    return self;
}

-(void)moveLeft{
    [self.gridSprite runAction:self.moveSpritesLeft];
    [self.gridSprite2 runAction:self.moveSpritesLeft];
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
