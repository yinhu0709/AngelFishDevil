//
//  SZNEditContentViewController.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/9.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZNRoleModel.h"
#import "SZNCommentModel.h"
@interface SZNEditContentViewController : UIViewController
@property(nonatomic, assign)SZNRoleModelType roleType;
@property(nonatomic, assign)SZNCommentModelType commnetType;
@property(nonatomic, strong)SZNRoleModel *currentModel;
@property(nonatomic, assign)BOOL isCreateRole;
@end

