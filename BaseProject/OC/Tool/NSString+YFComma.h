//
//  NSString+YFComma.h
//  jsyf_user
//
//  Created by 吕祥 on 2017/11/28.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YFComma)
@property (nonatomic, readonly) NSURL *lx_URL;

//字符串每隔3位加一个逗号
+(NSString*)strmethodComma:(NSString*)string;

- (bool)isEmpty;
- (NSString *)trim;
- (NSString *)allTrim; //剔除所有空格包括中间的

@end
