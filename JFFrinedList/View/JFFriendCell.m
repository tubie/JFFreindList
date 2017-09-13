//
//  JFFriendCell.m
////  http://www.jianshu.com/p/f7b93c5b5176
//  https://github.com/tubie/JFFreindList/commits/master

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
