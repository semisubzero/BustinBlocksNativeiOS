//
//  GameViewController.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "Block.h"
#import "Grid.h"
#import "GameData.h"
#import <SpriteKit/SpriteKit.h>

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set default testing game data
    GameData *game = [GameData sharedInstance];
    game.gameDifficulty = @"Easy";
    game.blockStyle = @"Default";
    
    // Configure the view.
    SKView * sceneView = (SKView *)self.view;
    sceneView.showsFPS = YES;
    sceneView.showsNodeCount = YES;
    sceneView.showsDrawCount = YES;
    // Create and configure the scene.
    self.scene = [GameScene sceneWithSize:sceneView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFit;
    
    
    // Present the scene.
    [sceneView presentScene:self.scene];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self.scene];
        
        Block *touchedBlock = [self.scene.grid getBlockAtTouchLocation:location];
        
        if([touchedBlock.blockColor caseInsensitiveCompare:@"Empty"] != NSOrderedSame){
            self.activeBlock = touchedBlock;
            [self.activeBlock isTouched];
            NSLog(@"Touched Block %@",self.activeBlock.blockColor);
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self.scene];
        
        // Move the active block with the finger
        self.activeBlock.blockImage.position = location;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.activeBlock isLetGo];
    self.activeBlock = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
