/**
 SysUtil, Created by niuming 2016-8-4
 */

#import "SysUtil.h"
#import "MBProgressHUD.h"



@interface SysUtil() {
    
}
-(id)initialize;
@end

static MBProgressHUD *HUD;
static long timestampGap=0;
static UIViewController *currentViewController;
static NSDictionary *honorListBeanDIc;

//static ESUserBasicBean *userBasicBean;

//内购数组
static NSArray *productArr;

@implementation SysUtil

-(id)initialize
{
    if(self == [super init] )
    {
        //initial something here
    }
    return self;
}

+(SysUtil *)sharedInstance
{
    static SysUtil *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^(void) {
        sharedSingleton = [[self alloc] initialize];
    });
    return sharedSingleton;
}

+(long)getServerTimestamp
{
    return timestampGap+[self getLocalTimestamp];
}

+(void)setServerTimestamp:(long)ts
{
    timestampGap=ts-[self getLocalTimestamp];
}

+(long)getLocalTimestamp{
    //标准时间
    NSDate *now = [NSDate date];
    //北京时间的时间戳
    NSString *tsStr = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]];
    return [tsStr longLongValue];
}

+(NSString *)getLocalTimeString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateNow = [NSDate date];
    return [formatter stringFromDate:dateNow];
}

+ (NSString *)getTimeWithTimeStamp:(long)timestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    timestamp = timestamp / 1000;
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];;
    return [formatter stringFromDate:date];
}



+(void)setCurrentViewController:(UIViewController *)currentVC{
    currentViewController=currentVC;
};

+(UIViewController *)getCurrentViewController{
    return currentViewController;
};

+(void)showMessage:(UIViewController *)owner andMsg:(NSString *)msg andYOffset:(CGFloat)offset
{
    if(msg.length==0)
    {
        return;
    }
    if (owner.view == nil) {
        return;
    }
    [HUD removeFromSuperview];
    HUD = nil;
    HUD = [[MBProgressHUD alloc] initWithView:owner.view];
    [owner.view addSubview:HUD];
    HUD.label.text = msg;
    HUD.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    [HUD setOffset:CGPointMake(0, offset)];
//    HUD.yOffset = offset;
    //HUD.xOffset = 100.0f;
//    [HUD hideAnimated:YES afterDelay:2];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);//显示2秒钟
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

+(void)showMessageWithWindowMsg:(NSString *)msg andYOffset:(CGFloat)offset
{
    if(msg.length==0)
    {
        return;
    }
    [HUD removeFromSuperview];
    HUD = nil;
    HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.labelText = msg;
    HUD.mode = MBProgressHUDModeText;
    
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    HUD.yOffset = offset;
    //HUD.xOffset = 100.0f;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(2);//显示2秒钟
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

+(void)openProgressRound:(UIViewController *)owner andText:(NSString *)text andYOffset:(float)offset{
    //初始化进度框，置于当前的View当中
    if (HUD) {
//        HUD.hidden = YES;
        [HUD removeFromSuperview];
        HUD =nil;
    }
    if([owner.view viewWithTag:10124])
    {
        return;
    }
    HUD = [[MBProgressHUD alloc] initWithView:owner.view];
    HUD.tag =10124;
    [owner.view addSubview:HUD];
//    currentViewController = owner;
    //设置对话框文字
    HUD.label.text = text;
    
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    HUD.yOffset = offset;
    //HUD.xOffset = 100.0f;
    
    [HUD showAnimated:YES];
};
+(void)openWindowProgressRound:(UIViewController *)owner andText:(NSString *)text andYOffset:(float)offset{
    //初始化进度框，置于当前的View当中
    if (HUD) {
        //        HUD.hidden = YES;
        [HUD removeFromSuperview];
        HUD =nil;
    }
    if([owner.view viewWithTag:10124])
    {
        return;
    }
    HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    HUD.tag =10124;
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    //    currentViewController = owner;
    //设置对话框文字
    HUD.labelText = text;
    
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    HUD.yOffset = offset;
    //HUD.xOffset = 100.0f;
    
    [HUD show:YES];
};

+ (void)closeProgressRound{
    [HUD removeFromSuperview];
    HUD = nil;
}



#pragma mark - 将某个时间转化成 时间戳

+(long)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd HH:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    return timeSp;
    
}

+(NSString *)timeFormatterSwitchTimesFormatter:(NSString *)formatTime OldFormatter:(NSString *)oldFormatter andReturnFormatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:oldFormatter]; //(@"YYYY-MM-dd HH:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    
    NSDateFormatter *outformat = [[NSDateFormatter alloc]init];
    [outformat setDateFormat:format];
    NSString *outputTime = [outformat stringFromDate:date];
    if (outputTime == nil) {
        outputTime = @"";
    }
    return outputTime;
}




//josn字符串->dic
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

+(NSString *) utf8ToUnicode:(NSString *)string{
    
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++){
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='a' && _char <= 'z'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else if(_char >='A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        }else{
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
    }
    return s;
}

+ (NSString *)getSignLocalTimeStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    timestamp = timestamp / 1000;
    NSDate *date = [NSDate date];
    NSString *timeStr = [formatter stringFromDate:date];
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null],@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",nil];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit =NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    NSString *weekStr = [weekdays objectAtIndex:theComponents.weekday];
    return [NSString stringWithFormat:@"%@ %@",timeStr,weekStr];
}

+ (void)openCallOnView:(UIView *)view withNumber:(NSString *)number {
    UIWebView *callWebview =[[UIWebView alloc] init];
    NSString *telStr = [@"tel://" stringByAppendingString:number];
    NSURL *telURL =[NSURL URLWithString:telStr];// 貌似tel:// 或者 tel: 都行
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [view addSubview:callWebview];
}


@end
