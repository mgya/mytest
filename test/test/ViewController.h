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

#import "AFHTTPSessionManager.h"


#import <AVFoundation/AVFoundation.h>


#import "DIOpenSDK/DIOpenSDK.h"


@interface ViewController : UIViewController<testdelegate,ASIHTTPRequestDelegate,NSXMLParserDelegate,AVAudioPlayerDelegate,DIOpenSDKDelegate>


@property(nonatomic,strong)NSString * test ;


-(void)getID:(int)a;










@end

