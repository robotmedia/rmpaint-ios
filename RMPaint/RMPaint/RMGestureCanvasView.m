//
#import "RMTouchCanvasView.h"

@implementation RMTouchCanvasView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	firstTouch = YES;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{  
    firstTouch = NO;
	UITouch* touch = [[event touchesForView:self] anyObject];
    [self renderLineFromTouch:touch];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (!firstTouch) return;    
    UITouch* touch = [[event touchesForView:self] anyObject];
    [self renderLineFromTouch:touch];
}

- (void) renderLineFromTouch:(UITouch*)touch {
    CGPoint end = [touch locationInView:self];
    CGPoint start = [touch previousLocationInView:self];
    [self renderLineFromPoint:start toPoint:end];    
}

@end
