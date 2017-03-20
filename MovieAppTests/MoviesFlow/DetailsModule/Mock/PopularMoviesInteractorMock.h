//
//  PopularMoviesInteractorMock.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PopularMoviesInteractorInterface.h"


@interface PopularMoviesInteractorMock : NSObject <PopularMoviesInteractorInterface>

@property (nonatomic) NSUInteger moviesCount;

@end
