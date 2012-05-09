//
//  RMViewController.m
//  RMPaintExample
//
//  Created by Hermes Pique on 5/9/12.
//  Copyright (c) 2012 Robot Media SL. All rights reserved.
//

#import "RMViewController.h"
#import "RMTouchCanvasView.h"

#define HISTORY_KEY @"history"

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    session = [[RMPaintSession alloc] initWithDefaultsWithKey:HISTORY_KEY];     
    RMCanvasView* canvas = [[RMTouchCanvasView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:canvas];
    [session paintInCanvas:canvas];
    canvas.delegate = self;
    canvas.brush = [UIImage imageNamed:@"brush.png"];
    canvas.brushColor = [UIColor redColor];
}

- (void)viewDidUnload
{
    [session saveToDefaultsWithKey:HISTORY_KEY];
    [super viewDidUnload];
}

- (void) canvasView:(RMCanvasView *)canvasView painted:(RMPaintStep *)step {
    [session addStep:step];
}

@end
