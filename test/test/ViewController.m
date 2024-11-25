
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
#import "codingData.h"
#import "codingDataTest.h"
#import "blockViewViewController.h"
#import "myUibutton.h"
#import "NSString+PrintLog.h"

#import "wxtClass+wangyuqi.h"
#import "wxtClass+leilei.h"


#import "wxtSubClass.h"


#import "MyInstance.h"

#import "UIImageView+WebCache.h"

#import <AudioToolbox/AudioToolbox.h>

#import "weixin.h"
#import "qq.h"

#import <objc/runtime.h>


#import "gifView.h"

#import "YLGIFImage.h"
#import "YLImageView.h"

#import "wxtObserve.h"



#define add(x,y) x+y


static NSString *const BaseURLString = @"http://www.raywenderlich.com/downloads/weather_sample/";

@interface ViewController ()

@end

@implementation ViewController{
    UIImageView * myImageView;
    UIPageControl * myPageControl;
    NSString *noBlock;
    
    NSInteger all;
    NSInteger alled;
    NSLock * pLock;
    
    NSMutableDictionary *dataDict;
    NSMutableArray *parserObjects;
    NSString *parserString;
    
    myUibutton * start;
    
    AVAudioPlayer *audioPlayer;
    
    UIImageView *zhezhaoImageView;
    
    UIScrollView *scrollView;

    int offset;
    
    NSMutableArray *contentViews;

}

@synthesize test = _test;

