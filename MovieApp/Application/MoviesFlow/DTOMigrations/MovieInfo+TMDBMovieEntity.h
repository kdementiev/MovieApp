//
//  MovieInfo+TMDBMovieEntity.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MovieInfo.h"

@class TMDBMovieEntity;


@interface MovieInfo (TMDBMovieEntity)

- (instancetype)initWithMovieEntity:(TMDBMovieEntity*)movieEntity;

@end
