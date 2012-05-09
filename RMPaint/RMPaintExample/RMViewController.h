//
//  RMViewController.h
//  RMPaintExample
//
//  Created by Hermes Pique on 5/9/12.
//  Copyright (c) 2012 Robot Media SL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMCanvasView.h"
#import "RMPaintSession.h"

@interface RMViewController : UIViewController<RMCanvasViewDelegate> {
    RMPaintSession* session;
}

@end
