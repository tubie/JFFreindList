//
//  JFFriendCell.m
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import "JFFriendCell.h"
#import "JFFriend.h"

@implementation JFFriendCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identify = @"cell";
        JFFriendCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (cell == nil) {
            cell = [[JFFriendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
        }
    return cell;
    
}

-(void)setFriendData:(JFFriend *)friendData{
    _friendData = friendData;
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isvip ? [UIColor redColor]:[UIColor blackColor];
    self.detailTextLabel.text = friendData.intro;

    
}
@end
