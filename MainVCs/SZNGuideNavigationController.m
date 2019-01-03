//
//  SZNGuideNavigationController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNGuideNavigationController.h"
#import "SZNGuideViewController.h"
@interface SZNGuideNavigationController ()

@end

@implementation SZNGuideNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SZNGuideViewController *guideVC = [[SZNGuideViewController alloc]init];
    self.viewControllers = [NSArray arrayWithObject:guideVC];
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
