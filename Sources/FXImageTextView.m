//
//  FXImageTextView.m
//  GWCGlobalWeCircle
//
//  Created by 8-PC on 2020/6/15.
//  Copyright © 2020 QuantechCo.Limited. All rights reserved.
//

#import "FXImageTextView.h"

@implementation FXImageTextView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    return [super initWithCoder:coder];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame imagePosition:FXImageTextViewImagePositionLeft];
}

- (instancetype)initWithFrame:(CGRect)frame imagePosition:(FXImageTextViewImagePosition)imagePosition {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] init];
        self.label = [[UILabel alloc] init];

        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.translatesAutoresizingMaskIntoConstraints = NO;

        [self.label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [self.label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];

        [self addSubview:self.imageView];
        [self addSubview:self.label];

        _imagePosition = imagePosition;
        [self fx_update];
    }
    return self;
}

- (void)setImagePosition:(FXImageTextViewImagePosition)imagePosition {
    if (_imagePosition == imagePosition) return;
    _imagePosition = imagePosition;
    [self fx_update];
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    _imageEdgeInsets = imageEdgeInsets;
    [self fx_update];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    _titleEdgeInsets = titleEdgeInsets;
    [self fx_update];
}

- (void)fx_update {
    [self removeConstraints:self.constraints];
    switch (self.imagePosition) {
        case FXImageTextViewImagePositionLeft: {
            [self.imageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.imageEdgeInsets.left].active = YES;
            [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.imageEdgeInsets.top].active = YES;
            [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-self.imageEdgeInsets.bottom].active = YES;
            [self.imageView.rightAnchor constraintEqualToAnchor:self.label.leftAnchor constant:-(self.imageEdgeInsets.right + self.titleEdgeInsets.left)].active = YES;
            [self.label.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.titleEdgeInsets.right].active = YES;
            [self.label.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.titleEdgeInsets.top].active = YES;
            [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:self.titleEdgeInsets.bottom].active = YES;
            break;
        }

        case FXImageTextViewImagePositionRight: {
            [self.label.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.titleEdgeInsets.left].active = YES;
            [self.label.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.titleEdgeInsets.top].active = YES;
            [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-self.titleEdgeInsets.bottom].active = YES;
            [self.label.rightAnchor constraintEqualToAnchor:self.label.leftAnchor constant:-(self.titleEdgeInsets.right + self.imageEdgeInsets.left)].active = YES;
            [self.imageView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.imageEdgeInsets.right].active = YES;
            [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.imageEdgeInsets.top].active = YES;
            [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:self.imageEdgeInsets.bottom].active = YES;
            break;
        }

        case FXImageTextViewImagePositionTop: {
            [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.imageEdgeInsets.top].active = YES;
            [self.imageView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.imageEdgeInsets.right].active = YES;
            [self.imageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.imageEdgeInsets.left].active = YES;
            [self.imageView.bottomAnchor constraintEqualToAnchor:self.label.topAnchor constant:-(self.imageEdgeInsets.bottom + self.titleEdgeInsets.top)].active = YES;
            [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-self.titleEdgeInsets.bottom].active = YES;
            [self.label.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.titleEdgeInsets.right].active = YES;
            [self.label.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.titleEdgeInsets.left].active = YES;
            break;
        }

        case FXImageTextViewImagePositionBottom: {
            [self.label.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.titleEdgeInsets.top].active = YES;
            [self.label.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.titleEdgeInsets.right].active = YES;
            [self.label.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.titleEdgeInsets.left].active = YES;
            [self.label.bottomAnchor constraintEqualToAnchor:self.label.topAnchor constant:-(self.titleEdgeInsets.bottom + self.imageEdgeInsets.top)].active = YES;
            [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-self.imageEdgeInsets.bottom].active = YES;
            [self.imageView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-self.imageEdgeInsets.right].active = YES;
            [self.imageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:self.imageEdgeInsets.left].active = YES;
            break;
        }

        default:
            break;
    }
}

@end
