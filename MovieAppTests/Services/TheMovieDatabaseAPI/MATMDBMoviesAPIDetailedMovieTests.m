//
//  MATMDBMoviesAPIDetailedMovieTests.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MATestCase.h"

#import "TMDBMoviesAPI.h"
#import "TMDBNetworkingCore.h"



@interface MATMDBMoviesAPIDetailedMovieTests : MATestCase

@end

@implementation MATMDBMoviesAPIDetailedMovieTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testPopularMoviesFetching {
    
    [self simulateSuccessResponseWithJSON:@"movie_get_details_200.json"];
    
    XCTestExpectation *routeExpectation = [self expectationWithDescription:@"Get detailes expectation."];
    
    [TMDBMoviesAPI fetchMovieByIdentifier:550 response:^(TMDBMovieEntity *movie) {
        
        [routeExpectation fulfill];
    }];
    
    [self waitForExpectations];
}


@end
