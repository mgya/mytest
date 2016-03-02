//
//  KvoClass.m
//  test
//
//  Created by wangxiongtao on 16/3/2.
//  Copyright © 2016年 wangxiongtao. All rights reserved.
//

#import "KvoClass.h"
#import "KvcClass.h"


@implementation KvoClass




NSMutableArray *m_observedPeople;

-(id) init;
{
    if(self = [super init]){
        m_observedPeople = [NSMutableArray new];
    }
    
    return self;
}

-(void) watchPersonForChangeOfAddress:(KvcClass *)p
{
    
    // this begins the observing
    [p addObserver:self
        forKeyPath:@"full.first"
           options:0
           context:@"发生了改变"];
    
    // keep a record of all the people being observed,
    // because we need to stop observing them in dealloc
    [m_observedPeople addObject:p];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context

{
    // use the context to make sure this is a change in the address,
    // because we may also be observing other things
    if(context == @"发生了改变") {
        NSString *name = [object valueForKey:@"name"];
        NSNumber *age = [object valueForKey:@"age"];
        NSLog(@"%@ has a new name&age: %@", name, age);
    }
}








@end
