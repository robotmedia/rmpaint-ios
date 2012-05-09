//
//  RMPaintSession.m
//  GLPaint
//
//  Created by Hermes Pique on 5/9/12.
//	Copyright 2012 Robot Media SL <http://www.robotmedia.net>. All rights reserved.
//
//	This file is part of RMPaint.
//
//	RMPaint is free software: you can redistribute it and/or modify
//	it under the terms of the GNU Lesser Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
//
//	RMPaint is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU Lesser Public License for more details.
//
//	You should have received a copy of the GNU Lesser Public License
//	along with RMPaint.  If not, see <http://www.gnu.org/licenses/>.

#import "RMPaintSession.h"
#import "RMCanvasView.h"

@implementation RMPaintSession 

@synthesize steps = steps_;

- (id) init {
    if ((self = [super init])) {
        steps_ = [[NSMutableArray alloc] init];        
    }
    return self;    
}

- (id)initWithDefaultsWithKey:(NSString*)key {    
    if ((self = [super init])) {
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        NSArray* data = [defaults objectForKey:key];
        if (data) {
            steps_ = [[NSMutableArray alloc] initWithCapacity:data.count];
            for (NSArray* stepData in data) {
                RMPaintStep* step = [[RMPaintStep alloc] initWithData:stepData];
                [steps_ addObject:step];
            }
        } else {
            steps_ = [[NSMutableArray alloc] init];        
        }
    }
    return self;
}

- (void) clear {
    [steps_ removeAllObjects];
}

- (void)paintInCanvas:(RMCanvasView*)canvas {
    for (RMPaintStep* step in self.steps) {
        [step paintInCanvas:canvas];
    }
}

- (void)saveToDefaultsWithKey:(NSString*)key {
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray* data = [NSMutableArray arrayWithCapacity:self.steps.count];
    for (RMPaintStep* step in self.steps) {
        [data addObject:step.data];
    }
	[defaults setObject:data forKey:key];
	[defaults synchronize];
}

- (void) addStep:(RMPaintStep*)step {
    [steps_ addObject:step];
}

@end
