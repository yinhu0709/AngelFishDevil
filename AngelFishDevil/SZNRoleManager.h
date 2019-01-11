//
//  SZNRoleManager.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/9.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZNRoleModel.h"
@class SZNCommentModel;
@interface SZNRoleManager : NSObject
@property(nonatomic, strong)NSString *fishMemoryTime;
+ (instancetype)sharedInstance;
- (void)addANewRole:(SZNRoleModel *)role;
- (void)gaveRole:(SZNRoleModel*)role addANewComment:(SZNCommentModel *)comment;
- (NSArray *)getAllAngelRole;
- (NSArray *)getAllFishRole;
- (NSArray *)getAllDevilRole;
- (NSArray *)getAllFishRoleWithType:(SZNRoleModelType)modelType;
@end

