//
//  JFFriendGroup.m

////  http://www.jianshu.com/p/f7b93c5b5176
//  https://github.com/tubie/JFFreindList/commits/master

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
