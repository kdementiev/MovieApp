//
//  PopularMoviesInteractorMock.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "PopularMoviesInteractorMock.h"

#import "MovieInfo.h"


@implementation PopularMoviesInteractorMock

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moviesCount = 10;
    }
    return self;
}

- (void)requestNewContent {

    NSMutableArray<MovieInfo *> *moviesList = [NSMutableArray array];
    
    for (int i = 0; i < _moviesCount; i++) {
        [moviesList addObject:[self _standartMovieInfo]];
    }
    
    [self.delegate onNewContentReceived: moviesList];
}

- (MovieInfo *)movieForIndex:(NSUInteger)index {
    return [self _standartMovieInfo];
}

- (MovieInfo *)_standartMovieInfo {
    MovieInfo *info = [MovieInfo new];
    return info;
}

@end