- (void)viewDidLoad {
    
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.view.frame = CGRectMake(10, 30, 60, 200);
    
    
    NSLog(@"%@",[self class]);
    NSLog(@"%@",[super class]);
    wxtSubClass *subClass = [[wxtSubClass alloc]init];

    
    wxtClass *wxt = [[wxtClass alloc] init];
    
    
    dispatch_queue_t myQueue;
    
    myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
  
  
    dispatch_group_t group_t = dispatch_group_create();
    
    dispatch_group_async(group_t, myQueue, ^{
        NSLog(@"-----计时1开始");
        for (int i = 0; i<10000; i++) {
            NSLog(@"%d",i);
        }
        NSLog(@"-----计时1结束");
    });
    
    dispatch_group_async(group_t, myQueue, ^{
        NSLog(@"-----计时2开始");
        for (int i = 0; i<30000; i++) {
            NSLog(@"%d",i);
        }
        NSLog(@"-----计时2结束");
    });
    
    dispatch_group_notify(group_t, dispatch_get_main_queue(), ^{
        NSLog(@"全部计时完成");
    });
    
    dispatch_group_async(group_t, myQueue, ^{
        NSLog(@"-----计时3开始");
        for (int i = 0; i<50000; i++) {
            NSLog(@"%d",i);
        }
        NSLog(@"-----计时3结束");
    });
    
    

    
    
    
    
    
    
    
    
    
    
    wxt.age = 10;
    [wxt printName];
    
    [wxt find];
    
    
  //  wxt.name = @"ttt";
    
    NSLog(@"---%@",wxt.name) ;
    
  
    
    NSLog(@"---%@",[wxt valueForKey:@"age"]) ;
    
    NSLog(@"---%@",wxt.name) ;
    
    
    
    wxtObserve * wxtServer = [[wxtObserve alloc]init];
    [wxt addObserver:wxtServer forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
   
 //   wxt.name = @"sss";
    
    [wxt valueForKey:@"name12"];
    
  
    NSLog(@"--%@",[wxt get2]);
    
 
    [wxt changeName:@"qq"];
//    gifView * vc = [[gifView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
//    
// 
//    
//    NSURL * nsUrl = [NSURL URLWithString:@"http://img.gaoxiaogif.cn/GaoxiaoGiffiles/images/2015/11/25/haiguotou.gif"];
//    NSData * nsData = [NSData dataWithContentsOfURL:nsUrl];
//    
//    [vc loadData:nsData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
//    
//    vc.userInteractionEnabled = NO;
//    
//    [self.view addSubview:vc];
//    return;
    
    
//    YLImageView* imageView = [[YLImageView alloc] initWithFrame:self.view.frame];
//    CGFloat centerX = self.view.center.x;
//    [imageView setCenter:CGPointMake(centerX, self.view.center.y)];
//    [self.view addSubview:imageView];
//    imageView.image = [YLGIFImage imageNamed:@"joy.gif"];
//    
//    
//    
//    NSLog(@"1111");
//    
//    
//    
//    
//    
//    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // return;
    
    UIButton * red = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    red.backgroundColor = [UIColor orangeColor];
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
    
    
    UIButton * pushOpen = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 100, 100)];
    pushOpen.backgroundColor = [UIColor redColor];
    [pushOpen setTitle:@"10秒后推送消息" forState:UIControlStateNormal];
    pushOpen.titleLabel.font = [UIFont systemFontOfSize:12];
    [pushOpen addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
    
    
    

    UIButton * pushClose = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    pushClose.backgroundColor = [UIColor redColor];
    [pushClose setTitle:@"停止推送消息"forState:UIControlStateNormal];
    pushClose.titleLabel.font = [UIFont systemFontOfSize:12];
    [pushClose addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushOpen];
    [self.view addSubview:pushClose];
    
    
    start = [[myUibutton alloc]initWithFrame:CGRectMake(150, 300, 100, 100)];
    start.backgroundColor = [UIColor blueColor];
    [start setTitle:@"开始测试"forState:UIControlStateNormal];
    start.titleLabel.font = [UIFont systemFontOfSize:12];
   // start.layer.masksToBounds = YES;
    start.layer.cornerRadius = 10;
    [start addTarget:self action:@selector(chick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *a = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 50)];
    a.backgroundColor = [UIColor yellowColor];
    a.layer.shadowOpacity = 0.5;
    a.layer.shadowColor = UIColor.orangeColor.CGColor;
    [start addSubview:a];
    
    [self.view addSubview:pushOpen];
    [self.view addSubview:pushClose];
    [self.view addSubview:start];
    
    
    wxtClass * one = [[wxtClass alloc]init];
  //  one.name = @"wxt";
    
    
    wxtClass * p = [one copy];
    
  //  one.name = @"1111";
    
 
    NSLog(@"value is %@",p.name);
    
    
    tengxun * myqq = [[qq alloc]init];
    tengxun * myweixin = [[weixin alloc]init];
    [myqq eat:myqq];
    [myweixin eat:myweixin];
    

    contentViews = [[NSMutableArray alloc]init];
    
    
    
    
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
//     [self myGCD];
 
    
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
 //   [self myKeychain];
    
//最简单的加密解密
//    [self jiamijiemi];
    
    
 //   [self KVC];
    
    
//    [self myCoding];
    //NSData的转换
    
    
  //  ASIHttp的使用
 //   [self myASIHttp];
    
    // AFHTTP的使用
  //  [self myAFHttp];
    
    //单例的使用
 //   [self MyInstance];
    
    
    //交换类方法和实例方法
 //   [self swap];
    
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([UIImage class], &outCount);
    
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    

    
        //刮开涂层的效果
   // [self openImage];
    
    
    
    
    
}




-(void)openImage{
    //刮开涂层的效果
    
    UILabel * myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 400, 100, 100)];
    myLabel.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:myLabel];
    myLabel.text = @"大家都来\n磨擦磨擦\n似魔鬼的\n步伐步伐";
    myLabel.numberOfLines = 0;
    myLabel.textAlignment = NSTextAlignmentCenter;
    
    zhezhaoImageView = [[UIImageView alloc]initWithFrame:myLabel.frame];
    zhezhaoImageView.image = [UIImage imageNamed:@"DSC01425.JPG"];
    [self.view addSubview:zhezhaoImageView];

}

//刮开涂层的效果移动时间
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 触摸任意位置
    UITouch *touch = touches.anyObject;
    // 触摸位置在图片上的坐标
    CGPoint cententPoint = [touch locationInView:zhezhaoImageView];
    // 设置清除点的大小
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 20, 20);
    // 默认是去创建一个透明的视图
    UIGraphicsBeginImageContextWithOptions(zhezhaoImageView.bounds.size, NO, 0);
    // 获取上下文(画板)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把imageView的layer映射到上下文中
    [zhezhaoImageView.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    zhezhaoImageView.image = image;
}


