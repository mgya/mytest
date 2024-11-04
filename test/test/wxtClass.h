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


-(void)changeName:(NSString*)name;
@property(assign,nonatomic)NSInteger age;
@property(retain,nonatomic,readonly)NSString * name;
-(void)printName;



-(void)woshishui;


-(NSString*)get2;

-(void)find;

+(void)load;
+(BOOL)accessInstanceVariablesDirectly;
@property(readonly)int a;




@end


