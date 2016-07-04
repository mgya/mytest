//
//  UIImage+my_imageName.m
//  test
//
//  Created by wangxiongtao on 16/7/4.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "UIImage+my_imageName.h"
#import <objc/runtime.h>

@implementation UIImage (my_imageName)


+(UIImage*)myImageName:(NSString*)name{
    
    
    name =  [name stringByAppendingString:@"_new"];
    
    
    return [UIImage myImageName:name];
    
}

+(void)load{
    Method one = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method two = class_getClassMethod([UIImage class], @selector(myImageName:));

    method_exchangeImplementations(one, two);
                    
}



@end
