//
//  AMPDynamicFontButton.m
//  AMPDynamicFont
//
//  Created by Álvaro Murillo del Puerto on 3/8/17.
//  Copyright © 2017 Alvaro Murillo. All rights reserved.
//

#import "AMPDynamicFontButton.h"
#import "UIFont+AMPDynamicFont.h"

@interface AMPDynamicFontButton ()

@property (nonatomic) CGFloat baseFontSize;
@property (nonatomic) UIFont *font;

@end

@implementation AMPDynamicFontButton

- (void)commonInit {
    
    [self updateFont];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangePreferredContentSize:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [self addObserver:self forKeyPath:@"titleLabel.font" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
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
    
    [self removeObserver:self forKeyPath:@"titleLabel.font"];
}

- (void)updateFont {
    
    BOOL shouldChange = NO;
    
    if (self.font != self.titleLabel.font) {
        
        self.baseFontSize = self.titleLabel.font.pointSize;
        
        shouldChange = YES;
        
    } else {
        
        CGFloat size = [UIFont adjustedSizeForBaseSize:self.baseFontSize];
        
        if (size != self.titleLabel.font.pointSize) {
            
            shouldChange = YES;
        }
    }
    
    if (shouldChange) {
        
        CGFloat size = [UIFont adjustedSizeForBaseSize:self.baseFontSize];
        self.font = [self.titleLabel.font fontWithSize:size];
        self.titleLabel.font = self.font;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (self.titleLabel.font != self.font) {
        [self updateFont];
    }
}

- (void)didChangePreferredContentSize:(NSNotification *)notification {
    
    [self updateFont];
}

@end
