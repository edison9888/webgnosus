//
//  ActivityView.h
//  webgnosus
//
//  Created by Troy Stribling on 2/16/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <UIKit/UIKit.h>

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ActivityView : UIActionSheet <UIActionSheetDelegate> {
}

//-----------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------
- (id)initWithTitle:(NSString*)title inView:(UIView*)view;
- (void) dismiss;

@end
