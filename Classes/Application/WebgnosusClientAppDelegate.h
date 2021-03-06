//
//  WebgnosusClientAppDelegate.h
//  webgnosus
//
//  Created by Troy Stribling on 1/1/09.
//  Copyright Plan-B Research 2009. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <UIKit/UIKit.h>

//-----------------------------------------------------------------------------------------------------------------------------------
@class RosterViewController;
@class HistoryViewController;
@class PubSubViewController;
@class ServiceViewController;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface WebgnosusClientAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> {
    IBOutlet UIWindow* window;
    IBOutlet RosterViewController* rosterViewController;
    IBOutlet PubSubViewController* pubSubViewController;
	IBOutlet HistoryViewController* historyViewController;
    IBOutlet ServiceViewController* serviceViewController;
    UINavigationController* navRosterViewController;
    UINavigationController* navPubSubViewController;
    UINavigationController* navHistoryViewController;
    UITabBarController* tabBarController;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) UIWindow* window;
@property (nonatomic, retain) PubSubViewController* pubSubViewController;
@property (nonatomic, retain) RosterViewController* rosterViewController;
@property (nonatomic, retain) HistoryViewController* historyViewController;
@property (nonatomic, retain) ServiceViewController* serviceViewController;
@property (nonatomic, retain) UINavigationController* navRosterViewController;
@property (nonatomic, retain) UINavigationController* navPubSubViewController;
@property (nonatomic, retain) UINavigationController* navHistoryViewController;
@property (nonatomic, retain) UITabBarController* tabBarController;

//-----------------------------------------------------------------------------------------------------------------------------------

@end

