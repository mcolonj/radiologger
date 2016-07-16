//
//  syssound.h
//  testsys
//
//  Created by Michael Colon on 7/16/16.
//  Copyright © 2016 Michael Colon. All rights reserved.
//

#include <stdio.h>
#include <emmintrin.h>
#include <inttypes.h>
#include <time.h>
#ifdef __MACH__
#include <mach/mach_traps.h>
#include <mach/mach_time.h>
#endif
#include <math.h>

#ifndef NSEC_PER_SEC
#define NSEC_PER_SEC 1000000000ull
#endif

#ifndef __MACH__

#define TIME_ABSOLUTE CLOCK_REALTIME
typedef struct timespec mach_timespec_t;
typedef unsigned int mach_port_t;

static inline uint64_t mach_absolute_time(void);
static inline void clock_sleep_trap(mach_port_t clock_port, int sleep_type, time_t sec, long nsec, mach_timespec_t *remain);
#endif // __MACH__
void square_am_signal(float time, float frequency);
