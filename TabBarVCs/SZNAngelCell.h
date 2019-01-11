//
//  SZNAngelCell.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/4.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "MGSwipeTableCell.h"
typedef void(^SwipeButtonBlock)(BOOL isAngelSay);

@class SZNRoleModel;

@interface SZNAngelCell : MGSwipeTableCell
@property (nonatomic, copy) SwipeButtonBlock swipeButtonClick;
@property (nonatomic, strong) SZNRoleModel *model;
@end


