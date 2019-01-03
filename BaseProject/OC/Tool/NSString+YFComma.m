//
//  NSString+YFComma.m
//  jsyf_user
//
//  Created by 吕祥 on 2017/11/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "NSString+YFComma.h"

@implementation NSString (YFComma)

- (NSURL *)lx_URL{
    return [NSURL URLWithString:self];
}

- (bool)isEmpty {
    return self.length == 0;
}

- (NSString *)trim {
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}
- (NSString *)allTrim {
    return [[self trim] stringByReplacingOccurrencesOfString:@" " withString:@""];
}


+(NSString*)strmethodComma:(NSString*)str {
    NSString *intStr;
    NSString *floStr;
    if ([str containsString:@"."]) {
        NSRange range = [str rangeOfString:@"."];
        floStr = [str substringFromIndex:range.location];
        intStr = [str substringToIndex:range.location];
    }else{
        floStr = @"";
        intStr = str;
    }
    if (intStr.length <=3) {
        return [intStr stringByAppendingString:floStr];
    }else{
        NSInteger length = intStr.length;
        NSInteger count = length/3;
        NSInteger y = length%3;
        NSString *tit = [intStr substringToIndex:y] ;
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
        for (int i =0; i < count; i ++) {
            NSInteger index = i + i *3;
            [det insertString:@","atIndex:index];
        }
        if (y ==0) {
            det = [[det substringFromIndex:1]mutableCopy];
        }
        intStr = [tit stringByAppendingString:det];
        return [intStr stringByAppendingString:floStr];
    }
}


@end
