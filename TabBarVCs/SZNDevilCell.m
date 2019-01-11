//
//  SZNDevilCell.m
//  AngelFishDevil
//
//  Created by Tim (Xinyin) Liu on 2019/1/8.
//  Copyright © 2019 TimLiu. All rights reserved.
//

#import "SZNDevilCell.h"
#import "SZNRoleModel.h"
@interface SZNDevilCell ()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@end
@implementation SZNDevilCell
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
    dateLabel.textAlignment = NSTextAlignmentRight;
    self.dateLabel = dateLabel;
    
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.height.equalTo(@30);
    }];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(headImageView.mas_left).offset(-10);
    }];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headImageView.mas_left).offset(-10);
        make.top.equalTo(contentLabel.mas_bottom).offset(30);
        make.height.equalTo(@20);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    [self setSwipeButtons];
}
- (void)setSwipeButtons {
    MGSwipeButton *addButton = [MGSwipeButton buttonWithTitle:@"追加" backgroundColor:[UIColor whiteColor] callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"点击追加");
        self.swipeButtonClick();
        return YES;
        
    }];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rightButtons = @[addButton];
}
- (void)setModel:(SZNRoleModel *)model {
    _model = model;
    self.headImageView.image = [UIImage imageNamed:@"selectedIcon"];
    self.contentLabel.text = model.content;
    self.dateLabel.text = model.dateStr;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
