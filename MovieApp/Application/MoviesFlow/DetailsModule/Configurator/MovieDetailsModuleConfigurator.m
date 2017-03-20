//
//  MovieDetailsModuleConfigurator.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieDetailsModuleConfigurator.h"

#import "MovieDetailsViewController.h"
#import "MovieDetailsInteractor.h"
#import "MovieDetailsPresenter.h"
#import "MovieDetailsRouter.h"

@implementation MovieDetailsModuleConfigurator

+ (void)configurateModuleWithViewController:(UIViewController<MovieDetailsViewInterface> *)view movieInfo:(MovieInfo *)movieInfo {
    
    id<MovieDetailsInteractorInterface> interactor = [[MovieDetailsInteractor alloc] initWithMovieInfo:movieInfo];
    id<MovieDetailsPresenterInterface> presenter = [MovieDetailsPresenter new];
    id<MovieDetailsRouterInterface> router = [[MovieDetailsRouter alloc] initWithViewController:view];
    
    // Prepare view
    view.delegate = presenter;
    
    // Prepare interactor.
    interactor.delegate = presenter;
    
    // Prepare presenter.
    presenter.router = router;
    presenter.interactor = interactor;
    presenter.view = view;

    // TODO: You can perform any setup for pattern components here (link with delegates, transfer date etc).
}

@end
