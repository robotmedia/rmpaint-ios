#import "RMCanvasView.h"

@interface RMTouchCanvasView : RMCanvasView {
    BOOL firstTouch;
    CGPoint	location;
    CGPoint	previousLocation;
}

@end
