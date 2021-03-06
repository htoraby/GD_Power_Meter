/******************************************************************************/
//
// This file was generated by OSAcfg_Tool utility.
// Do not modify it to prevent data loss on next editing.
//
// PROJECT NAME: pic
//
// PLATFORM:     HT-PICC PRO for PIC16F1xxx
//
/******************************************************************************/


#ifndef _OSACFG_H
#define _OSACFG_H

//------------------------------------------------------------------------------
// SYSTEM
//------------------------------------------------------------------------------

#define OS_TASKS                3   // Number of tasks that can be active at one time
#define OS_DISABLE_PRIORITY         // old style constant
#define OS_PRIORITY_LEVEL  		OS_PRIORITY_DISABLED 

//------------------------------------------------------------------------------
// ENABLE CONSTANTS
//------------------------------------------------------------------------------

#define OS_ENABLE_TTIMERS           // Enable task timers (OS_Delay and OS_xxx_Wait_TO)
//#define OS_TTIMERS_OPTIMIZE_SIZE    // Optimize OS_Timer code for task timers by size


//------------------------------------------------------------------------------
// BANKS
//------------------------------------------------------------------------------

#define OS_BANK_OS              0   // RAM bank to allocate all system variables
#define OS_BANK_TASKS           1   // RAM bank to allocate task descriptors


//------------------------------------------------------------------------------
// TYPES
//------------------------------------------------------------------------------

#define OS_TTIMER_SIZE          1   // Size of task timers (1, 2 or 4)

#define OS_USE_INLINE_TIMER
#define OS_FUN_TABLE_BASE		0x0103

#endif



