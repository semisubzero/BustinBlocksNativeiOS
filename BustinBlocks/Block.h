//
//  Block.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Block : SKNode

@property (nonatomic,strong) NSString *blockColor;
@property (nonatomic,strong) NSString *blockStyle;

@property int blockID;
@property SKSpriteNode *blockImage;

@property SKAction *scaleUpAction;
@property SKAction *scaleDownAction;

@property BOOL isMovable;

-(id)initWithColor:(NSString *)color withStyle:(NSString *)style withParent:(SKScene *)parent;
-(id)initEmptyBlock;
-(void)isTouched;
-(void)isLetGo;
-(void)onUpdate:(float)deltaTime;

+(NSArray *)validColors;
+(NSArray *)validStyles;

@end
