//
//  MovieDetailsPresenterInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieDetailsViewInterface.h"
#import "MovieDetailsInteractorInterface.h"
#import "MovieDetailsRouterInterface.h"

/*
 */
@protocol MovieDetailsPresenterInterface <MovieDetailsViewDelegate, MovieDetailsInteractorDelegate>

// View owns presenter because of UIKit, accourding to this we use 'weak'.
@property (nonatomic, weak) id<MovieDetailsViewInterface> view;

// Contains bussiness logic.
@property (nonatomic) id<MovieDetailsInteractorInterface> interactor;

// Allows to perform routing between modules (Screens)
@property (nonatomic) id<MovieDetailsRouterInterface> router;

@end
