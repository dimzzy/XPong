#import "GameView.h"
#import "XDrawingContext.h"

@implementation GameView

@synthesize gameContent = _gameContent;
@synthesize gameResponder = _gameResponder;

- (BOOL)isFlipped {
    return YES;
}

- (BOOL)isOpaque {
    return YES;
}

- (void)drawRect:(NSRect)rect {
    [[NSColor grayColor] set];
    NSRectFill(rect);
    NSGraphicsContext *xcontext = [NSGraphicsContext currentContext];
	XDrawingContext context(xcontext);
	if (self.gameContent) {
		self.gameContent->draw(context);
	}
}

- (BOOL)acceptsFirstResponder {
	return YES;
}

- (void)keyDown:(NSEvent *)theEvent {
	if ([theEvent.characters length] > 0) {
		const char c = [theEvent.characters characterAtIndex:0];
		if (self.gameResponder) {
			self.gameResponder->handleKey(c);
		}
	}
}

@end
