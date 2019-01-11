//
//  SZNEditContentViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/9.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNEditContentViewController.h"

@interface SZNEditContentViewController ()<UITextViewDelegate>
@property(nonatomic, strong)UITextView *textView;
@property(nonatomic, strong)UILabel *placeholderLabel;
@property(nonatomic, strong)UIBarButtonItem *publishBtnItem;
@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@end

@implementation SZNEditContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    cancelBtnItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItems = @[cancelBtnItem];
    UIBarButtonItem *publishBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(publishContent:)];
    publishBtnItem.enabled = NO;
    self.navigationItem.rightBarButtonItems = @[publishBtnItem];
    self.publishBtnItem = publishBtnItem;
    
    UITextView *textView = [[UITextView alloc]init];
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    self.textView = textView;
    textView.delegate = self;
    UILabel *placeholderLabel = [[UILabel alloc]init];
    placeholderLabel.textColor = [UIColor lightGrayColor];
    placeholderLabel.font = [UIFont systemFontOfSize:12];
    placeholderLabel.text = @"此刻想说...";
    [self.view addSubview:placeholderLabel];
    self.placeholderLabel = placeholderLabel;
    
    if (@available(iOS 11.0, *)){
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(10);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-10);
            make.height.equalTo(@80);
        }];
    }else{
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(10);
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@80);
        }];
    }
    [placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(textView);
        make.height.equalTo(@40);
    }];
}
- (void)viewDidAppear:(BOOL)animated {
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"YYYY.MM.dd HH:mm"];
}
- (void)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)publishContent:(id)sender {
    NSDate *currentDate = [NSDate date];
    if (self.isCreateRole) {
         SZNRoleModel *newRole = [[SZNRoleModel alloc]init];
        newRole.roleType = self.roleType;
        newRole.content = self.textView.text;
        newRole.dateStr = [self.dateFormatter stringFromDate:currentDate];
        [[SZNRoleManager sharedInstance] addANewRole:newRole];
    }else{
        if (self.currentModel) {
            SZNCommentModel *commentModel = [[SZNCommentModel alloc]init];
            commentModel.commentType = self.commnetType;
            commentModel.commentContent = self.textView.text;
            commentModel.commentTime = [self.dateFormatter stringFromDate:currentDate];
            [[SZNRoleManager sharedInstance] gaveRole:self.currentModel addANewComment:commentModel];
        }
    }
   
    NSLog(@"---%@--",self.textView.text);
     [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ------> textView delegate
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.placeholderLabel.hidden = YES;
        self.publishBtnItem.enabled = YES;
    }else{
        self.placeholderLabel.hidden = NO;
         self.publishBtnItem.enabled = NO;
    }
}

@end
