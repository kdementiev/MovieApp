//
//  PopularMoviesModuleConfigurator.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesModuleConfigurator.h"

#import "PopularMoviesViewController.h"
#import "PopularMoviesInteractor.h"
#import "PopularMoviesPresenter.h"
#import "PopularMoviesRouter.h"

@implementation PopularMoviesModuleConfigurator

+ (void)configurateModuleWithViewController:(UIViewController<PopularMoviesViewInterface> *)view {
    
    id<PopularMoviesInteractorInterface> interactor = [PopularMoviesInteractor new];
    id<PopularMoviesPresenterInterface> presenter = [PopularMoviesPresenter new];
    id<PopularMoviesRouterInterface> router = [[PopularMoviesRouter alloc] initWithViewController:view];
    
    // Prepare view.
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
