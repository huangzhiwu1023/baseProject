//
//  NSString+YFRegular.h

#import <Foundation/Foundation.h>

/**
 *  常用正则表达式
 */
@interface NSString (YFRegular)

// 邮箱符合性验证。
- (BOOL)isValidateEmail;

// 全是数字。
- (BOOL)isNumber;

// 验证英文字母。
- (BOOL)isEnglishWords;

// 验证密码：6—16位，只能包含字符、数字和 下划线。
- (BOOL)isValidatePassword;

// 验证是否为汉字。
- (BOOL)isChineseWords;

// 验证是否为网络链接。
- (BOOL)isInternetUrl;

// 验证是否为电话号码。正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
- (BOOL)isPhoneNumber;

// 验证是否为手机号码
- (BOOL)isMobilePhoneNum;

// 验证是否为11位数字
- (BOOL)isElevenDigitNum;

// 验证15或18位身份证。
- (BOOL)isIdentifyCardNumber;

- (BOOL)isValidPersonID;

- (NSString *)urlEncode;
- (NSString *)urlDecode;
@end
