//
//  JFHeaderView.m
//  JF好友列表
//
//  Created by 保修一站通 on 15/8/9.
//  Copyright (c) 2015年 JF. All rights reserved.
//

#import "JFHeaderView.h"
#import "JFFriendGroup.h"
#define WIDTH  (self.frame.size.width)
#define HEIGHT  (self.frame.size.height)


@interface JFHeaderView ()
@property(nonatomic, weak)UILabel *countView;
@property(nonatomic, weak)UIButton *nameView;

@end
@implementation JFHeaderView

+(instancetype)headerViewWithTableView:(UITableView * )tableView{
    static NSString *headId = @"headId";
    JFHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headId];
    if (headerView == nil) {
        headerView = [[JFHeaderView alloc]initWithReuseIdentifier:headId];
    }
    return headerView;

}


/**
 *  在这个初始化方法中,JFHeaderView的frame\bounds没有值
 */
-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加子控件
        //1.添加按钮
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //设置箭头
        [nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //内容左对齐
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //设置按钮的内边距
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        //2.添加好友数
        UILabel *countView = [[UILabel alloc]init];
        countView.textAlignment = NSTextAlignmentRight;
        countView.textColor = [UIColor grayColor];
        [self.contentView addSubview:countView];
        self.countView =  countView;
    }
    return  self;

}
/**
 *  当一个控件的frame发生改变时就会调用
 *  一般在这里布局内部的子控件（设置子控件的freme）
 */
-(void)layoutSubviews{
    
    //注：这个地方一定要调用父类的方法
    [super layoutSubviews];
    
    //1.设置按钮的freme
    self.nameView.frame = self.bounds;
    //2.设置好友数的frame
    CGFloat countY = 0;
    CGFloat countH =  HEIGHT;
    CGFloat countW = 150;
    CGFloat countX = WIDTH - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
    
    
}


-(void)setGroup:(JFFriendGroup *)group{
    _group = group;
    //1.设置组名
    [self.nameView setTitle:group.name forState:UIControlStateNormal];
    //2.设置好友数（在线数/总数）
    self.countView.text = [NSString stringWithFormat:@"%d/%lu",group.online,(unsigned long)group.friends.count];;
    
}


-(void)nameViewClick{
    //1.修改模型标记(状态取反)
    self.group.opened = !self.group.isOpened;
    if ([self.delegate respondsToSelector:@selector(headerViewDidClick:)]) {
        [self.delegate headerViewDidClick:self];
    }
    
}
/**
 *  但一个控件被添加到控件的时候会调用
 */
-(void)didMoveToSuperview{
    if (self.group.opened) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);

    }
}







@end
