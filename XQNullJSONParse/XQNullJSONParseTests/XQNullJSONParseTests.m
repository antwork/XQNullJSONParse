//
//  XQNullJSONParseTests.m
//  XQNullJSONParseTests
//
//  Created by Bill on 16/3/3.
//  Copyright © 2016年 gloolo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XQNullJSONParse.h"

@interface XQNullJSONParseTests : XCTestCase

@end

@implementation XQNullJSONParseTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    NSString *str= @"{\"null_dict\":null, \"null_dict1\":[null],\"uid\":\"#650#U\",\"null_array\":[null,\"0:1ch#AAAAAVbYBzAAAAXFl4\"],\"null_array1\":[null],\"type\":\"USER\",\"time\":\"2016-03-03 09:43:12.794\",\"null_dict_in_dict\":{    \"null_key\":null,    \"true_name\":\"\",    \"email\":\"ios2@test.com\",    \"user_type\":\"U\"},\"to\":{    \"uid\":\"#650#U\",    \"true_name\":\"\",    \"email\":\"ios1@test.com\",    \"user_type\":\"U\"},\"subject\":\"hello+world\",\"clientMid\":\"XbL44e3GxvviZytdEKZN\"}";
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableDictionary *opJSON = [NSMutableDictionary dictionaryWithDictionary:json];
    [opJSON setObject:@"ABC" forKey:[NSNull null]];
    
    json = [opJSON xqRemoveNull];
    
    id null_dict = json[@"null_dict"];
    XCTAssertNil(null_dict, @"null_dict must be nil");
    
    id null_dict1 = json[@"null_dict1"];
    XCTAssertNil(null_dict1, @"null array in dict must be nil");
    
    id uid = json[@"uid"];
    XCTAssertNotNil(uid, @"uid must not be nil");
    
    NSArray *null_array = json[@"null_array"];
    NSString *first = [null_array firstObject];
    XCTAssertTrue([first isEqualToString:@"0:1ch#AAAAAVbYBzAAAAXFl4"]);
    
    NSArray *null_array1 = json[@"null_array1"];
    XCTAssertNil(null_array1, @"one null in array must be nil");
    
    NSDictionary *null_dict_in_dict = json[@"null_dict_in_dict"];
    id null_value = null_dict_in_dict[@"null_key"];
    XCTAssertNil(null_value, @"null_dict must be nil");
    
    id null_value1 = [json objectForKey:[NSNull null]];
    XCTAssertNil(null_value1, @"key null must be nil");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testTime {
    NSDate *date = [NSDate date];
    for (int i = 0; i < 10000; i++) {
        [self testExample];
    }
    NSDate *end = [NSDate date];
    NSTimeInterval interval = [end timeIntervalSinceDate:date];
    NSLog(@"interval %f", interval);
    XCTAssertTrue(interval < 3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
