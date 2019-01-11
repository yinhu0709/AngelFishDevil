//
//  SZNCommentCell.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/11.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNCommentCell.h"
#import "SZNCommentModel.h"
@interface SZNCommentCell ()
@property(nonatomic, strong)UILabel *timeLabel;
@property(nonatomic, strong)UILabel *infoLabel;
@property(nonatomic, strong)UIImageView *headImageView;
@end
@implementation SZNCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return  self;
}
- (void)commonInit {
    UILabel *timeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.textColor = [UIColor lightTextColor];
    
    UIImageView *headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:headImageView];
    self.headImageView = headImageView;
    
    UILabel *infoLabel = [[UILabel alloc]init];
    [self.contentView addSubview:infoLabel];
    self.infoLabel = infoLabel;
    infoLabel.numberOfLines = 0;
    infoLabel.backgroundColor = [UIColor cyanColor];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@200);
        make.height.equalTo(@20);
    }];
}
-(void)setCommentModel:(SZNCommentModel *)commentModel {
    _commentModel = commentModel;
    self.timeLabel.text = commentModel.commentTime;
    self.infoLabel.text = commentModel.commentContent;
    CGFloat width =[self receiveTextWidthWithString:commentModel.commentContent];
    NSNumber *widthNum = [NSNumber numberWithFloat:width];
    if (commentModel.commentType == SZNCommentModelTypeAngel) {
        self.headImageView.image = [UIImage imageNamed:@"selectedIcon"];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.left.equalTo(self.contentView).offset(10);
            make.width.height.equalTo(@30);
        }];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView);
            make.left.equalTo(self.headImageView.mas_right).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.width.equalTo(widthNum);
        }];
    }else if (commentModel.commentType == SZNRoleModelTypeDevil){
        self.headImageView.image = [UIImage imageNamed:@"selectedIcon"];
        [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.width.height.equalTo(@30);
        }];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView);
            make.right.equalTo(self.headImageView.mas_left).offset(-10);
            make.width.equalTo(widthNum);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
    }

}
- (CGFloat)receiveTextWidthWithString:(NSString *)str {
    CGSize maxWidth = CGSizeMake(MAXFLOAT, 20);
    NSDictionary *dic =@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGRect rect = [str boundingRectWithSize:maxWidth options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
  return  rect.size.width;
}
@end
