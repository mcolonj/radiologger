//
//  Keys.m
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import "Keys.h"
#import <Carbon/Carbon.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "syssound.h"

@interface Keys()
@property (nonatomic, retain) AVAudioPlayer * audioPlayer;
@property (nonatomic, retain) NSArray * sounds;
@property (nonatomic, retain) NSArray * systemSounds;

@end

@implementation Keys

static Keys * _singleton = nil;

+(Keys*) sharedKeyLogger {
    
    
    if (! _singleton ) _singleton = [[Keys alloc] init];
    return _singleton;
}
//jdlsklkjkfsdlfkj
- (id) init {
    if((self = [super init])){
        _audioPlayer = [[AVAudioPlayer alloc] init];
        _sounds = @[
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"6" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"7" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"8" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"9" ofType:@"wav"]] error:nil],
           [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"10" ofType:@"wav"]] error:nil],
       ];
        //th kkk dkslkjdl falksd jksldkfja;lkjkjd;akdjfk a;lkjd;flkajds;
        
        _systemSounds = @[
           @220,
           @440,
           @660,
           @880,
           @1100,
           @1320,
           @1540,
           @1760
        ];
    }
    return self;
}

- (void)handleKeyPress:(NSEvent*)event {
//    NSLog(@"key event %@", [self keyCodeConversion:event.keyCode]);
    [((AVAudioPlayer*)_sounds[count%_sounds.count]) play];
    square_am_signal(0.090, [_systemSounds[count%_systemSounds.count] integerValue]);
    count++;
    
}
//
- (NSString*)keyCodeConversion:(unsigned short)keyCode {
    
    //Convert keyCode to string (no simple method around this)
    switch (keyCode) {
        case kVK_ANSI_A:                return @"a"; break;
        case kVK_ANSI_S:                return @"s"; break;
        case kVK_ANSI_D:                return @"d"; break;
        case kVK_ANSI_F:                return @"f"; break;
        case kVK_ANSI_H:                return @"h"; break;
        case kVK_ANSI_G:                return @"g"; break;
        case kVK_ANSI_Z:                return @"z"; break;
        case kVK_ANSI_X:                return @"x"; break;
        case kVK_ANSI_C:                return @"c"; break;
        case kVK_ANSI_V:                return @"v"; break;
        case kVK_ANSI_B:                return @"b"; break;
        case kVK_ANSI_Q:                return @"q"; break;
        case kVK_ANSI_W:                return @"w"; break;
        case kVK_ANSI_E:                return @"e"; break;
        case kVK_ANSI_R:                return @"r"; break;
        case kVK_ANSI_T:                return @"t"; break;
        case kVK_ANSI_Y:                return @"y"; break;
        case kVK_ANSI_1:                return @"1"; break;
        case kVK_ANSI_2:                return @"2"; break;
        case kVK_ANSI_3:                return @"3"; break;
        case kVK_ANSI_4:                return @"4"; break;
        case kVK_ANSI_6:                return @"6"; break;
        case kVK_ANSI_5:                return @"5"; break;
        case kVK_ANSI_Equal:            return @"="; break;
        case kVK_ANSI_9:                return @"9"; break;
        case kVK_ANSI_7:                return @"7"; break;
        case kVK_ANSI_Minus:            return @"-"; break;
        case kVK_ANSI_8:                return @"8"; break;
        case kVK_ANSI_0:                return @"0"; break;
        case kVK_ANSI_RightBracket:     return @"]"; break;
        case kVK_ANSI_O:                return @"o"; break;
        case kVK_ANSI_U:                return @"u"; break;
        case kVK_ANSI_LeftBracket:      return @"["; break;
        case kVK_ANSI_I:                return @"i"; break;
        case kVK_ANSI_P:                return @"p"; break;
        case kVK_ANSI_L:                return @"l"; break;
        case kVK_ANSI_J:                return @"j"; break;
        case kVK_ANSI_Quote:            return @"'"; break;
        case kVK_ANSI_K:                return @"k"; break;
        case kVK_ANSI_Semicolon:        return @"a"; break;
        case kVK_ANSI_Backslash:        return @"\\"; break;
        case kVK_ANSI_Comma:            return @","; break;
        case kVK_ANSI_Slash:            return @"/"; break;
        case kVK_ANSI_N:                return @"n"; break;
        case kVK_ANSI_M:                return @"m"; break;
        case kVK_ANSI_Period:           return @"."; break;
        case kVK_ANSI_Grave:            return @"`"; break;
        case kVK_ANSI_KeypadDecimal:    return @"."; break;
        case kVK_ANSI_KeypadMultiply:   return @"*"; break;
        case kVK_ANSI_KeypadPlus:       return @"+"; break;
        case kVK_ANSI_KeypadClear:      return @"<Clear>"; break;
        case kVK_ANSI_KeypadDivide:     return @"/"; break;
        case kVK_ANSI_KeypadEnter:      return @"<Enter>"; break;
        case kVK_ANSI_KeypadMinus:      return @"-"; break;
        case kVK_ANSI_KeypadEquals:     return @"="; break;
        case kVK_ANSI_Keypad0:          return @"0"; break;
        case kVK_ANSI_Keypad1:          return @"1"; break;
        case kVK_ANSI_Keypad2:          return @"2"; break;
        case kVK_ANSI_Keypad3:          return @"3"; break;
        case kVK_ANSI_Keypad4:          return @"4"; break;
        case kVK_ANSI_Keypad5:          return @"5"; break;
        case kVK_ANSI_Keypad6:          return @"6"; break;
        case kVK_ANSI_Keypad7:          return @"7"; break;
        case kVK_ANSI_Keypad8:          return @"8"; break;
        case kVK_ANSI_Keypad9:          return @"9"; break;
            
        case kVK_Return:                return @"<Return>"; break;
        case kVK_Tab:                   return @"<Tab>"; break;
        case kVK_Space:                 return @"<Space>"; break;
        case kVK_Delete:                return @"<Delete>"; break;
        case kVK_Escape:                return @"Escape"; break;
        case kVK_F1:                    return @"F1"; break;
        case kVK_F2:                    return @"F2"; break;
        case kVK_F3:                    return @"F3"; break;
        case kVK_F4:                    return @"F4"; break;
        case kVK_F5:                    return @"F5"; break;
        case kVK_F6:                    return @"F6"; break;
        case kVK_F7:                    return @"F7"; break;
        case kVK_F8:                    return @"F8"; break;
        case kVK_F9:                    return @"F9"; break;
        case kVK_F10:                   return @"F10"; break;
        case kVK_F11:                   return @"F11"; break;
        case kVK_F12:                   return @"F12"; break;
        case kVK_F13:                   return @"F13"; break;
        case kVK_F14:                   return @"F14"; break;
        case kVK_F15:                   return @"F15"; break;
        case kVK_F16:                   return @"F16"; break;
        case kVK_F17:                   return @"F17"; break;
        case kVK_F18:                   return @"F18"; break;
        case kVK_F19:                   return @"F19"; break;
        case kVK_F20:                   return @"F20"; break;
        case kVK_ForwardDelete:         return @"<Delete"; break;
        case kVK_LeftArrow:             return @"<Left Arrow>"; break;
        case kVK_RightArrow:            return @"<Right Arrow>"; break;
        case kVK_DownArrow:             return @"<Down Arrow>"; break;
        case kVK_UpArrow:               return @"<Up Arrow>"; break;
            
        default:
            return @"<Unknown>";
            break;
    }
}

@end
