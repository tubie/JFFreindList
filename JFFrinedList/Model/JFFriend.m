//
//  JFFriend.m
////  http://www.jianshu.com/p/f7b93c5b5176
//  https://github.com/tubie/JFFreindList/commits/master

#import "JFFriend.h"

@implementation JFFriend

+(instancetype)friendWithDict:(NSDictionary *)dict{
    
       return  [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
