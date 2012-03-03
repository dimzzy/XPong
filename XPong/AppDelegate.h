#import <Cocoa/Cocoa.h>
#import "GameView.h"

const float kGameFPS = 60.0;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet GameView *gameView;
@property (assign) IBOutlet NSTextField *leftScoreView;
@property (assign) IBOutlet NSTextField *rightScoreView;

@end
