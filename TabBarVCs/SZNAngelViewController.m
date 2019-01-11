//
//  SZNAngelViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNAngelViewController.h"
#import "SZNAngelCell.h"
#import "SZNRoleModel.h"
#import "SZNEditContentViewController.h"
#import "SZNRoleDetailViewController.h"
@interface SZNAngelViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;
@end

@implementation SZNAngelViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataArray = [[SZNRoleManager sharedInstance] getAllAngelRole];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"天使";
    UITableView *tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 30;
    tableView.tableFooterView = [UIView new];
    [tableView registerClass:[SZNAngelCell class] forCellReuseIdentifier:@"cell"];
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
    SZNAngelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SZNRoleModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.swipeButtonClick = ^(BOOL isAngelSay) {
         SZNEditContentViewController *editVC = [[SZNEditContentViewController alloc]init];
        if (isAngelSay) {
            editVC.commnetType = SZNRoleModelTypeAngel;
        }else{
            editVC.commnetType = SZNRoleModelTypeDevil;
        }
        editVC.isCreateRole = NO;
        editVC.currentModel = model;
        UINavigationController *bgNavVC = [[UINavigationController alloc]initWithRootViewController:editVC];
        [self presentViewController:bgNavVC animated:YES completion:nil];
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SZNRoleDetailViewController *detailVC = [[SZNRoleDetailViewController alloc]init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.currentModel = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)addContent:(id)sender {
    
    SZNEditContentViewController *editVC = [[SZNEditContentViewController alloc]init];
    editVC.roleType = SZNRoleModelTypeAngel;
    editVC.isCreateRole = YES;
    UINavigationController *bgNavVC = [[UINavigationController alloc]initWithRootViewController:editVC];
    [self presentViewController:bgNavVC animated:YES completion:nil];
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
