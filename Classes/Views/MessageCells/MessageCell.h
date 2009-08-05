//
//  MessageCell.h
//  webgnosus
//
//  Created by Troy Stribling on 4/17/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <UIKit/UIKit.h>

//-----------------------------------------------------------------------------------------------------------------------------------
@class MessageModel;
@class MessageCell;
@class MessageModel;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MessageCell : UITableViewCell {
    IBOutlet UILabel* dateLabel;
    IBOutlet UILabel* jidLabel;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) UILabel* dateLabel;
@property (nonatomic, retain) UILabel* jidLabel;

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)setJidAndTime:(MessageModel*)message;

//-----------------------------------------------------------------------------------------------------------------------------------

@end
