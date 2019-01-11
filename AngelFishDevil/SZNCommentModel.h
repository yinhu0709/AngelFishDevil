//
//  SZNCommentModel.h
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/9.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, SZNCommentModelType) {
    SZNCommentModelTypeAngel = 0,
    SZNCommentModelTypeFish,
    SZNCommentModelTypeDevil
};

@interface SZNCommentModel : NSObject
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) SZNCommentModelType commentType;
@property (nonatomic, strong) NSString *commentTime;
@end


