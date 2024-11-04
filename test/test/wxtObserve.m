//
//  wxtObserve.m
//  test
//
//  Created by wangxt on 23/10/2024.
//  Copyright © 2024 wangxiongtao. All rights reserved.
//

#import "wxtObserve.h"
#import "wxtClass.h"

@implementation wxtObserve



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
    
    NSLog(@"new = %@----old = %@----new2=%@",[change objectForKey:@"new"],[change objectForKey:@"old"], [change valueForKey:NSKeyValueChangeNewKey]);
    
   // change valueForKey:<#(nonnull NSString *)#>
    
    
   
    
    NSLog(@"gaibianla");
    
}

@end
