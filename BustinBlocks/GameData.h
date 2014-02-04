//
//  Game.h
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/3/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject

@property float squareSize;
@property int borderSize;
@property int moveSpeed;

@property (nonatomic,strong) NSString *gameDifficulty;
@property (nonatomic,strong) NSString *blockStyle;

+(id)sharedInstance;

+(NSArray *)validDifficultys;

@end
