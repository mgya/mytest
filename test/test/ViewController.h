//
//  ViewController.h
//  test
//
//  Created by wangxiongtao on 15/12/13.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testclass.h"
#import "TableViewControllerDemo.h"
#import "ASIHTTPRequest.h"



@interface ViewController : UIViewController<testdelegate,ASIHTTPRequestDelegate,NSXMLParserDelegate>


@property(nonatomic,strong)NSString * test ;

@end

