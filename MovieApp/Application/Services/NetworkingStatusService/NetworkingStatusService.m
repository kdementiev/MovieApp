//
//  NetworkingStatusService.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "NetworkingStatusService.h"

#import <AFNetworking/AFNetworking.h>


@interface NetworkingStatusService ()

@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;
@property (nonatomic, strong) NSMapTable<id, NetworkingStatusServiceCallback> *subscribers;

@end


@implementation NetworkingStatusService

+ (instancetype)sharedInstance {
    
    static NetworkingStatusService *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [NetworkingStatusService new];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self MA_prepareReachability];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(MA_applicationWillRise:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)MA_prepareReachability {
    
    self.reachabilityManager = [AFNetworkReachabilityManager manager];
    [self.reachabilityManager startMonitoring];
    
    __weak typeof(self) _self = self;
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [_self MA_notifySubscribers];
    }];
}


- (NSMapTable<id,NetworkingStatusServiceCallback> *)subscribers {
    if (!_subscribers) {
        _subscribers = [NSMapTable weakToStrongObjectsMapTable];
    }
    return _subscribers;
}

- (void)subscribeForRefreshNetworkState:(id)subscriber event:(NetworkingStatusServiceCallback)callback {
    
    NSAssert(subscriber != nil, @"'subscriber' should be not nil");
    NSAssert(callback != nil, @"'callback' should be not nil");
    
    [self.subscribers setObject:callback forKey:subscriber];
}

#pragma mark - Notifications -


- (void)MA_applicationWillRise:(NSNotification*)notification {
    [self MA_notifySubscribers];
}

#pragma mark - Helpers -

- (void)MA_notifySubscribers {
    
    NSEnumerator<NetworkingStatusServiceCallback> *enumerator = [self.subscribers objectEnumerator];
    NetworkingStatusServiceCallback callback;
    
    BOOL networkAvailable = self.reachabilityManager.reachable;

    while ( callback = [enumerator nextObject] ) {
        callback(networkAvailable);
    }
}

@end








