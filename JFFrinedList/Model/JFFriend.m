//
//  JFFriend.m
//

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
