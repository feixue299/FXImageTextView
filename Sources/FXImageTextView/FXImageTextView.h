//
//  FXImageTextView.h
//  GWCGlobalWeCircle
//
//  Created by 8-PC on 2020/6/15.
//  Copyright © 2020 QuantechCo.Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSUInteger, FXImageTextViewImagePosition) {
    FXImageTextViewImagePositionTop,
    FXImageTextViewImagePositionLeft,
    FXImageTextViewImagePositionRight,
    FXImageTextViewImagePositionBottom
};

@interface FXImageTextView : UIView

@property (nonatomic, assign) FXImageTextViewImagePosition imagePosition;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic) UIEdgeInsets imageEdgeInsets;
@property (nonatomic) UIEdgeInsets titleEdgeInsets;

@property (nonatomic, strong) UITapGestureRecognizer *tap;

- (instancetype)initWithFrame:(CGRect)frame imagePosition:(FXImageTextViewImagePosition)imagePosition  NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
