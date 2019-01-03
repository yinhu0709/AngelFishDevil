//
//  SZNGuideViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNGuideViewController.h"
@interface SZNGuideViewController ()

@end

@implementation SZNGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    startButton.backgroundColor = [UIColor blueColor];
    [self.view addSubview:startButton];
    [startButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventAllEvents];
    [startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];

}
- (void)start:(id)sender {

    
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
