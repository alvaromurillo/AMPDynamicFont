//
//  AMPDynamicFontTextView.m
//  AMPDynamicFont
//
//  Created by Álvaro Murillo del Puerto on 3/8/17.
//  Copyright © 2017 Alvaro Murillo. All rights reserved.
//

#import "AMPDynamicFontTextView.h"
#import "UIFont+AMPDynamicFont.h"

@interface AMPDynamicFontTextView ()

@property (nonatomic) CGFloat baseFontSize;

@end

@implementation AMPDynamicFontTextView

- (void)commonInit {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    self.baseFontSize = self.font.pointSize;
    
    CGFloat adjustedSize = [UIFont adjustedSizeForBaseSize:self.baseFontSize];
    
    if (adjustedSize != self.baseFontSize) {
        
        self.font = self.font;
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
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

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setFont:(UIFont *)font {
    
    if (font != self.font) {
        
        self.baseFontSize = font.pointSize;
    }
    
    CGFloat adjustedSize = [UIFont adjustedSizeForBaseSize:self.baseFontSize];
    
    if (font != self.font || adjustedSize != self.font.pointSize) {
        
        font = [font fontWithSize:adjustedSize];
        
        [super setFont:font];
    }
}

- (void)didChangePreferredContentSize:(NSNotification *)notification {
    
    self.font = self.font;
}

@end
