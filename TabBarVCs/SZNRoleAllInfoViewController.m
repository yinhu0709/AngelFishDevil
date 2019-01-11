//
//  SZNRoleAllInfoViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/11.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNRoleAllInfoViewController.h"
#import "SZNCommentModel.h"
#import "SZNCommentCell.h"
@interface SZNRoleAllInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation SZNRoleAllInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray arrayWithArray:self.currentRole.commentArray];
    SZNCommentModel *firstComment = [[SZNCommentModel alloc]init];
    firstComment.commentTime = self.currentRole.dateStr;
    firstComment.commentType = (NSInteger)self.currentRole.roleType;
    firstComment.commentContent = self.currentRole.content;
    [self.dataArray insertObject:firstComment atIndex:0];
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 40;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView registerClass:[SZNCommentCell class] forCellReuseIdentifier:@"cell"];
    
    if (@available(iOS 11.0, *)) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }];
    }else{
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(20);
            make.left.equalTo(self.view);
            make.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        }];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SZNCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.commentModel = self.dataArray[indexPath.row];
    return cell;
}
@end
