//
//  MATMDBMoviesAPITest.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MATestCase.h"

#import "TMDBMoviesAPI.h"
#import "TMDBNetworkingCore.h"


@interface MATMDBMoviesAPIFetchPopularTests : MATestCase

@end


@implementation MATMDBMoviesAPIFetchPopularTests

- (void)setUp {
    [super setUp];
    
    self.defaultDomain = tmdbNetworking.domain;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPopularMoviesFetching {
    
    [self simulateSuccessResponseWithJSON:@"movie_get_popular_200.json"];
    
    
    XCTestExpectation *routeExpectation = [self expectationWithDescription:@"Popular Movies expectation."];
    
    [TMDBMoviesAPI fetchPopularMovies:^(TMDBMoviesPage *moviesPage) {
        
        XCTAssertNotNil(moviesPage, @"Response object should not be nil");
        XCTAssertTrue([moviesPage isKindOfClass:[TMDBMoviesPage class]], @"Invalid response intance type");
        
        XCTAssertEqual(moviesPage.page, 1, @"'page' different from mock data.");
        XCTAssertEqual(moviesPage.totalPages, 2, @"'totalPages' different from mock data.");
        XCTAssertEqual(moviesPage.totalResults, 4, @"'totalResults' different from mock data.");
        
        XCTAssertNotNil(moviesPage.results, @"Result should be not nil");
        XCTAssertEqual(moviesPage.results.count, 2, @"Incorrect elements count in 'results'");
        
        TMDBMovieEntity *movie = [moviesPage.results firstObject];
        
        XCTAssertTrue([movie isKindOfClass: [TMDBMovieEntity class]], @"Invalid movie instance type");
        XCTAssertTrue([movie.originalTitle isEqualToString:@"Finding Dory"], @"Original title not equal.");
        XCTAssertEqual(movie.identifier, 127380, @"Invalid movie id.");
        
        XCTAssertEqual(movie.genreIds.count, 1, @"Invalid geners count.");
        
        [routeExpectation fulfill];
    }];
    
    
    [self waitForExpectations];
}

- (void)testPopularMoviesFor401 {
    
    [self simulateSuccessResponseWithJSON:@"movie_get_popular_401.json"];
    
    
    XCTestExpectation *routeExpectation = [self expectationWithDescription:@"Popular Movies expectation."];
    
    [TMDBMoviesAPI fetchPopularMovies:^(TMDBMoviesPage *moviesPage) {
        XCTAssertNil(moviesPage, @"Response object should be nil");
        [routeExpectation fulfill];
    }];
    
    
    [self waitForExpectations];
}

- (void)testPopularMoviesFor404 {
    
    [self simulateSuccessResponseWithJSON:@"movie_get_popular_404.json"];
    
    XCTestExpectation *routeExpectation = [self expectationWithDescription:@"Popular Movies expectation."];
    
    [TMDBMoviesAPI fetchPopularMovies:^(TMDBMoviesPage *moviesPage) {
        XCTAssertNil(moviesPage, @"Response object should be nil");
        [routeExpectation fulfill];
    }];
    
    
    [self waitForExpectations];
}


@end
