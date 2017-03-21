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


@interface PopularMoviesInteractor ()
@property (nonatomic) NSMutableArray<MovieInfo *> *moviesList;
@end


@implementation PopularMoviesInteractor

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof(self) _self = self;
        [networkingStatusService subscribeForRefreshNetworkStat:self event:^{
            [_self requestNewContent];
        }];
    }
    return self;
}

- (void)requestNewContent {
  
    __weak typeof(self) _self = self;
    [TMDBMoviesAPI fetchPopularMovies:^(TMDBMoviesPage *moviesPage) {
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
