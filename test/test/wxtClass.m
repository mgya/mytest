//
//  wxtClass.m
//  test
//
//  Created by wangxiongtao on 15/12/29.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import "wxtClass.h"
#import "wxtSubClass.h"


@interface wxtClass()

-(void)end;

@end



@implementation wxtClass



@synthesize a;

-(void)end{
    NSLog(@"end");
    a = 10;
    wxtSubClass *df;
    df->dou = 10;
}

- (id)copyWithZone:(nullable NSZone *)zone{
   
    wxtClass * temp = [[self class] allocWithZone:zone];
    temp.name = _name;
    temp.age = _age;
    
    NSInteger a = self.hash;
    
    
    NSInteger b = (NSUInteger)self;
    
    
    return temp;
    
    
    
}



@end
