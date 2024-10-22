//
//  myUibutton.m
//  test
//
//  Created by wangxt on 9/10/2024.
//  Copyright © 2024 wangxiongtao. All rights reserved.
//

#import "myUibutton.h"

@implementation myUibutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    
    if (!self.userInteractionEnabled
        ||self.hidden||self.alpha<0.01) {
        
        NSLog(@"mybutton--hittest--1");
        return nil;
    }
    
    if ([self pointInside:point withEvent:event]) {
        return self;
    }
    
    NSLog(@"mybutton--hittest--2");
    return nil;
    
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    
    float inPointX = point.x;
    float inPointY = point.y;
    
    float pointX = self.frame.size.width/2;
    float pointY = self.frame.size.height/2;
    
    
    if (sqrtf((inPointX-pointX)*(inPointX-pointX)+(inPointY-pointY)*(inPointY-pointY)) < pointX) {
        return YES;
    }
    
    
    NSLog(@"mybutton--pointinside--%@",event);
    return NO;
}
@end

