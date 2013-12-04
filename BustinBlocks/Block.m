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
        // Create image filename
        NSString *imageName = color;
        [imageName stringByAppendingString:style];
        [imageName stringByAppendingString:@".png"];
        
        self.blockColor = color;
        self.blockStyle = style;
        
        self.blockImage = [SKSpriteNode spriteNodeWithImageNamed:imageName];
        
        [parent addChild:self.blockImage];
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

+(NSArray *)validColors{
    return @[@"Blue",@"Green",@"Red",@"Yellow",@"Empty"];
}

+(NSArray *)validStyles{
    return @[@"Default"];
}

@end
