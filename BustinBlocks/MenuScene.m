//
//  MenuScene.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 11/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene

@synthesize backgroundSprite;
@synthesize backgroundSprite2;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:CGSizeMake(size.height, size.width)]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
        
        self.backgroundSprite = [SKSpriteNode spriteNodeWithImageNamed:@"MenuBackground.png"];
        self.backgroundSprite2 = [SKSpriteNode spriteNodeWithImageNamed:@"MenuBackground.png"];
        
        // Initialize the background sprites
        self.backgroundSprite.anchorPoint = CGPointMake(0, 0);
        self.backgroundSprite.position = CGPointMake(0,0);
        [self addChild:self.backgroundSprite];
        self.backgroundSprite2.anchorPoint = CGPointMake(0, 0);
        self.backgroundSprite2.position = CGPointMake(self.backgroundSprite.size.width, 0);
        [self addChild:self.backgroundSprite2];
        
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    
    self.backgroundSprite.position = CGPointMake(self.backgroundSprite.position.x -2, 0);
    self.backgroundSprite2.position = CGPointMake(self.backgroundSprite2.position.x -2, 0);

    if (self.backgroundSprite.position.x <= -self.backgroundSprite.size.width) {
        self.backgroundSprite.position = CGPointMake(backgroundSprite2.position.x + backgroundSprite.size.width, 0);
    }
    
    if (self.backgroundSprite2.position.x <= -self.backgroundSprite2.size.width) {
        self.backgroundSprite2.position = CGPointMake(backgroundSprite.position.x + backgroundSprite2.size.width, 0);
    }
    
    
    

}

@end
