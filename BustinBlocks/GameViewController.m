//
//  GameViewController.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "Grid.h"
#import "Block.h"
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
    
    // Create grid class
    self.grid = [[Grid alloc] initWithParent:self.scene];
    
    // Present the scene.
    [sceneView presentScene:self.scene];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:game.moveSpeed target:self selector:@selector(moveLeft) userInfo:nil repeats:YES];
    
}

-(void)moveLeft{
    // Move blocks
    [self.grid moveBlocksLeft];
    
    // Move everything onscreen left that's supposed to move left
    [self.scene moveLeft];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self.scene];
        
        Block *touchedBlock = [self.grid getBlockAtTouchLocation:location];
        
        if([touchedBlock.blockColor caseInsensitiveCompare:@"Empty"] != NSOrderedSame){
            self.activeBlock = touchedBlock;
            [self.activeBlock isTouched];
        }
        
        NSLog(@"Touched X:%f Y:%f",location.x, location.y);
        
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
