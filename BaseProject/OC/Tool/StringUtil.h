//
//  StringUtil.h
//  meichai
//
//  Created by niuming on 15/4/28.
//  Copyright (c) 2015年 imac . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject
+(StringUtil *)sharedInstance;

-(NSString *)stringToTrim:(NSString *)oldstr;

- (BOOL) isBlankString:(NSString *)string;

-(BOOL)isEmailAddress:(NSString *)email;

-(BOOL) isMobilePhone:(NSString *)mobile;

//判断是否是登录名格式 (字母开头,字母 + 数字 + _ - 4- 20为 )
- (BOOL)isUserNameFormat:(NSString *)userName;
/**
 在指定的宽度下计算字符串的高度
 */
-(float) getStringHeight:(NSString *)str width:(float)width font:(UIFont*)font;

/**
 字符串拼接，适用于2-4个字符串
 */
-(NSString *)appendString:(NSString *)stringA andStringB:(NSString *)stringB andStringC:(NSString *)stringC andStringD:(NSString *)stringD;

/**
 字符串拼接，适用于N个字符串
 */
-(NSString *)appendString:(NSArray *)stringArray;

/**
 对字符串做base64
 */
-(NSString *)base64String:(NSString *)plainString;

/**
 对字符串做URLEncode
 */
-(NSString *)encodeString:(NSString*)plainString;

/**
 对字符串做Base64和URLEncode
 */
-(NSString *)base64AndUrlEncodeString:(NSString*)plainString;

/**
 去除小数点后多余的0
 */
-(NSString *)trimZero:(NSString*)numberStr;

/**
 判断是否为纯数字
 */
-(BOOL)isIntString:(NSString *)plainStr;



//字典转json字符串urlEncode
- (NSString*)dictionaryToJson:(NSDictionary *)dic;

//字典转json
- (NSString*)jsonStringToDic:(NSDictionary *)dic;

//数组转json
- (NSString *)jsonStringToArr:(NSArray *)arr;


@end
