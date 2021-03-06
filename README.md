DWUUID
======

A simple Objective-C wrapper for [CFUUID][CFUUID].<br>
© 2012 Dan Wineman. Published under the [MIT License](http://www.opensource.org/licenses/MIT).

Usage
-----

A DWUUID is immutable and has the same uniqueness guarantees as [CFUUID][CFUUID] (Universally Unique Identifier, a 128-bit value generated using the computer's Ethernet hardware address and a timestamp). It conforms to NSCoding and NSCopying, and it implements `-hash` and `-isEqual:`, so it can be used as an NSDictionary key.

`DWUUID.m` may be compiled with or without ARC.

Examples
--------

```objective-c
#import "DWUUID.h"

DWUUID *uuid = [[DWUUID alloc] init];
    
// Get the UUID as a string
NSString *uuidString = [uuid stringValue];

// Get the UUID as a 16-byte CFUUIDBytes struct
CFUUIDBytes uuidBytes = [uuid bytes];
    
// Easy logging
NSLog(@"My UUID is: %@", uuid);
    
// Clean up (if not using ARC)
[uuid release];
```

[CFUUID]: https://developer.apple.com/library/mac/#documentation/CoreFoundation/Reference/CFUUIDRef/Reference/reference.html
