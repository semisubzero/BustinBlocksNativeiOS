//
//  MenuScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 11/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
        
        // Initialize the scrolling background
        SKSpriteNode *backgroundSprite = [SKSpriteNode spriteNodeWithImageNamed:@"MenuBackground.png"];
        backgroundSprite.position = CGPointMake(backgroundSprite.size.width/2, backgroundSprite.size.height/2);
        [self addChild:backgroundSprite];
        
        SKAction *scrollLeft = [SKAction moveToX:-backgroundSprite.size.width/2 duration:20];
        
        [backgroundSprite runAction:scrollLeft];
        //SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        //myLabel.text = @"Hello, World!";
        //myLabel.fontSize = 30;
        //myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
        //                               CGRectGetMidY(self.frame));
        
        //[self addChild:myLabel];
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

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
