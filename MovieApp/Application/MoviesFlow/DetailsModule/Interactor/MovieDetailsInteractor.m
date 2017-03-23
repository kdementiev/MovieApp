//
//  MovieDetailsInteractor.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieDetailsInteractor.h"

#import "NetworkingStatusService.h"
#import "TMDBMoviesAPI.h"
#import "MovieInfo+TMDBMovieEntity.h"

@interface MovieDetailsInteractor ()
@property (nonatomic) MovieInfo *currentMovieInfo;
@end


@implementation MovieDetailsInteractor

@synthesize delegate;


- (instancetype)initWithMovieInfo:(MovieInfo *)movieInfo {
    
    self = [super init];
    if (self) {
        self.currentMovieInfo = movieInfo;
        
        [self MA_subscribeForEvents];
    }
    return self;
}

- (void)MA_subscribeForEvents {
    
    __weak typeof(self) _self = self;
    [networkingStatusService subscribeForRefreshNetworkState:self event:^(BOOL networkAvailable) {
        if (networkAvailable) {
            [_self MA_performFetwingFromNetwork];
        }
    }];
    
}

- (void)requestDetailedContent {
    
    [self.delegate onMovieDetailedDataAvailable:_currentMovieInfo];
    
    [self MA_performFetwingFromNetwork];
}

- (void)MA_performFetwingFromNetwork {
    __weak typeof(self) _self = self;
    [TMDBMoviesAPI fetchMovieByIdentifier:_currentMovieInfo.identifier
                                 response:^(TMDBMovieEntity *movie) {
                                     if (movie) {
                                         [_self MA_processAndNotyfyWithMovie:movie];
                                     }
                                 }];
}

- (void)MA_processAndNotyfyWithMovie:(TMDBMovieEntity *)movie {
    
    _currentMovieInfo = [[MovieInfo alloc] initWithMovieEntity:movie];
    [self.delegate onMovieDetailedDataAvailable:_currentMovieInfo];
}

@end
