//
//  RMAppDelegate.m
//  RMPaintExample
//
//  Created by Hermes Pique on 5/9/12.
//  Copyright (c) 2012 Robot Media SL. All rights reserved.
//

#import "RMAppDelegate.h"

#import "RMViewController.h"

@implementation RMAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[RMViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
