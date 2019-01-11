//
//  SZNRoleManager.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/9.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNRoleManager.h"
#import "SZNRoleModel.h"
#import "SZNCommentModel.h"
@interface SZNRoleManager ()
@property(nonatomic, strong)NSMutableArray *angelArray;
@property(nonatomic, strong)NSMutableArray *fishArray;
@property(nonatomic, strong)NSMutableArray *devilArray;
@end
@implementation SZNRoleManager
+ (instancetype)sharedInstance {
    static SZNRoleManager *shareObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareObj = [[SZNRoleManager alloc]init];
    });
    return shareObj;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.angelArray = [NSMutableArray array];
        self.fishArray = [NSMutableArray array];
        self.devilArray = [NSMutableArray array];
    }
    return self;
}
- (void)addANewRole:(SZNRoleModel *)role {
    switch (role.roleType) {
        case SZNRoleModelTypeAngel:
            [self.angelArray insertObject:role atIndex:0];
            break;
        case SZNRoleModelTypeFish:
            [self.fishArray insertObject:role atIndex:0];
            break;
         case SZNRoleModelTypeDevil:
            [self.fishArray insertObject:role atIndex:0];
            break;
    }
}
- (void)gaveRole:(SZNRoleModel *)role addANewComment:(SZNCommentModel *)comment {
    NSMutableArray *comments = [NSMutableArray arrayWithArray:role.commentArray];
    [comments addObject:comment];
    role.commentArray = comments;
}
- (NSArray *)getAllAngelRole {
    return [NSArray arrayWithArray:self.angelArray];
}
- (NSArray *)getAllFishRole {
    return [NSArray arrayWithArray:self.fishArray];
}
- (NSArray *)getAllDevilRole {
    return [NSArray arrayWithArray:self.devilArray];
}
- (NSArray *)getAllFishRoleWithType:(SZNRoleModelType)modelType {
    switch (modelType) {
        case SZNRoleModelTypeAngel:
           return  [self getAllAngelRole];
            break;
        case SZNRoleModelTypeFish:
          return   [self getAllFishRole];
            break;
         case SZNRoleModelTypeDevil:
           return  [self getAllDevilRole];
            break;
    }
}
@end
