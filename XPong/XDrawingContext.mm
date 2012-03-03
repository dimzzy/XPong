#import "XDrawingContext.h"

XDrawingContext::XDrawingContext(NSGraphicsContext *xcontext) {
	_xcontext = [xcontext retain];
}

XDrawingContext::~XDrawingContext() {
	[_xcontext release];
}

void XDrawingContext::setFillColor(Pong::RGBColor const &color) {
	DrawingContext::setFillColor(color);
	NSColor *xcolor = [NSColor colorWithDeviceRed:color.red
											green:color.green
											 blue:color.blue
											alpha:1];
	[xcolor setFill];
}

void XDrawingContext::fillRectangle(Pong::Rectangle bounds) {
	NSBezierPath *path = [NSBezierPath bezierPathWithRect:NSRectFromRectangle(bounds)];
	[path fill];
}

void XDrawingContext::fillOval(Pong::Rectangle bounds) {
	NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:NSRectFromRectangle(bounds)];
	[path fill];
}
