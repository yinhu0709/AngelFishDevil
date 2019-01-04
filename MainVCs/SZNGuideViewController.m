//
//  SZNGuideViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNGuideViewController.h"
#import "SZNMainTabBarContoller.h"
@interface SZNGuideViewController ()

@end

@implementation SZNGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    UIView *bgView = [[UIView alloc]init];
    [self.view addSubview:bgView];
    bgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2);
    
    NSArray *messageArray = [NSArray arrayWithObjects:@"在没人看见的地方",@"你愿意",@"记录不包装的情绪吗", nil];
    NSMutableArray *messageLabelArray = [NSMutableArray array];
    for (NSString *message in messageArray) {
        UILabel *messageLabel = [[UILabel alloc]init];
        [bgView addSubview:messageLabel];
        messageLabel.text = message;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.font = [UIFont boldSystemFontOfSize:20];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabelArray addObject:messageLabel];
    }
   
    
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    startButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:startButton];
    startButton.layer.cornerRadius = 25;
    startButton.clipsToBounds = YES;
    [startButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventAllEvents];
    [messageLabelArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:30 leadSpacing:100 tailSpacing:80];
    [messageLabelArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.width.equalTo(@300);
    }];
    
    [startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@100);
        make.height.equalTo(@50);
        make.bottom.equalTo(self.view).offset(-80);
    }];

}
- (void)start:(id)sender {
    SZNMainTabBarContoller *mainVC  = [[SZNMainTabBarContoller alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
    
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
