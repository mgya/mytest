//
//  ViewController.m
//  test
//
//  Created by wangxiongtao on 15/12/13.
//  Copyright © 2015年 wangxiongtao. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>


@interface ViewController ()

@end

@implementation ViewController{
    UIImageView * myImageView;
    UIPageControl * myPageControl;
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
    
    
    UIButton * yell = [[UIButton alloc]initWithFrame:CGRectMake(150, 100, 100, 100)];
    yell.backgroundColor = [UIColor grayColor];
    [self.view addSubview:yell];
    [yell addTarget:self action:@selector(yell:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //子线程下载显示图片
/*
    [self loadImage];
*/
    
    
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
    
    [self delegate];

}



-(void)loadImage{
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

@end
