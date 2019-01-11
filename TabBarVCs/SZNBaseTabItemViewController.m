//
//  SZNBaseTabItemViewController.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNBaseTabItemViewController.h"
#define KSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
static const CGFloat topSpace = 100.0f;
static const CGFloat bottomSpace = 80.0f;
static const CGFloat leftOrRightSpace = 20.0f;
@interface SZNBaseTabItemViewController ()

@end

@implementation SZNBaseTabItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@" + " forState:UIControlStateNormal];
    button.layer.cornerRadius = 20;
    button.clipsToBounds = YES;
    [self.view addSubview:button];
    self.editButton = button;
    
    //添加手势
    UIPanGestureRecognizer *panRcognize = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [panRcognize setMinimumNumberOfTouches:1];
    [panRcognize delaysTouchesEnded];
    [panRcognize cancelsTouchesInView];
    [button addGestureRecognizer:panRcognize];
    [button addTarget:self action:@selector(addContent:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-30);
        make.bottom.equalTo(self.view).offset(-120);
        make.width.height.equalTo(@40);
    }];
}
- (void)addContent:(id)sender {
    NSLog(@"写r内容。。。。。");
}
- (void)handlePanGesture:(UIPanGestureRecognizer *)recognizer {
    //移动状态
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
         case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [recognizer translationInView:self.view];
            recognizer.view.center = CGPointMake(recognizer.view.center.x+translation.x, recognizer.view.center.y+translation.y);
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGPoint stopPoint = CGPointMake(0, KSCREEN_HEIGHT/2.0);
            if (recognizer.view.center.x < KSCREEN_WIDTH/2.0) {
                if (recognizer.view.center.y < topSpace + self.editButton.frame.size.height/2.0 ) {
                    // 在导航栏后面
                    stopPoint = CGPointMake(leftOrRightSpace+self.editButton.frame.size.width/2.0, topSpace + self.editButton.frame.size.width/2.0);
                }else if (recognizer.view.center.y > KSCREEN_HEIGHT - bottomSpace - self.editButton.frame.size.height){
                    // 在tabBar后面
                     stopPoint = CGPointMake(leftOrRightSpace+self.editButton.frame.size.width/2.0, KSCREEN_HEIGHT - bottomSpace - self.editButton.frame.size.height);
                }else {
                    stopPoint = CGPointMake(leftOrRightSpace+self.editButton.frame.size.width/2.0, recognizer.view.center.y);
                }
            }else{
                if (recognizer.view.center.y < topSpace + self.editButton.frame.size.height/2.0 ) {
                    // 在导航栏后面
                    stopPoint = CGPointMake(KSCREEN_WIDTH-leftOrRightSpace-self.editButton.frame.size.width/2.0, topSpace + self.editButton.frame.size.width/2.0);
                }else if (recognizer.view.center.y > KSCREEN_HEIGHT - bottomSpace - self.editButton.frame.size.height/2.0){
                    // 在tabBar后面
                    stopPoint = CGPointMake(KSCREEN_WIDTH-leftOrRightSpace-self.editButton.frame.size.width/2.0, KSCREEN_HEIGHT - bottomSpace - self.editButton.frame.size.height);
                }else {
                    stopPoint = CGPointMake(KSCREEN_WIDTH-leftOrRightSpace-self.editButton.frame.size.width/2.0, recognizer.view.center.y);
                }
            }

            [UIView animateWithDuration:0.5 animations:^{
                recognizer.view.center = stopPoint;
            }];
        }
            break;
        default:
            break;
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
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
    
