//
//  SZNRoleModel.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/4.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, SZNRoleModelType) {
    SZNRoleModelTypeAngel = 0,
    SZNRoleModelTypeFish,
    SZNRoleModelTypeDevil
};

@interface SZNRoleModel : NSObject
@property (nonatomic, assign) SZNRoleModelType roleType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *dateStr;
@end


