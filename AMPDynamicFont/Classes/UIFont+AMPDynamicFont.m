//
//  UIFont+AMPDynamicFont.m
//  AMPDynamicFont
//
//  Created by Álvaro Murillo del Puerto on 3/8/17.
//  Copyright © 2017 Alvaro Murillo. All rights reserved.
//

#import "UIFont+AMPDynamicFont.h"

@implementation UIFont (AMPDynamicFont)

+ (CGFloat)adjustedSizeForBaseSize:(CGFloat)baseSize {
    
    UIContentSizeCategory contentSize = [[UIApplication sharedApplication] preferredContentSizeCategory];
    
    return [self sizeForContentSizeCategory:contentSize baseSize:baseSize];
}

+ (CGFloat)sizeForContentSizeCategory:(UIContentSizeCategory)contentSize baseSize:(CGFloat)baseSize {
    
    CGFloat size = baseSize;
    
    if ([contentSize isEqualToString:UIContentSizeCategoryExtraSmall]) {
        size = [self sizeForExtraSmallCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategorySmall]) {
        size = [self sizeForSmallCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryMedium]) {
        size = [self sizeForMediumCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryLarge]) {
        size = baseSize;
    } else if ([contentSize isEqualToString:UIContentSizeCategoryExtraLarge]) {
        size = [self sizeForExtraLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryExtraExtraLarge]) {
        size = [self sizeForExtraExtraLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge]) {
        size = [self sizeForExtraExtraExtraLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryAccessibilityMedium]) {
        size = [self sizeForAccessibilityMediumCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryAccessibilityLarge]) {
        size = [self sizeForAccessibilityLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge]) {
        size = [self sizeForAccessibilityExtraLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge]) {
        size = [self sizeForAccessibilityExtraExtraLargeCategory:baseSize];
    } else if ([contentSize isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge]) {
        size = [self sizeForAccessibilityExtraExtraExtraLargeCategory:baseSize];
    } else {
        size = baseSize;
    }
    
    return size;
}

+ (CGFloat)sizeForExtraSmallCategory:(CGFloat)baseSize {
    
    if (baseSize <= 11) {
        return baseSize;
    } else if (baseSize <= 13) {
        return baseSize - 1;
    } else {
        return baseSize - 3;
    }
}

+ (CGFloat)sizeForSmallCategory:(CGFloat)baseSize {
    
    if (baseSize <= 11) {
        return baseSize;
    } else if (baseSize <= 13) {
        return baseSize - 1;
    } else {
        return baseSize - 2;
    }
}

+ (CGFloat)sizeForMediumCategory:(CGFloat)baseSize {
    
    if (baseSize <= 11) {
        return baseSize;
    } else {
        return baseSize - 1;
    }
}

+ (CGFloat)sizeForExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 2;
}

+ (CGFloat)sizeForExtraExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 4;
}

+ (CGFloat)sizeForExtraExtraExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 6;
}

+ (CGFloat)sizeForAccessibilityMediumCategory:(CGFloat)baseSize {
    
    return baseSize + 11;
}

+ (CGFloat)sizeForAccessibilityLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 16;
}

+ (CGFloat)sizeForAccessibilityExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 23;
}

+ (CGFloat)sizeForAccessibilityExtraExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 30;
}

+ (CGFloat)sizeForAccessibilityExtraExtraExtraLargeCategory:(CGFloat)baseSize {
    
    return baseSize + 36;
}

@end
