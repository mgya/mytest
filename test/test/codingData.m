//
//  coodingData.m
//  test
//
//  Created by wangxiongtao on 16/3/9.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "codingData.h"

@implementation codingData


@synthesize age;
@synthesize name;
@synthesize soon;
@synthesize test;
@synthesize money;


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeInteger:age forKey:@"age" ];
    [aCoder encodeObject:name forKey:@"name" ];
    [aCoder encodeObject:soon forKey:@"soon"];
    [aCoder encodeObject:test forKey:@"test"];
    [aCoder encodeDouble:money forKey:@"money"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        age = [aDecoder decodeInt32ForKey:@"age"];
        name = [aDecoder decodeObjectForKey:@"name"];
        soon = [aDecoder decodeObjectForKey:@"soon"];
        test = [aDecoder decodeObjectForKey:@"test"];
        money = [aDecoder decodeDoubleForKey:@"money"];
    }
    return self;
}




@end
