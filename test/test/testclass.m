//
//  testclass.m
//  test
//
//  Created by wangxiongtao on 15/12/23.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import "testclass.h"


@implementation testclass



- (void)setBType:(BOOL)type{
    _bType = type;
}


-(id)init{
   self = [super init];

    
    
    return self;
}

-(void)runTest{
    [self.delegate print:@"23435"];

}

+(void)oneClass{
    NSLog(@"类方法1");
    
}

+(void)twoClass{
    NSLog(@"类方法2");
}

-(void)one{
    NSLog(@"实例方法1");
}
-(void)two{
     NSLog(@"实例方法2");
}




@end


