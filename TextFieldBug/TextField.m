//
//  TextField.m
//  TextFieldBug
//
//  Created by Christian Schnorr on 6/6/15.
//  Copyright (c) 2015 Diogo. All rights reserved.
//

#import "TextField.h"

@implementation TextField

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    if (UIDevice.currentDevice.systemVersion.integerValue != 8) return [self textRectForBounds:bounds];

    CGFloat const scale = UIScreen.mainScreen.scale;
    CGFloat const preferred = self.attributedText.size.height;
    CGFloat const delta = ceil(preferred) - preferred;
    CGFloat const adjustment = MIN(1, floor(delta * scale)) / scale;

    CGRect const textRect = [self textRectForBounds:bounds];
    CGRect const editingRect = CGRectOffset(textRect, 0.0, adjustment);

    return editingRect;
}

@end
