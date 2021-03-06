//
//  SZNDevilViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNDevilViewController.h"
#import "SZNDevilCell.h"
#import "SZNRoleModel.h"
@interface SZNDevilViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;
@end

@implementation SZNDevilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"恶魔";
    SZNRoleModel *model = [[SZNRoleModel alloc]init];
    model.roleType = SZNRoleModelTypeAngel;
    model.content = @"今天又是周er了";
    model.dateStr = @"2019.1.8 14:58";
    SZNRoleModel *model1 = [[SZNRoleModel alloc]init];
    model1.roleType = SZNRoleModelTypeAngel;
    model1.content = @"今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了今天又是周五了";
    model1.dateStr = @"2019.1.8 15:58";
    self.dataArray = @[model,model1];
    UITableView *tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 30;
    tableView.tableFooterView = [UIView new];
    [tableView registerClass:[SZNDevilCell class] forCellReuseIdentifier:@"cell"];
    [self.view bringSubviewToFront:self.editButton];
    if (@available(iOS 11.0, *)){
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            make.left.right.equalTo(self.view);
        }];
    }else{
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        }];
        
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SZNDevilCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SZNRoleModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.swipeButtonClick = ^{
        NSLog(@"点击事件得到传递");
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
