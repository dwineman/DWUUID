DWUUID
======

A simple Objective-C wrapper for [CFUUID][CFUUID].<br>
© 2012 Daniel Wineman. Published under the [MIT License](http://www.opensource.org/licenses/MIT).

Usage
-----

A DWUUID is immutable and has the same uniqueness guarantees as [CFUUID][CFUUID]. It conforms to NSCoding and NSCopying, and it implements `-hash` and `-isEqual:`, so it can used as an NSDictionary key.

```objective-c
DWUUID *uuid = [[DWUUID alloc] init];
    
// Get the UUID as a string
NSString *uuidString = [uuid stringValue];

// Get the UUID as 16 bytes
NSData *uuidBytes = [uuid bytes];
    
// Easy logging
NSLog(@"My UUID is: %@", uuid);
    
// Clean up
[uuid release];
```

[CFUUID]: https://developer.apple.com/library/mac/#documentation/CoreFoundation/Reference/CFUUIDRef/Reference/reference.html
