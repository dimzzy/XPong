#ifndef XPong_XDrawingContext_h
#define XPong_XDrawingContext_h

#include "DrawingContext.h"
#import <Cocoa/Cocoa.h>

inline NSRect NSRectFromRectangle(Pong::Rectangle rectangle) {
	return NSMakeRect(rectangle.x, rectangle.y, rectangle.width, rectangle.height);
}

class XDrawingContext : public Pong::DrawingContext {
	
public:
	XDrawingContext(NSGraphicsContext *xcontext);
	virtual ~XDrawingContext();
	virtual void setFillColor(Pong::RGBColor const &color);
	virtual void fillRectangle(Pong::Rectangle bounds);
	virtual void fillOval(Pong::Rectangle bounds);
	
private:
	NSGraphicsContext *_xcontext;
};

#endif
