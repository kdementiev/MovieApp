//
//  PopularMoviesInteractor.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesInteractor.h"

#import "NetworkingStatusService.h"
#import "TMDBMoviesAPI.h"
#import "MovieInfo+TMDBMovieEntity.h"


typedef enum : NSUInteger {
    PopularMoviesInteractorIdle = 0,
    PopularMoviesInteractorFetchingData,
} PopularMoviesInteractorStatus;


@interface PopularMoviesInteractor ()

@property (nonatomic) NSMutableArray<MovieInfo *> *moviesList;
@property (nonatomic) PopularMoviesInteractorStatus status;

@end


@implementation PopularMoviesInteractor

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self MA_subscribeForEvents];
    }
    
    return self;
}

- (void)MA_subscribeForEvents {
    
    __weak typeof(self) _self = self;
    [networkingStatusService subscribeForRefreshNetworkState:self event:^(BOOL networkAvailable) {
        if (networkAvailable) {
            
            // Try to get new content.
            [_self requestNewContent];
            
            // Notify with available connection.
            [_self.delegate onNetworkConnectionRestored];
        } else {
            
            // Notify with no connection.
            [_self.delegate onNetworkConnectionLost];
        }
    }];
}

- (void)requestNewContent {
    
    if (_status != PopularMoviesInteractorIdle) {
        return;
    }
    
    _status = PopularMoviesInteractorFetchingData;
    
    __weak typeof(self) _self = self;
    [TMDBMoviesAPI fetchPopularMovies:^(TMDBMoviesPage *moviesPage) {
        _self.status = PopularMoviesInteractorIdle;
        [_self MA_processAndNotifyWithMoviesFetched:moviesPage.results];
    }];
}

- (void)MA_processAndNotifyWithMoviesFetched:(NSArray<TMDBMovieEntity *> *)tmdbMovies {
    
    _moviesList = [NSMutableArray array];
    
    for (TMDBMovieEntity *tmdbMovie in tmdbMovies) {
        MovieInfo *movie = [[MovieInfo alloc] initWithMovieEntity:tmdbMovie];
        [_moviesList addObject:movie];
    }
    
    [self.delegate onNewContentReceived:[_moviesList copy]];
}

- (MovieInfo *)movieForIndex:(NSUInteger)index {
    
    // Helps avoid out-of-bounds and nil.
    if (_moviesList.count > index) {
        return [_moviesList objectAtIndex:index];
    }
    
    return nil;
}

@end
