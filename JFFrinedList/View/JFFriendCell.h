//
//  JFFriendCell.h
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JFFriend;
@interface JFFriendCell : UITableViewCell

/**
 *  快速创建一个cell
 *  @return 返回一个jfFreendCell
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  给JFFriendCell提供一个JFFriend属性用来重写set方法给cell赋值,并且提供给控制器传递模型
 */
@property(nonatomic, strong)JFFriend *friendData;
@end
