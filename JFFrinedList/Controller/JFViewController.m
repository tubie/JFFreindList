
//

#import "JFViewController.h"
#import "JFFriendGroup.h"
#import "JFFriend.h"
#import "JFHeaderView.h"
#import "JFFriendCell.h"
@interface JFViewController ()<JFHeaderViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSArray *groups;
@property (nonatomic, strong)UITableView *tableView;


@end

@implementation JFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    //每一行cell的高度
    self.tableView.rowHeight = 50;
    //每一组头部控键的高度
    self.tableView.sectionHeaderHeight = 44;
    
    self.tableView.tableFooterView = [UIView new];
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return  _tableView;
}

/**
 *  隐藏状态栏
 */
-(BOOL)prefersStatusBarHidden{
    return YES;
}

/**
 *   懒加载
 *
 *  @return 返回一个模型数组
 *   注：建议返回NSArray安全行高一点
 */
-(NSArray *)groups{
    if (_groups == nil) {
        NSArray *dictArray  = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"friends.plist" ofType:nil]];
        
        NSMutableArray *groupArray = [NSMutableArray array];
        for (NSDictionary *dict  in dictArray) {
            JFFriendGroup *group =  [JFFriendGroup groupWithDict:dict];
            [groupArray addObject:group];
        }
        _groups = groupArray;
    }
    return _groups;
}
#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    JFFriendGroup *group = self.groups[section];
    return (group.isOpened ?group.friends.count : 0);
    //    return group.friends.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1创建cell
    JFFriendCell *cell =  [JFFriendCell cellWithTableView:tableView];
    //2.设置cell 的数据
    JFFriendGroup *group = self.groups[indexPath.section];
    cell.friendData = group.friends [indexPath.row];
    return cell;
}
/**
 *  返回每一组需要显示的头部标题(字符出纳)
 */
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    JFFriendGroup *group = self.groups[section];
//    return group.name;
//
//}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //1.创建头部控件
    JFHeaderView *headerView =  [JFHeaderView headerViewWithTableView:tableView];
    headerView.delegate = self;
    //2.给headerView设置数据（给header传递模型）
    headerView.group = self.groups[section];
    return headerView;
}


/**
 *  点击headView从新刷新表格
 *
 */
-(void)headerViewDidClick:(JFHeaderView*)view{
    [self.tableView reloadData];
}





@end
