//
//  MyInstance.m
//  test
//
//  Created by wangxiongtao on 16/4/25.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "MyInstance.h"

@implementation MyInstance



+(MyInstance*)shareMyInstance{
    
   static MyInstance * test = nil;
    static dispatch_once_t p;
    dispatch_once(&p, ^{
         test = [[MyInstance alloc]init];
    });
    
    return test;
}


@end