-(void)MyInstance{
    
    
    MyInstance *test = [ MyInstance shareMyInstance];
    
    MyInstance *test1 = [ MyInstance shareMyInstance];
    
    MyInstance *test2 = [ MyInstance shareMyInstance];
}


-(void)chick{
    
    //去重操作
 //   [self quchong];
    
    //打印当前时间
//    [self myTime];
    
    
 
    //子线程
//    [self performSelectorInBackground:@selector(myLog:) withObject:@"子线程"];
    
    //主线程
//    [self performSelectorOnMainThread:@selector(myLog:) withObject:@"主线程" waitUntilDone:YES];

    
 //通过block从页面反传值
//    [self pushblock];
    

 //   [self play];
 
    UIView * p = [[UIView alloc]init];
    
    [p printLog];
    
    
    NSString * wxt = @"我就是我，不一样的烟火";
    [wxt printLog];
    
    
    
    
//    wxtClass * myClass = [[wxtClass alloc]init];
//    myClass.a = 100;
//    
//    wxtSubClass *subClass = [[wxtSubClass alloc]init];
//    [subClass end];
    
    //遍历查找和放入NSHashTable查找
  //  [self find];
    
    offset = 200;
    [self myScrollView];
    


//震动的代码
 //   AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
 
    


  

    
    
    
}


-(void)swap{
    

    [testclass oneClass];
    [testclass twoClass];
    // 获取两个类的类方法
    Method m1 = class_getClassMethod([testclass class], @selector(oneClass));
    Method m2 = class_getClassMethod([testclass class], @selector(twoClass));
    //交换两个类方法
    method_exchangeImplementations(m1, m2);
    [testclass oneClass];
    [testclass twoClass];
    
    
    testclass *myClass = [[testclass alloc]init];
    [myClass one];
    [myClass two];
    Method m3 = class_getInstanceMethod([testclass class], @selector(one));
    Method m4 = class_getInstanceMethod([testclass class], @selector(two));
    method_exchangeImplementations(m3, m4);
    
    [myClass one];
    [myClass two];
    
}



-(void)mySdWebImage{
 
    
    [self mySdWebImage];
    
    UIImageView * sdVIew = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 100, 100)];
    
    [self.view addSubview:sdVIew];
    
    NSURL *web = [NSURL URLWithString:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    //
    //
    //    //加载图片并缓存
    //    [sdVIew sd_setImageWithURL:web];
    //
    //    //加载图片并缓存
    //    [sdVIew sd_setImageWithURL:web completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //         NSLog(@"这里可以在图片加载完成之后做些事情");
    //    }];
    //
    //
    //     //加载图片并缓存，并且占位图片
    //    [sdVIew sd_setImageWithURL:web placeholderImage:[UIImage imageNamed:@"DSC01425.JPG"] ];
    //
    //
    //     //加载图片并缓存，并且占位图片
    //    [sdVIew sd_setImageWithURL:web placeholderImage:[UIImage imageNamed:@"DSC01425.JPG"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //
    //        NSLog(@"这里可以在图片加载完成之后做些事情");
    //    }];
    //
    //
    //    //带设置参数的下载
    //    [sdVIew sd_setImageWithURL:web placeholderImage:[UIImage imageNamed:@"DSC01425.JPG"]  options:SDWebImageRetryFailed];
    
    [sdVIew sd_setImageWithURL:web placeholderImage:[UIImage imageNamed:@"DSC01425.JPG"] options:SDWebImageProgressiveDownload completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"这里可以在图片加载完成之后做些事情");
    }];
}

