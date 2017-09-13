//
//  JFFriend.h
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFFriend : NSObject
/**
 *  头像
 */
@property (nonatomic ,copy)NSString *icon;
/**
 *  个性签名
 */
@property (nonatomic ,copy)NSString *intro;
/**
 *  名字
 */
@property (nonatomic ,copy)NSString *name;
/**
 *  getter这样写的好处是控制get方法在需要的时候非常顺
 *  苹果官方建议这样写：规范
 */
@property (nonatomic , assign , getter=isvip) BOOL vip;

+(instancetype)friendWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
