//
//  TMDBNetworkingCore.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define tmdbNetworking [TMDBNetworkingCore sharedInstance]

typedef void(^TMDBNetworkingCoreResponseCallback)(NSError *error, id responseObject);

/*
 
 */
@interface TMDBNetworkingCore : NSObject

@property (nonatomic, readonly) NSString *domain;

+ (instancetype)sharedInstance;

- (void)performGET:(NSString*)route params:(NSDictionary*)params class:(Class)resultClass response:(TMDBNetworkingCoreResponseCallback)callback;

@end
