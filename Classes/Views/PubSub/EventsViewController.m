//
//  EventsViewController.m
//  webgnosus
//
//  Created by Troy Stribling on 9/7/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import "EventsViewController.h"
#import "MessageModel.h"
#import "AccountModel.h"
#import "ServiceItemModel.h"
#import "MessageCellFactory.h"
#import "SectionViewController.h"
#import "EventMessageViewController.h"
#import "PubMessageCache.h"
#import "SubMessageCache.h"
#import "XMPPClientManager.h"
#import "XMPPClient.h"
#import "XMPPJID.h"
#import "XMPPMessage.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface EventsViewController (PrivateAPI)

- (void)addEventButton;
- (void)addXMPPClientDelgate;
- (void)removeXMPPClientDelgate;
- (void)loadAccount;
- (void)loadMessages;

@end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EventsViewController

//-----------------------------------------------------------------------------------------------------------------------------------
@synthesize events;
@synthesize service;
@synthesize node;
@synthesize name;
@synthesize account;
@synthesize eventType;
@synthesize addEventButton;

//===================================================================================================================================
#pragma mark EventsViewController

//===================================================================================================================================
#pragma mark EventsViewController PrivateAPI

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)createAddEventButton {
    if (self.eventType == kPUB_MODE) { 
        self.navigationItem.rightBarButtonItem = self.addEventButton;
    }
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)sendEventButtonWasPressed:(id)sender {
    EventMessageViewController* viewController = [[EventMessageViewController alloc] initWithNibName:@"EventMessageViewController" bundle:nil];
    viewController.service = self.service;
    viewController.node = self.node;
	[self.navigationController pushViewController:viewController animated:YES]; 
}	

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)addXMPPClientDelgate {
    if (self.account) {
        [[XMPPClientManager instance] delegateTo:self forAccount:self.account];
    }
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)removeXMPPClientDelgate {
    if (self.account) {
        [[XMPPClientManager instance] removeXMPPClientDelegate:self forAccount:self.account];
    }
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)loadAccount {
    self.account = [AccountModel findFirstDisplayed];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)loadEvents {
    if (self.eventType == kPUB_MODE) { 
        self.events = [[PubMessageCache alloc] initWithNode:self.node andAccount:self.account];
    } else {
        self.events = [[SubMessageCache alloc] initWithNode:self.node andAccount:self.account];
    }
    [self.tableView reloadData];
}

//===================================================================================================================================
#pragma mark XMPPClientDelegate

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)xmppClient:(XMPPClient*)client didReceiveEvent:(XMPPMessage*)message {
    [self loadEvents];
}

//===================================================================================================================================
#pragma mark UIViewController

//-----------------------------------------------------------------------------------------------------------------------------------
- (id)initWithNibName:(NSString*)nibName bundle:(NSBundle*)nibBundle  {
    if (self = [super initWithNibName:nibName bundle:nibBundle]) {
        self.addEventButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(sendEventButtonWasPressed:)];
    }
    return self;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad {
    [self createAddEventButton];
    [super viewDidLoad];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [self loadAccount];
    [self addXMPPClientDelgate];
    self.navigationItem.title = @"Events";
    [self loadEvents];
    [super viewWillAppear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated {
    [self removeXMPPClientDelgate];
	[super viewWillDisappear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//===================================================================================================================================
#pragma mark UITableViewController

//===================================================================================================================================
#pragma mark UITableViewDeligate

//-----------------------------------------------------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    return [self.events tableView:tableView heightForRowAtIndexPath:indexPath];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* sectionView = nil;
    if (self.account) {
        sectionView = [SectionViewController viewWithLabel:[NSString stringWithFormat:@"%@/%@", [[UserModel nodeToJID:self.node] full], self.name]]; 
    }
    return sectionView; 
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    return kCELL_SECTION_TITLE_HEIGHT;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.events count];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath {  
    return [self.events tableView:tableView cellForRowAtIndexPath:indexPath];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.events tableView:tableView didSelectRowAtIndexPath:indexPath];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//===================================================================================================================================
#pragma mark NSObject

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)dealloc {
    [super dealloc];
}

@end

