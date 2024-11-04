//
//  wxtSubClass.m
//  test
//
//  Created by wangxiongtao on 16/3/29.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "wxtSubClass.h"

@implementation wxtSubClass


- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    
    [self woshishui];
    [super woshishui];
    return self;
}


-(void)woshishui{
    [self myName];
    
}

-(void)myName{
    NSLog(@"I am wxtsubClass");
}

@end
