//
//  JFFriendGroup.m
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import "JFFriendGroup.h"
#import "JFFriend.h"

@implementation JFFriendGroup

+(instancetype)groupWithDict:(NSDictionary *)dict{
    
    return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        //1.注入所有属性
        [self setValuesForKeysWithDictionary:dict];
        
        //2.特殊处理friends属性
        NSMutableArray *frinedArray = [NSMutableArray array];
        for (NSDictionary *dict  in self.friends) {
             JFFriend *friend = [JFFriend friendWithDict:dict];
            [frinedArray addObject:friend];
        }
        self.friends = frinedArray;
    }
    return self;
}

@end
