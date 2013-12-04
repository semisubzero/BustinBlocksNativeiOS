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

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    // Create grid class
    self.grid = [[Grid alloc] initWithParent:self.scene];
    
    [self moveLeft];
}

-(void)moveLeft{
    // Move blocks
    [self.grid moveBlocksLeft];
    
    // Generate new column
    [self.grid spawnColumn];
    
    // Move everything onscreen left that's supposed to move left
    [self.scene moveLeft];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