-(void)find{
    
    NSLog(@"kaishi");
    
    NSHashTable *list = [[NSHashTable alloc]init];
    
    
    NSInteger w = 0;
    
    NSString * A = @"asecfdfdsfesdfm;slfkjqwjerljfdslfkjqwjgfdgfdfsrtefsfjdso;fjsdfe0859038503984werjsdiojfldsajfljrewrewqkljfdsljasdjwerewlrjeqwljrlsjfdsajfsdljfdslfkjqwjerqwerewteqwtjqewjreqwj5312j5321j53jjfsdjfsd;jgdjg0w4jfgfderewteqwtjqewjreqwj5312j5321j53jjfsdjfsd;jgdjg0w4jfgfdgfdgfdfadsdsfegbdfdsfogirpoitor;jgfmdgklfdjgorpeitregfdgfdgfdkqweljtetiticjdso;fjsdfe0859038503984rtqweresdfdsfdsgfdsgfdgtru7657545646546546erqwerewteqwtjqewjreqwj5312j5321j53jjfsdjfsd;jgdjg0w4jkqwel#jtetiticelg";
    NSString * B = @"jsdfe0859038icjdsofdg9038503984werjsdiojfldsajfljrewrewqkljfdsljasdjwerewlrjeqwljrlsjfdsajfsdljfddgfdgfdsvdfgfdgfdgretretsdgfdgfdhdgdsfdsgertrefgdsgfdglsjfeg";
    
    //遍历的方法
    
    //    BOOL C = NO;
    //
    //        for (int i = 0; i < B.length; i++) {
    //
    //            for (int j = 0; j < A.length; j++) {
    //                w++;
    //                NSRange  rA = NSMakeRange(j, 1);
    //                NSRange  rB = NSMakeRange(i, 1);
    //
    //
    //                if ([[A substringWithRange:rA] isEqualToString:[B substringWithRange: rB]] ) {
    //                    C = YES;
    //                    break;
    //
    //                }else{
    //                    C = NO;
    //
    //                }
    //            }
    //
    //            if (C == NO) {
    //                break;
    //            }
    //        }
    //    NSLog(@"over");
    //
    //    NSLog(@"%d",C);
    
    
    //NSHashTable的方法
    
    BOOL C = YES;
    
    for (int i = 0; i < A.length; i++) {
        w++;
        NSRange  r = NSMakeRange(i, 1);
        [list addObject:[A substringWithRange:r]];
    }
    
    for (int i = 0; i < B.length; i++) {
        w++;
        NSRange  r = NSMakeRange(i, 1);
        if (![list containsObject:[B substringWithRange:r]]) {
            C = NO;
            break;
        }
    }
    NSLog(@"over");
    NSLog(@"%d",C);
    NSLog(@"%ld",w);
}


-(void)play{
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatchQueue, ^(void) {
        NSError *audioSessionError = nil;
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        if ([audioSession setCategory:AVAudioSessionCategoryPlayback error:&audioSessionError]){
            NSLog(@"Successfully set the audio session.");
        } else {
            NSLog(@"Could not set the audio session");
        }
        
        
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:@"yycs" ofType:@"mp3"];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        
        audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
        
        if (audioPlayer != nil){
            audioPlayer.delegate = self;
            
            [audioPlayer setNumberOfLoops:-1];
            if ([audioPlayer prepareToPlay] && [audioPlayer play]){
                NSLog(@"Successfully started playing...");
            } else {
                NSLog(@"Failed to play.");
            }
        } else {
            
        }
    });
}



-(void)pushblock{
    
    blockViewViewController* vc = [[blockViewViewController alloc]init];
    

    
    [vc input:^(NSString* block){
        NSLog(@"===%@====",block);
        start.backgroundColor = [UIColor blackColor];

    }];
    
    
    [self.navigationController pushViewController:vc animated:NO];
    
    
}



-(void)myLog:(NSString*)log{
    
[self performSelectorOnMainThread:@selector(up) withObject:nil waitUntilDone:NO];
    
    
}

-(void)up{
    int i = 0;
    while (i < 10000) {
        i++;
        NSLog(@"!!!%d!!!!!!",i);
    }

    start.backgroundColor = [UIColor blackColor];
}



-(void)myTime{
   // 转换时间
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //    NSString *currentDateStr = [formatter stringFromDate:[NSDate date]];
    //    formatter.timeZone = [NSTimeZone defaultTimeZone];
    //    NSDate *date = [formatter dateFromString:currentDateStr];
    //    NSLog(@"%@", date);
    
    
    //获取当地的时间
    //    NSDate *date = [NSDate date];
    //    NSLog(@"%@", date);
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate: date];
    //    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    //    NSLog(@"enddate=%@",localeDate);
    


}


