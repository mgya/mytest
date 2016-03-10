//
//  coodingData.h
//  test
//
//  Created by wangxiongtao on 16/3/9.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "codingDataTest.h"

@interface codingData : NSObject<NSCoding>


@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,strong)NSArray *soon;
@property(nonatomic,strong)codingDataTest *test;
@property(nonatomic,assign)float money;



@end
