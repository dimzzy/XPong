#import <Cocoa/Cocoa.h>
#include "Drawable.h"
#include "InputHandler.h"

@interface GameView : NSView

@property(assign) Pong::Drawable *gameContent;
@property(assign) Pong::InputHandler *gameResponder;

@end
