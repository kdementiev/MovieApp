//
//  PopularMoviesViewInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieInfo;

// Events from view
@protocol PopularMoviesViewDelegate <NSObject>

- (void)userWantsLatestContent;
- (void)userWantsDetailedInformationForItem:(NSUInteger)itemIndex;

@end

// Provides ability to controll view
@protocol PopularMoviesViewInterface <NSObject>

// Strong because we need to own output to support our structure.
@property (nonatomic, strong) id<PopularMoviesViewDelegate> delegate;

- (void)presentMovies:(NSArray<MovieInfo *> *)moviesList;
- (void)showOfflineCaption:(BOOL)show;

@end
