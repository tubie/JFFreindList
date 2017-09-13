//
//  JFFriendCell.m
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
