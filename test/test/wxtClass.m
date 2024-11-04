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



@implementation wxtClass{
    
    NSString *name2;
}



@synthesize a;


-(void)changeName:(NSString*)name{
    
    [self willChangeValueForKey:@"name"];
    
    _name = name;
    
    [self didChangeValueForKey:@"name"];
}

-(void)setName:(NSString *)name{
    _name = name;
    name2 = @"xxxxxxxxx";
}

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

-(NSString*)getName12{
    return @"ddd";
}

+(BOOL)accessInstanceVariablesDirectly{
    return NO;
}

- (NSString *)get2{
    return name2;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    
    if (sel == @selector(find)) {
        return NO;
    }
    
    return [super resolveInstanceMethod:sel];
}

-(void)find{
    NSLog(@"aaa");
}




-(void)woshishui{
    [self myName];
    
}

-(void)myName{
    NSLog(@"I am wxt");
}


@end
