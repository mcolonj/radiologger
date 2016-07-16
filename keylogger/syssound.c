// Original Concept - SYSTEM BUS RADIO
// https://github.com/fulldecent/system-bus-radio
//  Copyright 2016 William Entriken

//  Modified by Michael Colon on 7/16/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
// https://github.com/mcolonj/keylogger

#include "syssound.h"

#ifndef __MACH__

static inline uint64_t mach_absolute_time(void) {
    mach_timespec_t tp;
    int res = clock_gettime(CLOCK_REALTIME, &tp);
    if (res < 0) {
        perror("clock_gettime");
        exit(1);
    }
    uint64_t result = tp.tv_sec * NSEC_PER_SEC;
    result += tp.tv_nsec;
    return result;
}

// non-conformant wrapper just for the purposes of this application
static inline void clock_sleep_trap(mach_port_t clock_port, int sleep_type, time_t sec, long nsec, mach_timespec_t *remain) {
    mach_timespec_t req = { sec, nsec };
    int res = clock_nanosleep(sleep_type, TIMER_ABSTIME, &req, remain);
    if (res < 0) {
        perror("clock_nanosleep");
        exit(1);
    }
}
#endif // __MACH__

__m128i reg;
__m128i reg_zero;
__m128i reg_one;
mach_port_t clock_port;
mach_timespec_t remain;

void square_am_signal(float time, float frequency) {
//    printf("Playing / %0.3f seconds / %4.0f Hz\n", time, frequency);
    uint64_t period = NSEC_PER_SEC / frequency;
    
    uint64_t start = mach_absolute_time();
    uint64_t end = start + time * NSEC_PER_SEC;
    
    while (mach_absolute_time() < end) {
        uint64_t mid = start + period / 2;
        uint64_t reset = start + period;
        while (mach_absolute_time() < mid) {
            _mm_stream_si128(&reg, reg_one);
            _mm_stream_si128(&reg, reg_zero);
        }
        clock_sleep_trap(clock_port, TIME_ABSOLUTE, reset / NSEC_PER_SEC, reset % NSEC_PER_SEC, &remain);
        start = reset;
    }
}
