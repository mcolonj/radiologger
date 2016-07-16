//
//  ViewController.m
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.status setStringValue:@"Developed by Michael Colon\nProof of concept for keylogging using system-bus-radio."];
}

- (void) viewDidAppear {
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

@end
