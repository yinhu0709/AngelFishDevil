//
//  SZNRoleDetailViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/10.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNRoleDetailViewController.h"
#import "SZNRoleModel.h"
#import "SZNRoleAllInfoViewController.h"
@interface SZNRoleDetailViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic, strong)NSArray *dataArray;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, assign)NSInteger currentInteger;
@end

@implementation SZNRoleDetailViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.dataArray = [[SZNRoleManager sharedInstance] getAllFishRoleWithType:self.currentModel.roleType];
    self.currentInteger = [self.dataArray indexOfObject:self.currentModel];
    
    

    UIPageViewController *pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    pageVC.dataSource = self;
    pageVC.delegate = self;
    pageVC.view.frame = self.view.frame;
    [self.view addSubview:pageVC.view];
    [self addChildViewController:pageVC];
    UIViewController *dataVC = [self detailViewControllerAtIndex:self.currentInteger];
    [pageVC setViewControllers:@[dataVC] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}
- (UIViewController *)detailViewControllerAtIndex:(NSInteger)integer{
     self.title = [NSString stringWithFormat:@"%ld/%ld",self.currentInteger+1,self.dataArray.count];
   SZNRoleAllInfoViewController *VC = [[SZNRoleAllInfoViewController alloc]init];
    VC.currentRole = self.dataArray[self.currentInteger];
    VC.view.backgroundColor = [UIColor colorWithRed:(random()%256)/255.0 green:(random()%256)/255.0 blue:(random()%256)/255.0 alpha:1];
    VC.view.tag = integer;
    return VC;
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (self.currentInteger >= self.dataArray.count-1) {
        return nil;
    }
    self.currentInteger++;
    return [self detailViewControllerAtIndex:self.currentInteger];
}
-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if (self.currentInteger == 0) {
        return nil;
    }
    self.currentInteger--;
    return [self detailViewControllerAtIndex:self.currentInteger];
}
-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    pageViewController.view.userInteractionEnabled = NO;
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed && finished) {
        pageViewController.view.userInteractionEnabled = YES;
        NSLog(@"---%ld--",pageViewController.view.tag);
    }
}
//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
//    NSLog(@"------%ld",self.dataArray.count);
//    return self.dataArray.count;
//}
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    NSLog(@"-00--0--%ld",pageViewController.view.tag);
//    return pageViewController.view.tag;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
