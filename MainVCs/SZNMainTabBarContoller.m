//
//  SZNMainTabBarContoller.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/3.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNMainTabBarContoller.h"
#import "SZNAngelViewController.h"
#import "SZNFishViewController.h"
#import "SZNDevilViewController.h"
#import "SZNBaseNavViewController.h"
@interface SZNMainTabBarContoller ()

@end
@implementation SZNMainTabBarContoller
- (void)viewDidLoad {
    [super viewDidLoad];
    SZNAngelViewController *angelVC = [[SZNAngelViewController alloc]init];
    SZNBaseNavViewController *angelNav = [[SZNBaseNavViewController alloc]initWithRootViewController:angelVC];
    SZNFishViewController *fishVC = [[SZNFishViewController alloc]init];
    SZNBaseNavViewController *fishNav = [[SZNBaseNavViewController alloc]initWithRootViewController:fishVC];
    SZNDevilViewController *devilVC = [[SZNDevilViewController alloc]init];
    SZNBaseNavViewController *devilNav = [[SZNBaseNavViewController alloc]initWithRootViewController:devilVC];
    self.viewControllers = @[angelNav,fishNav,devilNav];
[self createTabBarItemsWithTitles:@[@"天使",@"鱼",@"恶魔"] withImage:nil withSelectImages:nil];
    
}
- (void)createTabBarItemsWithTitles:(NSArray *)titleArray withImage:(NSArray *)images withSelectImages:(NSArray *)selectImages {
    for (int i = 0; i<titleArray.count; i++) {
        UITabBarItem *item =  self.tabBar.items[i];
        item.title = titleArray[i];
        if (images) {
            item.image = [UIImage imageNamed:images[i]];
        }
        if (selectImages) {
            item.selectedImage = [UIImage imageNamed:selectImages[i]];
        }
       
    }
}
@end
