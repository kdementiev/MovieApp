//
//  TMDBNetworkingCore.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "TMDBNetworkingCore.h"

#import <AFNetworking/AFNetworking.h>
#import <JSONModel/JSONModel.h>

/*
    Info.plist keys.
 */
NSString * const TMDBInfoPlistKey = @"TheMovieDatabaseAuthSettings";
NSString * const TMDBInfoPlistAPISecretKey = @"APIKey";
NSString * const TMDBInfoPlistAPIDomainKey = @"APIDomain";

//
NSString * const TMDBLocalCachePath = @"tmdb_responses";

/*
    Cache properties.
 */
NSUInteger const TMDBResponsesCacheInMemorySize = 16 * 1024 * 1024;
NSUInteger const TMDBResponsesCacheOnDiskSize = 64 * 1024 * 1024;


@interface TMDBNetworkingCore ()

@property (nonatomic) AFHTTPSessionManager *sessionManager;
@property (nonatomic) NSMutableDictionary *requiredParams;

@end


@implementation TMDBNetworkingCore

+ (instancetype)sharedInstance {
    
    static TMDBNetworkingCore *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // Try to get API Key from Info.plist.
        NSDictionary *settingsDict = [[NSBundle mainBundle] objectForInfoDictionaryKey:TMDBInfoPlistKey];
        NSString *apiKey = [settingsDict objectForKey:TMDBInfoPlistAPISecretKey];
        NSString *apiDomain = [settingsDict objectForKey:TMDBInfoPlistAPIDomainKey];
    
        // Initialize with API key.
        instance = [[TMDBNetworkingCore alloc] initWithAPIKey:apiKey withDomain:apiDomain];
    });
    
    return instance;
}

/*
 */
- (instancetype)initWithAPIKey:(NSString *)apiKey withDomain:(NSString *)domain {
    
    self = [super init];
    if (self) {
        
        _domain = domain;
        
        NSAssert(apiKey != nil, @"API Key should be not nit. Please provide TMDB API Key in your Info.plist. Se more: https://developers.themoviedb.org/3/getting-started");
        self.requiredParams = [NSMutableDictionary dictionaryWithObject:apiKey forKey:@"api_key"];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // Prepare local cache.
        configuration.URLCache = [[NSURLCache alloc] initWithMemoryCapacity:TMDBResponsesCacheInMemorySize
                                                               diskCapacity:TMDBResponsesCacheOnDiskSize
                                                                   diskPath:TMDBLocalCachePath];
        
        NSURL *baseURL = [NSURL URLWithString:_domain];
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL
                                                       sessionConfiguration:configuration];
        

        // Prepare reachability.
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_networkStatusWasChanged:)
                                                     name:AFNetworkingReachabilityDidChangeNotification
                                                   object:nil];
        
        
        
        [self.sessionManager.reachabilityManager startMonitoring];
        [self _validateCachingPolicy];
        
    }
    return self;
}

- (void)_networkStatusWasChanged:(NSNotification*)notification {
    [self _validateCachingPolicy];
}

- (void)_validateCachingPolicy {
    NSLog(@"Reachable: %i", _sessionManager.reachabilityManager.reachable);
    _sessionManager.requestSerializer.cachePolicy = _sessionManager.reachabilityManager.reachable ? NSURLRequestUseProtocolCachePolicy : NSURLRequestReturnCacheDataDontLoad;
}

- (void)performGET:(NSString*)route params:(NSDictionary*)params class:(Class)resultClass response:(TMDBNetworkingCoreResponseCallback)callback {
    
    NSAssert([resultClass isSubclassOfClass: [JSONModel class]], @"Class should be subclass of JSONModel");
    
    NSMutableDictionary *requestParams = [_requiredParams mutableCopy];
    [requestParams addEntriesFromDictionary:params];
    
    [_sessionManager GET:route
              parameters:requestParams
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     NSError *error;
                     id responseInstance = [[resultClass alloc] initWithDictionary:responseObject error:&error];
                     callback(error, responseInstance);
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     callback(error, nil);
                 }];
    
}

@end







