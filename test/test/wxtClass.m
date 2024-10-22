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

+(void)load{
    NSLog(@"wojiazaibaba");
}

-(void)end{
    NSLog(@"end");
    a = 10;
    wxtSubClass *df;
    df->dou = 10;
}

-(void)printName{
    NSLog(@"我是爸爸");
}

- (id)copyWithZone:(nullable NSZone *)zone{
   
    wxtClass * temp = [[self class] allocWithZone:zone];
    temp.name = _name;
    temp.age = _age;
    
    
    return temp;
    
    
    
}



@end
