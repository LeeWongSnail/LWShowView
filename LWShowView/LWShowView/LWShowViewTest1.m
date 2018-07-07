//
//  LWShowViewTest1.m
//  LWShowView
//
//  Created by LeeWong on 2018/7/7.
//  Copyright © 2018年 LeeWong. All rights reserved.
//

#import "LWShowViewTest1.h"
#import <Masonry.h>

@interface LWShowViewTest1()
@property (nonatomic, strong) UIImageView *iconImage;

@end

@implementation LWShowViewTest1

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubview];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    }
    return self;
}

- (void)setUpSubview
{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@100);
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


#pragma mark - Lazy Load

- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc] init];
        [_iconImage setImage:[UIImage imageNamed:@"avatar1"]];
        [self addSubview:_iconImage];
    }
    return _iconImage;
}

@end
