#import "AppDelegate.h"
#include "Game.h"

@implementation AppDelegate {
@private
	NSTimer *_gameTimer;
	Pong::Game *_game;
}

@synthesize window = _window;
@synthesize gameView = _gameView;
@synthesize leftScoreView = _leftScoreView;
@synthesize rightScoreView = _rightScoreView;

- (void)dealloc {
	[_gameTimer invalidate];
	delete _game;
    [super dealloc];
}

- (void)handleFrame:(NSTimer *)timer {
	_game->handleFrame();
	[self.gameView setNeedsDisplay:YES];
	[self.leftScoreView setIntValue:_game->leftScore()];
	[self.rightScoreView setIntValue:_game->rightScore()];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSRect gameViewBounds = self.gameView.bounds;
	_game = new Pong::Game(gameViewBounds.size.width, gameViewBounds.size.height);
	self.gameView.gameContent = _game;
	self.gameView.gameResponder = _game;
	[self.gameView becomeFirstResponder];
	_gameTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / kGameFPS)
												  target:self
												selector:@selector(handleFrame:)
												userInfo:nil
												 repeats:YES];
}

@end
