//
//  wxtClass.h
//  test
//
//  Created by wangxiongtao on 15/12/29.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wxtClass : NSObject<NSCopying>{
    }

@property(assign,nonatomic)NSInteger age;
@property(retain,nonatomic)NSString * name;
-(void)printName;

+(void)load;

@property(readonly)int a;


@end


