//
//  codingDataTest.m
//  test
//
//  Created by wangxiongtao on 16/3/10.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "codingDataTest.h"

@implementation codingDataTest

@synthesize p;



- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:p forKey:@"p"];
    
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        p = [aDecoder decodeObjectForKey:@"p"];
    }
    
    return self;
}



@end
