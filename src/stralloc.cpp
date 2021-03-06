//////////////////////////////////////////////////////////////////////
//
//  FILE:       stralloc.cpp
//              String Allocator class methods
//
//  Part of:    Scid (Shane's Chess Information Database)
//  Version:    1.0
//
//  Notice:     Copyright (c) 1999  Shane Hudson.  All rights reserved.
//
//  Author:     Shane Hudson (sgh@users.sourceforge.net)
//
//////////////////////////////////////////////////////////////////////


#include "stralloc.h"
#include "misc.h"

#include <string.h>

void
StrAllocator::NewBucket ()
{
    bucketT * newBucket = new bucketT;
    newBucket->data = new char [BucketSize];
    newBucket->next = FirstBucket;
    newBucket->bytesFree = BucketSize;
    FirstBucket = newBucket;
}

char *
StrAllocator::NewLarge (uint size)
{
    // Called when the requested size exceeds bucket size.
    // So this should be rare.
    largeStrT * temp = new largeStrT;
    temp->next = LargeList;
    temp->size = size;
    temp->data = new char [size];
    LargeList = temp;
    return temp->data;
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// StrAllocator::Duplicate():
//      Duplicates an existing string.
//
char *
StrAllocator::Duplicate (const char * original)
{
    ASSERT (original != NULL);
    uint length = strLength (original);
    char * newStr = New (length + 1);
    char * s = newStr;
    while (*original) {
        *s = *original;  s++;  original++;
    }
    *s = 0;
    return newStr;
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// StrAllocator::Append():
//      Append to an existing string.
//
char *
StrAllocator::Append (const char * str, const char * tail, char delim)
{
    ASSERT (str != NULL);
    ASSERT (tail != NULL);

    uint oldSize  = strLength (str);
    uint tailSize = strLength (tail);
    uint addSize  = tailSize + (delim ? 1 : 0);
    uint newSize  = oldSize + addSize;

    if (str == LastAllocAddress && FirstBucket->bytesFree >= addSize) {
	// Append to last string.
	ASSERT(LastAllocSize == oldSize + 1);
	if (delim) {
	    LastAllocAddress[oldSize++] = delim;
	}
	::strncpy (LastAllocAddress + oldSize, tail, tailSize);
	LastAllocAddress[newSize] = '\0';
	LastAllocSize = newSize + 1;
	FirstBucket->bytesFree -= addSize;
	return LastAllocAddress;
    }
    
    // Allocate new string.
    char * newStr = New (newSize + 1);
    ::strncpy (newStr, str, oldSize);
    if (delim) {
	newStr[oldSize++] = delim;
    }
    ::strncpy (newStr + oldSize, tail, tailSize);
    newStr[newSize] = '\0';
    Delete (str);
    return newStr;
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// StrAllocator::MemoryUsed():
//      Return the amount of memory used in bytes.
uint
StrAllocator::MemoryUsed ()
{
    uint memUsed = 0;
    bucketT * bucket = FirstBucket;
    while (bucket != NULL) {
        memUsed += sizeof(bucketT) + BucketSize;
        bucket = bucket->next;
    }
    largeStrT * large = LargeList;
    while (large != NULL) {
        memUsed += sizeof(largeStrT) + large->size;
        large = large->next;
    }
    return memUsed;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// StrAllocator::DeleteAll():
//      Delete all strings.
//
void
StrAllocator::DeleteAll ()
{
    // First, delete every super-large string:
    while (LargeList != NULL) {
        largeStrT * temp = LargeList->next;
        delete[] LargeList->data;
        delete LargeList;
        LargeList = temp;
    }

    // Now delete every bucket:
    while (FirstBucket != NULL) {
        bucketT * temp = FirstBucket->next;
        delete[] FirstBucket->data;
        delete FirstBucket;
        FirstBucket = temp;
    }
    LastAllocAddress = NULL;
    LastAllocSize = 0;
}

//////////////////////////////////////////////////////////////////////
// EOF: stralloc.cpp
//////////////////////////////////////////////////////////////////////

