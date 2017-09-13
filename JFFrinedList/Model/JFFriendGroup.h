//
//  JFFriendGroup.h
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFFriendGroup : NSObject

/**
 *  组名
 */
@property (nonatomic, copy)NSString *name;

/**
 *  在线人数
 */
@property (nonatomic, assign)int online ;
/**
 *  用来存放好友的模型数组
 */
@property (nonatomic, strong)NSArray *friends;
/**
 *  标识这组是否需要展开，YES :展开，NO关闭
 */
@property (nonatomic, assign,getter=isOpened)BOOL opened;

+(instancetype)groupWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
