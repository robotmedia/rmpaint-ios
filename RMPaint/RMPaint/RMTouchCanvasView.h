#import "RMCanvasView.h"

@interface RMTouchCanvasView : RMCanvasView {
    BOOL firstTouch;
}

- (void) renderLineFromTouch:(UITouch*)touch;

@end
