//
//  testclass.h
//  test
//
//  Created by wangxiongtao on 15/12/23.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol testdelegate <NSObject>

-(void)print:(NSString*)input;

@end


@interface testclass : NSObject


@property(assign,nonatomic)BOOL bType;

@property(copy,nonatomic)NSString * p;

@property(nonatomic,assign)id<testdelegate>delegate;


@property(nonatomic,strong)NSString * TestStrong;
@property(nonatomic,copy)NSString * TestCopy;

+(void)oneClass;
+(void)twoClass;

-(void)one;
-(void)two;


-(void)runTest;

@end
