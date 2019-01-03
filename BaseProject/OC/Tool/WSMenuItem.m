//
//  WSMenuItem.m
//  WolfStreet
//
//  Created by Simon on 16/7/28.
//  Copyright © 2016年 WolfStreet. All rights reserved.
//

#import "WSMenuItem.h"

@interface WSMenuItem ()

@property (nonatomic, strong) UIView *dotView;

@end

@implementation WSMenuItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dotHidden = NO;
        _dotView = [[UIView alloc] init];
        _dotView.translatesAutoresizingMaskIntoConstraints = NO;
        _dotView.backgroundColor = [UIColor redColor];
        _dotView.layer.masksToBounds = YES;
        _dotView.layer.cornerRadius = 4.f;
        [self addSubview:_dotView];
        self.backgroundColor = [UIColor clearColor];
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_dotView(8)]-20-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_dotView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_dotView(8)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_dotView)]];
    
    [super updateConstraints];
}

#pragma mark - accessor methods
- (void)setDotHidden:(BOOL)dotHidden {
    _dotHidden = dotHidden;
    _dotView.hidden = dotHidden;
}


@end
