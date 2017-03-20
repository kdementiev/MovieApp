//
//  MATestCase.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MATestCase.h"

#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>

NSTimeInterval const MATestCaseExpectationsTimeout = 3.0;


@implementation MATestCase

- (void)setUp {
    [super setUp];
    
    self.defaultDomain = @"";
}

- (void)simulateSuccessResponseWithJSON:(NSString*)jsonName {
    [self simulateResponseWithJSON:jsonName route:nil status:200];
}

- (void)simulateResponseWithJSON:(NSString *)jsonName route:(NSString *)route status:(NSUInteger)status {
    
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        
        return [request.URL.absoluteString containsString:self.defaultDomain];
        
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
  
        NSString* fixture = OHPathForFile(jsonName, self.class);
        
        return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                statusCode:(int)status
                                                   headers:@{@"Content-Type":@"application/json"}];
    }];
    
}

- (void)waitForExpectations {
    [self waitForExpectationsWithTimeout:MATestCaseExpectationsTimeout
                                 handler:nil];
}

@end
