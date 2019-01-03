//
//  NSString+transPinYin.h
//  jsyf_user
//
//  Created by pro on 2017/10/17.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (transPinYin)
+ (NSString *)transformPinYinWithString:(NSString *)chinese;
@end
