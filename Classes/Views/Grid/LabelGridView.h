//
//  LabelGridView.h
//  webgnosus
//
//  Created by Troy Stribling on 4/18/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <UIKit/UIKit.h>
#import "GridView.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LabelGridView : GridView {
}

//-----------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------
- (id)initWithLabelViews:(NSMutableArray*)lableViews borderWidth:(CGFloat)initBorderWidth maxWidth:(CGFloat)initMaxWidth gridXOffset:(CGFloat)initXOffset andGridYOffset:(CGFloat)initYOffset;
- (void)setTextAlignment:(UITextAlignment)textAlignment forColumn:(NSUInteger)column;
- (void)setLineBreakMode:(UILineBreakMode)lineBreakMode forColumn:(NSUInteger)column;

//-----------------------------------------------------------------------------------------------------------------------------------
+ (NSMutableArray*)buildViews:(NSMutableArray*)data labelOffSet:(CGFloat)labelOffSet labelHeight:(CGFloat)labelHeight andFont:(UIFont*)labelFont;

@end
