//
//  TMDBMovieEntity.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "TMDBGenreEntity.h"


@protocol TMDBMovieEntity;


@interface TMDBMovieEntity : JSONModel

@property (nonatomic) NSInteger identifier;

@property (nonatomic) NSString *posterPath;
@property (nonatomic) NSString *backdropPath;

@property (nonatomic) NSString *overview;

@property (nonatomic) NSString *releaseDate;

@property (nonatomic) NSString *originalTitle;
@property (nonatomic) NSString *originalLanguage;

@property (nonatomic) NSInteger voteCount;
@property (nonatomic) float voteAverage;

@property (nonatomic) NSArray<TMDBGenreEntity> *genres;
@property (nonatomic) NSArray *genreIds;

@end

