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
