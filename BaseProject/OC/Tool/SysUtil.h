/**
 SysUtil, Created by niuming 2016-8-4
 */

//static long timestampGap=0;

@interface SysUtil : NSObject{
}

+(SysUtil *)sharedInstance;
+(long)getServerTimestamp;
+(void)setServerTimestamp:(long)ts;

+(long)getLocalTimestamp;
+(NSString *)getLocalTimeString;

//时间戳转指定格式时间x
+(NSString *)getTimeWithTimeStamp:(long) timestamp;

+(void)setCurrentViewController:(UIViewController *)currentVC;
+(UIViewController *)getCurrentViewController;

+(void)showMessage:(UIViewController *)owner andMsg:(NSString *)msg andYOffset:(CGFloat)offset;
+(void)showMessageWithWindowMsg:(NSString *)msg andYOffset:(CGFloat)offset;
+(void)openProgressRound:(UIViewController *)owner andText:(NSString *)text andYOffset:(CGFloat)offset;
+(void)openWindowProgressRound:(UIViewController *)owner andText:(NSString *)text andYOffset:(CGFloat)offset;
+(void)closeProgressRound;

//微信分享
+(BOOL)weixinShare:(NSString *)url andTitle:(NSString *)title andDescription:(NSString *)description andImgurl:(NSString *)imgurl andFlag:(int)flag;


//z指定时间格式转换为时间戳
+(long)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
//时间格式相互转换
+(NSString *)timeFormatterSwitchTimesFormatter:(NSString *)formatTime OldFormatter:(NSString *)oldFormatter andReturnFormatter:(NSString *)format;

//json字符串->dic
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


+(NSString *) utf8ToUnicode:(NSString *)string;

//eg:2017-09-15 周五
+ (NSString *)getSignLocalTimeStr;

+ (void)openCallOnView:(UIView *)view withNumber:(NSString *)number;

//用户信息
//+(ESUserBasicBean *)getUserBasicBean;
//+(void)setUserBasicBean:(ESUserBasicBean *)bean;


@end

