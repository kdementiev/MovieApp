//
//  MovieDetailsRouter.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieDetailsRouter.h"

#import <UIKit/UIKit.h>


@interface MovieDetailsRouter ()

// Use UIViewController to perform routing using segues or in another way
@property (nonatomic, weak) UIViewController *viewController;

@end


@implementation MovieDetailsRouter

- (instancetype)initWithViewController:(UIViewController *)viewController {
    
    self = [self init];
    if (!self) return nil;
    
    NSAssert([viewController isKindOfClass:[UIViewController class]], @"Invalid object instance passed. UIViewController needed.");
    _viewController = viewController;
    
    return self;
}

@end
