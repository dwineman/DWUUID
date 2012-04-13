//
//  DWUUID.m
//
//  Copyright (c) 2012 Daniel Wineman. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of 
//  this software and associated documentation files (the "Software"), to deal in 
//  the Software without restriction, including without limitation the rights to 
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
//  of the Software, and to permit persons to whom the Software is furnished to do 
//  so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all 
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
//  SOFTWARE.

#import "DWUUID.h"

@implementation DWUUID

- (id)init
{
	if ((self = [super init]))
		_CFUUID = CFUUIDCreate(NULL);
	return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init]))
	{
		NSString *stringRep = [decoder decodeObjectForKey:@"UUID"];
		_CFUUID = CFUUIDCreateFromString(NULL, (__bridge CFStringRef)stringRep);
	}
	return self;
}

- (void)dealloc
{
	CFRelease(_CFUUID);
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:[self stringValue] forKey:@"UUID"];
}

- (NSString *)stringValue
{
	return (__bridge_transfer NSString *)CFUUIDCreateString(NULL, _CFUUID);
}

- (CFUUIDBytes)bytes
{
	return CFUUIDGetUUIDBytes(_CFUUID);
}

- (BOOL)isEqual:(id)object
{
	if (object == self)
		return YES;
	
	if ([object isKindOfClass:[DWUUID class]])
	{
		CFUUIDBytes myBytes = [self bytes];
		CFUUIDBytes objectBytes = [(DWUUID *)object bytes];
		return (memcmp(&myBytes, &objectBytes, sizeof(CFUUIDBytes)) == 0);
	}
	
	return NO;
}

- (NSUInteger)hash
{
	return CFHash(_CFUUID);
}

- (id)copyWithZone:(NSZone *)zone
{
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<UUID: %@>", [self stringValue]];
}

@end