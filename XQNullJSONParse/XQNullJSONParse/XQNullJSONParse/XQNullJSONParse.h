//
//  NSMutableDictionary+XQNSNull.h
//  Lunkr
//
//  Created by Bill on 16/3/3.
//  Copyright © 2016年 qxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XQNSNull)

- (NSDictionary *)xqRemoveNull;

@end


@interface NSMutableDictionary (XQNSNull)

- (NSMutableDictionary *)xqRemoveNull;

@end

@interface NSArray (XQNSNull)

- (NSArray *)xqRemoveNull;

@end

