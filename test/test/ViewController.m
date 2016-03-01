//
//  ViewController.m
//  test
//
//  Created by wangxiongtao on 15/12/13.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import "wxtClass.h"
#import "KeychainItemWrapper.h"



@interface ViewController ()

@end

@implementation ViewController{
    UIImageView * myImageView;
    UIPageControl * myPageControl;
    NSString *noBlock;
    
    NSInteger all;
    NSInteger alled;
    NSLock * pLock;
}

@synthesize test = _test;

- (void)viewDidLoad {
    
    
    
    NSLog(@"%@",[self class]);
    NSLog(@"%@",[super class]);
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton * red = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    red.backgroundColor = [UIColor grayColor];
    [self.view addSubview:red];
    [red addTarget:self action:@selector(red:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect rect = red.frame;
    
    rect = red.bounds;
    
    
    UIButton * yell = [[UIButton alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];
    yell.backgroundColor = [UIColor grayColor];
    [self.view addSubview:yell];
    [yell addTarget:self action:@selector(yell:) forControlEvents:UIControlEventTouchUpInside];
    
    
    myImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DSC01425.JPG"]];
    
    [myImageView setFrame:CGRectMake(100, 400, 320, 300)];
    
    [self.view addSubview:myImageView];
    

    
    
    //组线程，同时下载多个图片
/*
    [self groupImage];
*/
    
    
/*
     [self scrollView];
*/
    
    
/*
     [self pageControl];
*/

    
//    [self delegate];
    
    
//    [self myBlock];
    
    
//    [self myNSInvocationOperation];

 //   [self myThread];
    
    //子线程下载显示图片
/*
     [self myGCD];
 */
    
    //卖票锁演示
   
//    all = 100;
//    pLock = [[NSLock alloc]init];
//    [self myLock];

    
    /*NSThread
    [self performSelectorInBackground:@selector(longTime:) withObject:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    */
    
    //深copy和浅copy
   // [self myCopy];
    
//    UITableviewDemo
//    [self UITableviewDemo];
    
    
 //   [self writefile:@"这里写了字符串的log"];
    
//钥匙串里存储
  //  [self myKeychain];
    
//最简单的加密解密
//    [self jiamijiemi];

    
    // 创建一个本地推送
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    //设置10秒之后
    NSDate *pushDate = [NSDate dateWithTimeIntervalSinceNow:10];
    if (notification != nil) {
        // 设置推送时间
        notification.fireDate = pushDate;
        // 设置时区
        notification.timeZone = [NSTimeZone defaultTimeZone];
        // 设置重复间隔
        notification.repeatInterval = kCFCalendarUnitDay;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody = @"推送内容";
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber = 1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
        notification.userInfo = info;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:notification];   
    }
    
    
    
    
    
    UIApplication *app = [UIApplication sharedApplication];
    //获取本地推送数组
    NSArray *localArray = [app scheduledLocalNotifications];
    //声明本地通知对象
    UILocalNotification *localNotification;
    if (localArray) {
        for (UILocalNotification *noti in localArray) {
            NSDictionary *dict = noti.userInfo;
            if (dict) {
                NSString *inKey = [dict objectForKey:@"key"];
                if ([inKey isEqualToString:@"name"]) {
                    if (localNotification){
                        localNotification = nil;
                    }
                    localNotification = noti;
                  //  break;
                }
            }
        }
        
        //判断是否找到已经存在的相同key的推送
        if (!localNotification) {
            //不存在初始化
            localNotification = [[UILocalNotification alloc] init];
        }
        
        if (localNotification) {
            //不推送 取消推送
            [app cancelLocalNotification:localNotification];
            return;
        }
    
    }
    
}



-(void)jiamijiemi{
    char *p = "abcd1234";
    
    int len = strlen(p);
    
    char *new = malloc(len);
    
    
    for (int i = 0; i<len; i++) {
        char a = p[i]^0x34a3d4c5;
        new[i] = a;
    }
    NSLog(@"加密后＝＝＝%s",new);
    
    
    len = strlen(new);
    
    char *old = malloc(len);
    
    for (int i = 0; i<len; i++) {
        char a = new[i]^0x34a3d4c5;
        old[i] = a;
    }
    NSLog(@"解密后＝＝＝%s",old);
}

-(void)UITableviewDemo{
    TableViewControllerDemo * demo = [[TableViewControllerDemo alloc]init];
    
    [self.navigationController pushViewController:demo animated:YES];
    
    
}

-(void)myCopy{
    testclass * test = [[testclass alloc]init];
    
    NSMutableString * p = [[NSMutableString alloc]initWithString: @"wxt"];
    NSLog(@"%p---%@",p,p);
    
    test.TestCopy = p;
    NSLog(@"%p---%@",test.TestCopy,test.TestCopy);
    test.TestStrong = p;
    NSLog(@"%p---%@",test.TestStrong,test.TestStrong);
    

    
    [p appendString:@"!!!!!!!!"];
    //p如果为不可变类型，均为浅拷贝，所以地址和数据都没变。
    NSLog(@"%p---%@",test.TestCopy,test.TestCopy);
    NSLog(@"%p---%@",test.TestStrong,test.TestStrong);
    
    
}


-(void)myLock{
    
    NSThread * p1 = [[NSThread alloc]initWithTarget:self selector:@selector(bill) object:nil];
    NSThread * p2 = [[NSThread alloc]initWithTarget:self selector:@selector(bill) object:nil];
    NSThread * p3 = [[NSThread alloc]initWithTarget:self selector:@selector(bill) object:nil];
    
    [p1 setName:@"线程1"];
    [p2 setName:@"线程2"];
    [p3 setName:@"线程3"];
    
    [p1 start];
    [p2 start];
    [p3 start];
    
}

-(void)bill{
    for (; ; ) {
    //   [pLock lock];
       @synchronized(self){
        if (all > 0) {
            [NSThread sleepForTimeInterval:0.01];
            all --;
            alled = 100 - all;
            NSLog(@"卖出去%zd  还剩下%zd 线程%@",alled,all,[[NSThread currentThread] name]);
        }else{
            break;
        }
      //  [pLock unlock];
    }
    }
}


-(void)myThread{
//    [NSThread detachNewThreadSelector:@selector(longTime:) toTarget:self withObject:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    
    NSThread* myThread = [[NSThread alloc] initWithTarget:self
                                                   selector:@selector(longTime:)
                                                     object:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    [myThread start];
}


-(void)myNSInvocationOperation{
    
    
    NSString * url = @"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg";
    NSInvocationOperation * myTest = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(longTime:) object:url];
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    [queue addOperation:myTest];

    
}

-(void)longTime:(NSString*)url{
    NSURL * nsUrl = [NSURL URLWithString:url];
    NSData * nsData = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * pImage = [[UIImage alloc]initWithData:nsData];
    
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:pImage waitUntilDone:YES];
    
    NSLog(@"end");
}

-(void)updateImage:(UIImage *) pImage{
    NSLog(@"start");

    myImageView.image = pImage;

}


-(void)myBlock{
    
    NSString * str1 = @"str1";
    NSMutableString  * str2= [NSMutableString stringWithFormat:@"str2"];
    int a = 10;
    
    
    noBlock = @"init";
    
    
    NSLog(@"初始化%@%p---%@%p",str1,str1,str2,str2);
    
    void (^wxt)();
    
    wxt = ^(){
        
    };
    
    
    void(^testblock)() = ^(){
         NSLog(@"block里%@%p--!!!!-%@%p",str1,str1,str2,str2);
        NSLog(@"block里a = %d",a);
        
        
        NSLog(@"inblock = %@",noBlock);
        noBlock  = @"inblock";
        NSLog(@"outblock = %@",noBlock);
    };
    
    noBlock = @"updata";
    
    str1 = @"hahha111";
    [str2 appendString:@"2222222"];
    
    a=100;
    
      NSLog(@"赋值%@%p--!!!!-%@%p",str1,str1,str2,str2);
    
    
    testblock();
     NSLog(@"block后%@%p--!++++!-%@%p",str1,str1,str2,str2);

}



-(void)myGCD{
    UIImageView * test = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 300, 500)];
    NSURL * url = [NSURL URLWithString:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 耗时的操作
        
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            test.image = image;
        });
    });

    
    [self.view addSubview:test];
}

