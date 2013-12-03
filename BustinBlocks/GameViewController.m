//
//  GameViewController.m
//  BustinBlocks
//
//  Created by Brandon Ramirez on 12/2/13.
//  Copyright (c) 2013 Semisubzero. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

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
    SKScene * scene = [GameScene sceneWithSize:sceneView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [sceneView presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
