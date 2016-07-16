//
//  ViewController.m
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController()
@property (nonatomic, strong) AVAudioPlayer *player;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.status setStringValue:@"Developed by Michael Colon\nProof of concept for keylogging using system-bus-radio."];

}

- (void) viewDidAppear {
    [_player play];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction) playSound {
    AVAudioPlayer *sound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"wav"]] error:nil];
    [sound play];
}

- (IBAction) performClick:(id)sender {
    
}

@end
