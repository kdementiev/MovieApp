//
//  PopularMoviesPresenter.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesPresenter.h"

#import "PopularMoviesInteractorInterface.h"
#import "PopularMoviesViewInterface.h"
#import "PopularMoviesRouterInterface.h"

@implementation PopularMoviesPresenter

@synthesize view;
@synthesize interactor;
@synthesize router;

#pragma mark - User Actions -

- (void)userWantsLatestContent {
    // Try to get new content.
    [self.interactor requestNewContent];
}

- (void)userWantsDetailedInformationForItem:(NSUInteger)itemIndex {
    // TODO: Get from interactor and send to router.
    
    MovieInfo *movieInfo = [self.interactor movieForIndex:itemIndex];
    
    if (movieInfo) {
        [self.router navigateToDetailsScreenWithItem:movieInfo];
    } else {
        // TODO: Notify with nothing.
        [self.router presentNoDataErrorMessage];
    }
}

#pragma mark - Model Layer events -

- (void)onNewContentReceived:(NSArray<MovieInfo *> *)movies {
    [self.view presentMovies:movies];
}

- (void)onNetworkConnectionLost {
    [self.view showOfflineCaption:YES];
}

- (void)onNetworkConnectionRestored {
    [self.view showOfflineCaption:NO];
}

@end
