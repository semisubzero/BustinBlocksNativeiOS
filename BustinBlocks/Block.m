//
//  Block.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "Block.h"
#import <SpriteKit/SpriteKit.h>

@implementation Block

-(id)initWithColor:(NSString *)color withStyle:(NSString *)style withParent:(SKScene *)parent{
    
    if (self = [super init]){
        
        // If it's not an empty block, load the image
        if ([color caseInsensitiveCompare:@"Empty"] != NSOrderedSame) {
            
            // Create image filename
            NSString *imageName = color;
            imageName = [imageName stringByAppendingString:style];
            imageName = [imageName stringByAppendingString:@".png"];
            
            // Set scaling actions
            self.scaleUpAction = [SKAction scaleTo:1.1 duration:0];
            self.scaleDownAction = [SKAction scaleTo:1 duration:0];
        
            self.blockImage = [SKSpriteNode spriteNodeWithImageNamed:imageName];
            [parent addChild:self.blockImage];
        }
        
        self.blockColor = color;
        self.blockStyle = style;
    }
    
    return self;
}

-(id)initEmptyBlock{
    
    if( self = [super init] ){
        self.blockColor = @"Empty";
        self.blockStyle = @"Default";
    }
    
    return self;
}

-(void)isTouched{
    self.isUnMovable = true;
    [self.blockImage removeAllActions];
    [self.blockImage runAction:self.scaleUpAction];
    
}

-(void)isLetGo{
    self.isUnMovable = false;
    [self.blockImage removeAllActions];
    [self.blockImage runAction:self.scaleDownAction];
    
}

+(NSArray *)validColors{
    return @[@"Blue",@"Green",@"Red",@"Yellow",@"Empty"];
}

+(NSArray *)validStyles{
    return @[@"Default"];
}

@end
