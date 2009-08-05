//
//  XMPPIQ.m
//  webgnosus
//
//  Created by Troy Stribling on 3/29/09.
//  Copyright 2009 Plan-B Research. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "XMPPStanza.h"

//-----------------------------------------------------------------------------------------------------------------------------------
@class XMPPQuery;
@class XMPPSession;
@class XMPPBind;
@class XMPPCommand;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface XMPPIQ : XMPPStanza

//-----------------------------------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------------------------------
+ (XMPPIQ*)createFromElement:(NSXMLElement *)element;
- (XMPPIQ*)initWithType:(NSString*)iqType;
- (XMPPIQ*)initWithType:(NSString*)iqType toJID:(NSString*)iqTo;

//-----------------------------------------------------------------------------------------------------------------------------------
- (XMPPQuery*)query;
- (void)addQuery:(XMPPQuery*)child;

- (XMPPSession*)session;
- (void)addSession:(XMPPSession*)child;

- (XMPPBind*)bind;
- (void)addBind:(XMPPBind*)child;

- (XMPPCommand*)command;
- (void)addCommand:(XMPPCommand*)child;

@end
