//
//  MovieInfo+TMDBMovieEntity.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieInfo+TMDBMovieEntity.h"

#import "TMDBMovieEntity.h"
#import "TMDBGenreEntity.h"


@implementation MovieInfo (TMDBMovieEntity)

- (instancetype)initWithMovieEntity:(TMDBMovieEntity*)movieEntity {
    
    self = [super init];
    if (!self) return nil;
    
    self.identifier = movieEntity.identifier;
    self.title = movieEntity.originalTitle;
    self.originalTitle = movieEntity.originalTitle;
    
    self.backgroundURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://image.tmdb.org/t/p/w300%@", movieEntity.backdropPath]];
    self.posterURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://image.tmdb.org/t/p/w780%@", movieEntity.posterPath]];
    
    self.overview = movieEntity.overview;
    self.rate = movieEntity.voteAverage;
    
    NSMutableArray<NSString *> *preparedGenres = [NSMutableArray new];
    [movieEntity.genres enumerateObjectsUsingBlock:^(TMDBGenreEntity *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [preparedGenres addObject:obj.name];
    }];
    
    self.genres = [preparedGenres copy];
    self.releaseDate = movieEntity.releaseDate;
    
    return self;
}

@end