//去重操作
-(void)quchong{
    
    NSArray *array = @[@"12-11", @"12-11", @"12-11", @"12-12", @"12-13", @"12-14",@"12-10"];
    
    
    //用另外一个数组遍历。
    //    NSMutableArray *MuArry = [[NSMutableArray alloc]init];
    //
    //    for (NSString *item in array){
    //
    //        if (![MuArry containsObject:item]) {
    //            [MuArry addObject:item];
    //        }
    //
    //    }
    
    //        NSLog(@"%@",MuArry);
    
    
    //方法二
    //    array = [array valueForKeyPath:@"@distinctUnionOfObjects.self"];
    //    NSLog(@"%@", array);
    
    
    
    //利用字典的特性保存
        NSMutableDictionary *resultDict = [[NSMutableDictionary alloc] initWithCapacity:array.count];
        for (NSString *item in array) {
            [resultDict setObject:item forKey:item];
        }
        NSArray *resultArray = resultDict.allValues;
        NSLog(@"%@", resultArray);
    
   
    
    //方法三
    //    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:array];
    //    NSLog(@"%@", set.array);
    
    while (1) {
        NSLog(@"!!!!!%@!!!!!!",[NSThread currentThread]);
    }
}


-(void)myAFHttp{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFXMLParserResponseSerializer * responseSer = [AFXMLParserResponseSerializer alloc];
    [manager setResponseSerializer:responseSer];
    
    
    
    [manager GET:@"http://php.weather.sina.com.cn/xml.php?city=%CC%EC%BD%F2&password=DJOYnieT8234jlsK&day=0" parameters:nil success:^(NSURLSessionDataTask *operation,id responseObject){
        
        
        
        NSXMLParser * parser = (NSXMLParser *)responseObject;
        parser.delegate =self;
        [parser setShouldProcessNamespaces:YES];
        //此法基本可行，但是处理麻烦
        [parser parse];
        
    } failure:^(NSURLSessionDataTask *operation,NSError *error) {
        NSLog(@"!!!!");
    }];
}




-(void)myASIHttp{
    
    NSString * str =@"天津";
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
    
    NSLog(@"%@",[str stringByAddingPercentEscapesUsingEncoding:enc]);
    
    
    //天气数据
    NSURL *url = [NSURL URLWithString:@"http://php.weather.sina.com.cn/xml.php?city=%CC%EC%BD%F2&password=DJOYnieT8234jlsK&day=0"];
    


    //图片数据
    //    NSURL *url = [NSURL URLWithString:@"http://s9.51cto.com/wyfs01/M01/11/5D/wKioJlH1k33TF3WsAAOKT-6NP04749.jpg"];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://book.huyingread.com:9999/httpservice?cmd=getusertimer&uid=107355342&at=j4tvVXmsAU2sck9NxBzb2y6N94cEUrIg5xwN1icq1jE%3D&v=2.2.5.800&sign=bb364955bf94dc37c0a0dbc101244570"];

    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    
    [request setDelegate:self];
    
    //同步请求
  //  [request startSynchronous];
    
    
    //异步请求
    [request startAsynchronous];

    
}


//asihttp返回的数据
- (void)requestFinished:(ASIHTTPRequest *)request

{
    
    // 当以文本形式读取返回内容时用这个方法
    
 //   NSString *responseString = [request responseString];
    
    
    //有中文的xml格式
    NSString *responseString = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
    
    
    if (responseString != nil && responseString.length > 0) {
       //一般收到xml，json的数据
        NSData* xmlData = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        //用nsxml解析数据
        NSXMLParser * parser = [[NSXMLParser alloc]initWithData:xmlData];
        [parser setDelegate:self];
        [parser parse];
     
        NSLog(@"%@",xmlData);
        
    }else{//一般是收到图片数据等
        
        NSData *responseData = [request responseData];
        
        
        UIImage *image = [UIImage imageWithData: responseData];
        
        
        myImageView.image = image;
        
    }

    
    
}

//开始进行解析
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    
    
    dataDict = [[NSMutableDictionary alloc] initWithCapacity:0];  //每一条信息都用字典来存储
    parserObjects = [[NSMutableArray alloc] init];  //每一组信息都用数组来存，最后得到的数据即在此数组中
}


//发现元素开始符的处理函数
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
//    if (elementName != nil) {
//        parserString = elementName;
//    }
    NSLog(@"%@",elementName);
    

}

