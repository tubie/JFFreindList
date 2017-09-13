//
//  JFHeaderView.h
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFFriendGroup, JFHeaderView;

/**
 *  定义代理一般以控件名字家delegate,这是规范
 */
@protocol JFHeaderViewDelegate <NSObject>
@optional
-(void)headerViewDidClick:(JFHeaderView*)view;

@end

@interface JFHeaderView : UITableViewHeaderFooterView

+(instancetype)headerViewWithTableView:(UITableView * )tableView;

@property(nonatomic, strong)JFFriendGroup *group;
/**
 *  这里用id类型是返回任意类型,不依赖任何一个类
 *  也就是在任何一个类里面都可以使用
 */
@property (nonatomic, weak)id<JFHeaderViewDelegate>delegate;
@end
