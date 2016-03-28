//
//  blockViewViewController.h
//  test
//
//  Created by wangxiongtao on 16/3/25.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blockViewViewController : UIViewController


typedef void(^blockToPage)(NSString*);

@property(nonatomic,strong)blockToPage test;


-(void)input:(blockToPage)block;


@end