-(void)groupImage{
    UIImageView * test1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 200, 200)];
    UIImageView * test2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 400, 200, 200)];
    UIImageView * test3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 650, 200, 200)];
    
    __block UIImage  *image1;
    __block UIImage *image2;
    __block UIImage *image3;
    
    
    NSURL * url = [NSURL URLWithString:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSData * data1 = [[NSData alloc]initWithContentsOfURL:url];
        image1 = [[UIImage alloc]initWithData:data1];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            test1.image = image1;
        });
        
        
    });
    dispatch_group_async(group, queue, ^{
        NSData * data2 = [[NSData alloc]initWithContentsOfURL:url];
        image2 = [[UIImage alloc]initWithData:data2];
        
    });
    dispatch_group_async(group, queue, ^{
        NSData * data3 = [[NSData alloc]initWithContentsOfURL:url];
        image3 = [[UIImage alloc]initWithData:data3];
        
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        //组完了更新剩余的界面
        test2.image = image2;
        test3.image = image3;
        NSLog(@"updateUi");
    });
    
    [self.view addSubview:test1];
    [self.view addSubview:test2];
    [self.view addSubview:test3];


}



-(void)scrollView{
    UIScrollView * myScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    UIImageView * ImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pere_david_s_deer-002.jpg"]];
    
    myScrollView.contentSize = ImageView.bounds.size;
    
    [myScrollView addSubview:ImageView];
    
    [self.view addSubview:myScrollView];
}


