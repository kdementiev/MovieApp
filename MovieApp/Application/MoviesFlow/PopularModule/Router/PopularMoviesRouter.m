//
//  PopularMoviesRouter.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesRouter.h"

#import <UIKit/UIKit.h>

#import "UIStoryboard+MoviesFlow.h"
#import "UIViewController+Segues.h"

#import "MovieDetailsModuleConfigurator.h"


@interface PopularMoviesRouter ()

// Use UIViewController to perform routing using segues or in another way
@property (nonatomic, weak) UIViewController *viewController;

@end


@implementation PopularMoviesRouter

- (instancetype)initWithViewController:(UIViewController *)viewController {
    
    self = [self init];
    if (!self) return nil;
    
    NSAssert([viewController isKindOfClass:[UITableViewController class]], @"Invalid object instance passed. UITableViewController needed.");
    _viewController = viewController;
    
    return self;
}

- (void)navigateToDetailsScreenWithItem:(MovieInfo *)movieInfo {
    
    UIViewControllerSeguesPrepareCallback callback = ^(UIViewController *target) {
        UIViewController<MovieDetailsViewInterface> *view = (UIViewController<MovieDetailsViewInterface> *)target;
        [MovieDetailsModuleConfigurator configurateModuleWithViewController:view movieInfo:movieInfo];
    };
    
    [_viewController performSegueWithIdentifier:[UIStoryboard popularMoviesToMovieDetailsSegueIdentifier]
                                prepareCallback:callback];
}

- (void)presentNoDataErrorMessage {
    
}

@end














