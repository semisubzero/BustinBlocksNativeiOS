//
//  Block.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SKSpriteNode;
@class SKScene;

@interface Block : NSObject

@property (nonatomic,strong) NSString *blockColor;
@property (nonatomic,strong) NSString *blockStyle;

@property int blockID;
@property SKSpriteNode *blockImage;

-(id)initWithColor:(NSString *)color withStyle:(NSString *)style withParent:(SKScene *)parent;
-(id)initEmptyBlock;

+(NSArray *)validColors;
+(NSArray *)validStyles;

@end
