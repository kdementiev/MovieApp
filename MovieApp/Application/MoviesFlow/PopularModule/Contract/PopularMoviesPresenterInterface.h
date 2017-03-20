//
//  PopularMoviesPresenterInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PopularMoviesViewInterface.h"
#import "PopularMoviesInteractorInterface.h"
#import "PopularMoviesRouterInterface.h"

/*
 */
@protocol PopularMoviesPresenterInterface <PopularMoviesViewDelegate, PopularMoviesInteractorDelegate>

// View owns presenter because of UIKit, accourding to this we use 'weak'.
@property (nonatomic, weak) id<PopularMoviesViewInterface> view;

// Contains bussiness logic.
@property (nonatomic) id<PopularMoviesInteractorInterface> interactor;

// Allows to perform routing between modules (Screens)
@property (nonatomic) id<PopularMoviesRouterInterface> router;

@end
