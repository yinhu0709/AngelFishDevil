//
//  SZNAngelCell.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/4.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNAngelCell.h"
#import "SZNRoleModel.h"
@interface SZNAngelCell ()
@property(nonatomic, strong)UIImageView *headImageView;
@property(nonatomic, strong)UILabel *contentLabel;
@property(nonatomic, strong)UILabel *dateLabel;
@property(nonatomic, strong)UILabel *lineLabel;
@property(nonatomic, strong)UILabel *commentLabel;
@end
@implementation SZNAngelCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIImageView *headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:headImageView];
    self.headImageView = headImageView;
    
    UILabel *contentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    contentLabel.numberOfLines = 0;
    
    UILabel *dateLabel = [[UILabel alloc]init];
    [self.contentView addSubview:dateLabel];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.font = [UIFont systemFontOfSize:14];
    self.dateLabel = dateLabel;
    
    UILabel *lineLabel = [[UILabel alloc]init];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineLabel];
    self.lineLabel = lineLabel;

    UILabel *commentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:commentLabel];
    commentLabel.textColor = [UIColor blueColor];
    commentLabel.font = [UIFont systemFontOfSize:14];
    self.commentLabel = commentLabel;
    
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.height.equalTo(@30);
    }];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headImageView.mas_centerY).offset(-8);
        make.left.equalTo(headImageView.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-30);
        make.top.equalTo(contentLabel.mas_bottom).offset(30);
        make.height.equalTo(@20);
//        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentLabel);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(5);
        make.height.equalTo(@0);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineLabel.mas_bottom).offset(5);
        make.left.right.equalTo(self.lineLabel);
        make.height.equalTo(@0);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    [self setSwipeButtons];
}
- (void)setSwipeButtons {
    MGSwipeButton *angelSayBtn = [MGSwipeButton buttonWithTitle:@"天使说" backgroundColor:[UIColor whiteColor]callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
        self.swipeButtonClick(YES);
        return YES;
    }];
    MGSwipeButton *DevilButton = [MGSwipeButton buttonWithTitle:@"恶魔说" backgroundColor:[UIColor whiteColor] callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"点击追加");
        self.swipeButtonClick(NO);
        return YES;
    }];
    
    [DevilButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [angelSayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.leftButtons = @[angelSayBtn];
    self.rightButtons = @[DevilButton];
}
- (void)setModel:(SZNRoleModel *)model {
    _model = model;
    self.headImageView.image = [UIImage imageNamed:@"selectedIcon"];
    self.contentLabel.text = model.content;
    self.dateLabel.text = model.dateStr;
    if (model.commentArray.count > 0) {
        self.commentLabel.text = [NSString stringWithFormat:@"更多%lu条评论",(unsigned long)model.commentArray.count];
        [self.lineLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@1);
        }];
        [self.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@20);
        }];
    }else{
        [self.lineLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
        [self.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0);
        }];
    }
}
@end
