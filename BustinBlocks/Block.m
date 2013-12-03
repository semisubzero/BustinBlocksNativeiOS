//
//  Block.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "Block.h"

@implementation Block

-(id)initWithColor:(NSString *)color withStyle:(NSString *)style{
    
    if (self = [super init]){
        
        self.blockColor = color;
        self.blockStyle = style;
        
    }
    
    return self;
}

@end
