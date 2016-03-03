//
//  NSMutableDictionary+XQNSNull.m
//  Lunkr
//
//  Created by Bill on 16/3/3.
//  Copyright © 2016年 qxu. All rights reserved.
//

#import "XQNullJSONParse.h"

@implementation NSDictionary (XQNSNull)

- (NSDictionary *)xqRemoveNull {
    NSMutableDictionary *opDict = [NSMutableDictionary dictionaryWithDictionary:self];
    
    NSDictionary *dict = (NSDictionary *)[opDict xqRemoveNull];
    
    return dict;
}

@end

@implementation NSMutableDictionary (XQNSNull)

- (NSMutableDictionary *)xqRemoveNull {
    NSMutableDictionary *results = [NSMutableDictionary dictionary];
    
    for (NSString *key in self.allKeys) {
        if ((NSNull *)key == [NSNull null]) {
            continue;
        }
        
        NSNull *value = [self objectForKey:key];
        
        if (value != [NSNull null]) {
            id oneItem = value;
            if ([value isKindOfClass:[NSArray class]]) {
                oneItem = [(NSArray *)value xqRemoveNull];
            } else if ([value isKindOfClass:[NSDictionary class]]) {
                oneItem = [(NSDictionary *)value xqRemoveNull];
            }
            if (oneItem) {
                [results setObject:oneItem forKey:key];
            }
        }
    }
    if (results.allKeys.count == 0) {
        return nil;
    }
    
    return results;
}

@end

@implementation NSArray (XQNSNull)

- (NSArray *)xqRemoveNull {
    NSMutableArray *results = [NSMutableArray array];
    for (NSNull *value in self) {
        if (value != [NSNull null]) {
            id oneItem = value;
            if ([value isKindOfClass:[NSArray class]]) {
                oneItem = [(NSArray *)value xqRemoveNull];
            } else if ([value isKindOfClass:[NSDictionary class]]) {
                oneItem = [(NSDictionary *)value xqRemoveNull];
            }
            if (oneItem) {
                [results addObject:oneItem];
            }
        }
    }
    
    if (results.count == 0) {
        return nil;
    }
    
    return results;
}

@end

