//
//  MovieDetailsPresenter.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieDetailsPresenter.h"

#import "MovieDetailsInteractorInterface.h"
#import "MovieDetailsViewInterface.h"
#import "MovieDetailsRouterInterface.h"

@implementation MovieDetailsPresenter

@synthesize view;
@synthesize interactor;
@synthesize router;

#pragma mark - User Actions -

- (void)userWantsToSeeDetails {
    [self.interactor requestDetailedContent];
}

#pragma mark - Model Layer events -

- (void)onMovieDetailedDataAvailable:(MovieInfo *)movie {
    [self.view presentMovieContent:movie];
}

@end
