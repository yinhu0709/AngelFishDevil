//
//  SZNDevilCell.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/8.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "MGSwipeTableCell.h"

@class SZNRoleModel;
typedef void(^SwipeButtonBlock)(void);
@interface SZNDevilCell : MGSwipeTableCell
@property (nonatomic,copy)SwipeButtonBlock swipeButtonClick;
@property (nonatomic,strong)SZNRoleModel *model;
@end


