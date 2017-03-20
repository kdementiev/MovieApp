//
//  MovieTableViewCell.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieTableViewCell.h"


NSString * const MovieTableViewCellRateTextFormat = @"%0.1f";


NSInteger const MovieTableViewCellAnimationDuration = 0.5;

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    [UIView animateWithDuration:MovieTableViewCellAnimationDuration
                     animations:^{
                         self.contentView.alpha = highlighted ? 0.5 : 1.0;
                     }];
}

- (void)setRate:(float)rate {
    _rateLabel.text = [NSString stringWithFormat:MovieTableViewCellRateTextFormat, rate];
}

@end
