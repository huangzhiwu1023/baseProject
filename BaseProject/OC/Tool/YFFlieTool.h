//
//  YFFlieTool.h
//  jsyf_user
//
//  Created by pro on 2017/10/18.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YFFlieTool : NSObject
+ (NSString *)getDocumentsFliePath;//documents目录
+ (NSString *)getCachesFliePath;//Caches目录
+ (NSString *)getTmpFliePath;//tmp目录
+ (NSString *)getUserInfoPath:(NSString *)key;//保存用户信息目录
//获取路径文件的大小
+ (double)fileSize:(NSString *)filePath;
//文件是否存在，若不存在，则创建并返回结果，若存在则返回YES
+ (BOOL)fileIsExistAtPath:(NSString *)path;
//文件夹是否存在，若不存在，则创建并返回结果，若存在则返回YES
+ (BOOL)directoryIsExistAtPath:(NSString *)path;

/** 删除文件 */
+(BOOL)deleteFile:(NSString *)filePath;

+(CGSize)getImageSizeWithURL:(id)imageURL;


//模型转字典
+(NSDictionary *)dicModel:(NSObject *)model;
//字典转模型

//+(YFUserModelSenddata *)getUresModel;
//+(void )saveUresModel:(YFUserModelSenddata *)model;

//设置资讯字体
+(void)setNewsWorld;
//时间格式
+ (NSString *)getDateStringWithTimeStr:(NSString *)str;
+ (NSString *)getTimeStrWithString:(NSString *)str;
//十六进制与字符串互转
+ (NSString *)convertHexStrToString:(NSString *)str;
+ (NSString *)convertStringToHexStr:(NSString *)str;

+ (NSString *)base64StringFromText:(NSString *)text;



@end
