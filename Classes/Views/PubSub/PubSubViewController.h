//
//  PubSubViewController.h
//  webgnosus
//
//  Created by Troy Stribling on 9/7/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <UIKit/UIKit.h>

//-----------------------------------------------------------------------------------------------------------------------------------
@class AccountModel;
@class SectionViewController;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PubSubViewController : UITableViewController {
	UIBarButtonItem* addPubSubItemButton;
	UIBarButtonItem* editAccountsButton;
	NSMutableArray* pubSubItems;
    AccountModel* account;
    SectionViewController* sectionViewController;
    NSInteger eventType;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) UIBarButtonItem* addPubSubItemButton;
@property (nonatomic, retain) UIBarButtonItem* editAccountsButton;
@property (nonatomic, retain) NSMutableArray* pubSubItems;
@property (nonatomic, retain) AccountModel* account;
@property (nonatomic, retain) SectionViewController* sectionViewController;
@property (nonatomic, assign) NSInteger eventType;

//-----------------------------------------------------------------------------------------------------------------------------------

@end
