//
//  MATestCase.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <XCTest/XCTest.h>


@interface MATestCase : XCTestCase

@property (nonatomic) NSString *defaultDomain;

- (void)simulateSuccessResponseWithJSON:(NSString *)jsonName;
- (void)simulateResponseWithJSON:(NSString *)jsonName route:(NSString *)route status:(NSUInteger)status;

- (void)waitForExpectations;

@end
