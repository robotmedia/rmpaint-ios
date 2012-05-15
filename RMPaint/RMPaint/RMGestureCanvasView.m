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

#import "RMGestureCanvasView.h"
#import "RMPaintGestureRecognizer.h"

@implementation RMGestureCanvasView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        RMPaintGestureRecognizer* recognizer = [[RMPaintGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
        [self addGestureRecognizer:recognizer];
	}
	return self;
}

- (void) handleDrag:(RMPaintGestureRecognizer*)sender {
    NSSet* touches = sender.touches;
    for (UITouch* touch in touches) {
        [self renderLineFromTouch:touch];        
    }
}

- (void) renderLineFromTouch:(UITouch*)touch {
    CGPoint end = [touch locationInView:self];
    CGPoint start = [touch previousLocationInView:self];
    [self renderLineFromPoint:start toPoint:end];    
}

@end
