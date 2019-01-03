//
//  KeychainTool.h
//  WisdomSupplementary
//
//  Created by pro on 2017/7/12.
//  Copyright © 2017年 com.phoenixEducationPublishing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>
@interface KeychainTool : NSObject
/**
 *  储存字符串到🔑钥匙串
 *
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSString *)sValue key:(NSString *)sKey;


/**
 *  从🔑钥匙串获取字符串
 *
 *  @param sKey 对应的Key
 *
 *  @return 返回储存的Value
 */
+ (NSString *)readKeychainValue:(NSString *)sKey;


/**
 *  从🔑钥匙串删除字符串
 *
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;


@end