//处理标签包含内容字符
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //记录所取得的文字列
//    NSLog(@"%@",string);
//    
//    if ([string isEqualToString:@"\n"] ) {
//        return;
//    }
//    
//    
//    if (string != nil && string.length > 0) {
//        [dataDict setObject:string forKey:parserString];
//    }
    
    parserString = string;
    
}

//发现元素结束符的处理函数，保存元素各项目数据（即报告元素的结束标记）
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    [dataDict setObject:parserString forKey:elementName];
    NSLog(@"%@",dataDict);
}


//报告不可恢复的解析错误
- (void)requestFailed:(ASIHTTPRequest *)request

{
    
    NSError *error = [request error];
    
}

//报告解析的结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"over");
}


-(void)myCoding{
    codingData * logData = [[codingData alloc]init];
    logData.name = @"wxt";
    logData.age = 33;
    logData.soon = [[NSArray alloc]initWithObjects:@"wang",@"yu",@"qi", nil];
    logData.test = [[codingDataTest alloc]init];
    logData.test.p = @"hahaha";
    logData.money = 1.57;
    
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:logData];
    codingData *newdata = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    NSLog(@"%@,%zd",newdata.name,newdata.age);
}


-(void)open{
    //取消掉之前的所有通知
  //  [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
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
        notification.repeatInterval = kCFCalendarUnitMinute;
        // 推送声音
        notification.soundName = UILocalNotificationDefaultSoundName;
        // 推送内容
        notification.alertBody = @"推送内容";
        notification.alertAction = NSLocalizedString(@"起床了", nil);
        
        
        
        //显示在icon上的红色圈中的数子
        notification.applicationIconBadgeNumber += 1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *info = [NSDictionary dictionaryWithObject:@"name"forKey:@"key"];
        notification.userInfo = info;
        //添加推送到UIApplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:notification];
    }
    

}


-(void)myScrollView{
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 200, 100)];
    scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrollView];
    
    scrollView.contentSize = CGSizeMake(600, 100);
    
    scrollView.userInteractionEnabled = NO;
    
    
    UILabel *view1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    view1.text = @"1111111";
    view1.backgroundColor = [UIColor redColor];
    
    UILabel *view2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 0, 200, 100)];
    view2.text = @"2222222";
    view2.backgroundColor = [UIColor whiteColor];
    
    UILabel *view3 = [[UILabel alloc]initWithFrame:CGRectMake(400, 0, 200, 100)];
    view3.text = @"33333333";
    view3.backgroundColor = [UIColor yellowColor];
    
    
    
    
    [contentViews addObject:view1];
    [contentViews addObject:view2];
    [contentViews addObject:view3];
    
    [scrollView addSubview:view1];
    [scrollView addSubview:view2];
    [scrollView addSubview:view3];
    
}

-(void)close{
    
    if (offset == 600) {
        offset = 0;
    }
    
    CGPoint newOffset = CGPointMake(offset,0);

    [scrollView setContentOffset:newOffset animated:YES];
    offset+=200;
    
    //取消掉之前的所有通知
    //  [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    //取消掉通知
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
                    break;
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
    
    size_t len = strlen(p);
    
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
    
    [NSThread detachNewThreadSelector:@selector(longTime:) toTarget:self withObject:nil];
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
    UIImageView * testImagVIew = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 300, 500)];
    NSURL * url = [NSURL URLWithString:@"http://img.ivsky.com/download/img/tupian/pic/201509/11/pere_david_s_deer-002.jpg"];
    
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            NSLog(@"延迟2秒");
        });
    

    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 耗时的操作
        
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            testImagVIew.image = image;
        });
    });

    
    [self.view addSubview:testImagVIew];
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
    
    [DIOpenSDK registerApp:@"didi644344644F69736F6A326976526355" secret:@"f0045afac660f5d2c6ff955bf7b0bb92"];

    [DIOpenSDK showDDPage:self animated:YES params:nil delegate:self];
    self.view.backgroundColor = [UIColor redColor];
//    出租车司机端：
//    10100000274?nx5ubk
//    
//    专车司机端：
//    13000000113 000113
//    
//    乘客端：
//    13000000112 8888
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
