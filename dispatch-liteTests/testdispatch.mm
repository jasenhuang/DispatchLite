//
//  testdispatch.m
//  dispatchlite
//
//  Created by jasenhuang on 15/7/30.
//  Copyright (c) 2015年 tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#include "tdispatch.h"

#define NeedsToWaitForBlock() __block BOOL blockFinished = NO
#define BlockFinished() blockFinished = YES
#define WaitForBlock() while (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, true) && !blockFinished)

@interface testdispatch : XCTestCase

@end

@implementation testdispatch

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    dispatch_init();
    NeedsToWaitForBlock();
    for (NSInteger i =0 ; i < 10; ++i){
        dispatch_logic_async([=]{
            NSLog(@"hello world [%@]", @(i));
            dispatch_after(1000 * (10 - i) , [=]{
                NSLog(@"hello world [%@]", @(i));
            });
        });
        Lite::Dispatch::PostTask(Lite::Dispatch::LOGIC, [=]{
            NSLog(@"hello world [%@]", @(i));
        });
        Lite::Dispatch::PostDelayedTask(Lite::Dispatch::LOGIC, [=]{
            NSLog(@"hello world [%@]", @(i));
        }, Lite::TimeDelta::FromSeconds(10 - i));
    }
    WaitForBlock();
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
