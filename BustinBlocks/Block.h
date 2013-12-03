//
//  Block.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

@property (nonatomic,strong) NSString *blockColor;
@property (nonatomic,strong) NSString *blockStyle;

-(id)initWithColor:(NSString *)color withStyle:(NSString *)style;

@end
