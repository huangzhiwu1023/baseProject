//
//  StringUtil.m
//  meichai
//
//  Created by niuming on 15/4/28.
//  Copyright (c) 2015年 imac . All rights reserved.
//

#import "StringUtil.h"

@implementation StringUtil
//单例模式
+(StringUtil *)sharedInstance
{
    static StringUtil *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^(void) {
        sharedSingleton = [[self alloc] initialize];
    });
    return sharedSingleton;
}

-(id)initialize
{
    if(self == [super init] )
    {
        //initial something here
    }
    return self;
}

-(NSString *)stringToTrim:(NSString *)oldstr{
    NSString *trimmedString = [oldstr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
};

- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL || string.length<=0) {
        return YES;
    }else{
        return NO;
    }
}

-(BOOL)isEmailAddress:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

-(BOOL) isMobilePhone:(NSString *)mobile
{
    //手机号以13，15，17，18开头，八个 \d 数字字符 -> 以1开头的11位数字
    NSString *phoneRegex = @"^((1[0-9])|(1[0-9])|(1[0-9])|(1[0,0-9]))\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

- (BOOL)isUserNameFormat:(NSString *)userName {
    //^[a-zA-Z] + [a-zA-Z_-]{3-19}+$   ^[A-Za-z][A-Za-z0-9_\\-]{3,19}$
    NSString *userNameRegex = @"^[A-Za-z][A-Za-z0-9_\\-]{3,19}$";
    NSPredicate *userNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNameTest evaluateWithObject:userName];
}


-(float) getStringHeight:(NSString *)str width:(float)width font:(UIFont*)font{
    CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width,10000.0f) lineBreakMode:NSLineBreakByWordWrapping];
    return size.height;
}



-(NSString *)appendString:(NSString *)stringA andStringB:(NSString *)stringB andStringC:(NSString *)stringC andStringD:(NSString *)stringD{
    NSMutableString * result=[[NSMutableString alloc]init];
    if(stringA){
        [result appendString:stringA];
    }
    if(stringB){
        [result appendString:stringB];
    }
    if(stringC){
        [result appendString:stringC];
    }
    if(stringD){
        [result appendString:stringD];
    }
    
    return result;
}

-(NSString *)appendString:(NSArray *)stringArray{
    NSString *result = [stringArray componentsJoinedByString:@""];
    return result;
}

-(NSString *)base64String:(NSString *)plainString{
    // Create NSData object
    NSData *nsdata = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Get NSString from NSData object in Base64
    NSString *base64Encoded = [nsdata base64EncodedStringWithOptions:0];
    
    // Print the Base64 encoded string
    NSLog(@"base64Encoded: %@", base64Encoded);
    
    return base64Encoded;
}

-(NSString*)encodeString:(NSString*)plainString{
    
    NSString * encodedString = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)plainString, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    return encodedString;
}

-(NSString *)base64AndUrlEncodeString:(NSString*)plainString{
    NSString * str1 = [self base64String:plainString];
    NSString * str2 = [self encodeString:str1];
    return str2;
}

-(NSString *)trimZero:(NSString*)numberStr{
    NSString * s = nil;
    int offset = numberStr.length - 1;
    while (offset)
    {
        s = [numberStr substringWithRange:NSMakeRange(offset, 1)];
        if ([s isEqualToString:@"0"] || [s isEqualToString:@"."])
        {
            offset--;
        }
        else
        {
            break;
        }
    }
    NSString * outNumber = [numberStr substringToIndex:offset+1];
    NSLog(@"----result=%@", outNumber);
    return outNumber;
}

-(BOOL)isIntString:(NSString *)plainStr
{
    NSScanner* scan = [NSScanner scannerWithString:plainStr];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


//字典转json字符串
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    if (!dic) {
        return nil;
    }
    
    NSError *parseError = nil;
    NSLog(@"dicttoJson的dic == %@",dic);
   
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str  = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    if (parseError) {
        NSLog(@"jsonError:%@", parseError);
    }
    
    return [str urlEncode];

}


- (NSString*)jsonStringToDic:(NSDictionary *)dic

{
    if (!dic) {
        return nil;
    }
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str  = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    return str;
    
}
- (NSString *)jsonStringToArr:(NSArray *)arr

{
    if (!arr || [arr  isEqual: @[]]) {
        return nil;
    }
    
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    str  = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    
    return str;
}


@end
