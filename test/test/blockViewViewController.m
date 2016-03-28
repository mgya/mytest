//
//  blockViewViewController.m
//  test
//
//  Created by wangxiongtao on 16/3/25.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "blockViewViewController.h"

@interface blockViewViewController ()

@end

@implementation blockViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   _test(@"传到第一个界面了，变黑");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)input:(blockToPage)block{
    _test = block;
}

@end