-(void)pageControl{
    
    myImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pere_david_s_deer-002.jpg"]];
    
    [myImageView setFrame:CGRectMake(0, 0, 320, 300)];
    
    [self.view addSubview:myImageView];
    
    
    myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 500, 100, 100)];
    myPageControl.pageIndicatorTintColor = [UIColor redColor];
    myPageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    myPageControl.numberOfPages = 10;
    [self.view addSubview:myPageControl];
    
    [myPageControl addTarget:self action:@selector(changPC:) forControlEvents:UIControlEventValueChanged];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(run)  userInfo:nil repeats:YES];
    
}

-(void)changPC:(UIPageControl *)sender{
    
    if (sender.currentPage%2 == 0) {
        
        
        [UIView animateWithDuration:2 animations:^{
                    myImageView.image = [UIImage imageNamed:@"DSC01425.jpg"];
   
        }];


    }else{
        
        [UIView animateWithDuration:2 animations:^{
                   myImageView.image = [UIImage imageNamed:@"DSC01529.jpg"];
            
        }];
    }

}





-(void)setTest:(NSString *)test{
    
}

-(NSString*)test{
    return @"!!";
}



-(void)run{
    if (myPageControl.currentPage%2 == 0) {
        myImageView.image = [UIImage imageNamed:@"DSC01425.jpg"];
    }else{
        myImageView.image = [UIImage imageNamed:@"DSC01529.jpg"];
    }
    
    myPageControl.currentPage++;
    
    if (myPageControl.currentPage == myPageControl.numberOfPages-1) {
        myPageControl.currentPage = 0;
    }
    _test = @"d";
}


-(void)red:(UIButton*)sender{
    self.view.backgroundColor = [UIColor redColor];
}

-(void)yell:(UIButton*)sender{
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)delegate{
    testclass * p = [[testclass alloc]init];
    p.delegate = self;
    [p runTest];
}

-(void)print:(NSString *)input{
    NSLog(@"====%@====",input);
}


//字典转换成字符串
-(NSString*)DataTOjsonString:(id)object
{
    if (object == nil) {
        return nil;
    }
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

//写文件
- (void)writefile:(NSString *)string
{
    NSArray *paths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *homePath = [paths objectAtIndex:0];
    
    NSString *filePath = [homePath stringByAppendingPathComponent:@"testfile.text"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:filePath]) //如果不存在
    {
        NSString *str = @"记录文件";
        [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
    }
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    
    [fileHandle seekToEndOfFile];  //将节点跳到文件的末尾
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *str = [NSString stringWithFormat:@"\n%@\n%@",datestr,string];
    
    NSData* stringData  = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    [fileHandle writeData:stringData]; //追加写入数据
    
    [fileHandle closeFile];
}

-(void)myKeychain{
    
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"Account Number" accessGroup:nil];
    
    NSString *myValues =  [wrapper  objectForKey:(id)kSecAttrService];
    NSString *name =  [wrapper  objectForKey:(id)kSecAttrAccount];
    NSString * uuid =  [wrapper objectForKey:(id)kSecValueData];
    NSLog(@"读取到了如下数据：%@==%@===%@",myValues,name,uuid);
    

    
    //首次执行该方法时，uuid为空
        if ([uuid isEqualToString:@""])
    
        {
            NSLog(@"这是这个设备第一次安装");
        
   
            [wrapper setObject:@"myappkey" forKey:(id)kSecAttrService];
            [wrapper setObject:@"wangxiongtao" forKey:(id)kSecAttrAccount];
            [wrapper setObject:@"安装标记" forKey:(id)kSecValueData];
            
            myValues =  [wrapper  objectForKey:(id)kSecAttrService];
            name =  [wrapper  objectForKey:(id)kSecAttrAccount];
            uuid =  [wrapper objectForKey:(id)kSecValueData];
            NSLog(@"存储了如下数据：%@==%@===%@",myValues,name,uuid);

        }else{
            myValues =  [wrapper  objectForKey:(id)kSecAttrService];
            name =  [wrapper  objectForKey:(id)kSecAttrAccount];
            uuid =  [wrapper objectForKey:(id)kSecValueData];

            
            NSLog(@"之前装过此设备，获得如下数据：%@==%@===%@",myValues,name,uuid);

        }
    
    //清空设置
   // [wrapper resetKeychainItem];

    

}

@end
