//
//  UIFont+AMPDynamicFont.h
//  AMPDynamicFont
//
//  Created by Álvaro Murillo del Puerto on 3/8/17.
//  Copyright © 2017 Alvaro Murillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (AMPDynamicFont)

+ (CGFloat)adjustedSizeForBaseSize:(CGFloat)baseSize;

+ (CGFloat)sizeForContentSizeCategory:(UIContentSizeCategory)contentSize baseSize:(CGFloat)baseSize;

@end
