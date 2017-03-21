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
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_networkStatusWasChanged:)
                                                     name:AFNetworkingReachabilityDidChangeNotification
                                                   object:nil];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_applicationWillRise:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMapTable<id,NetworkingStatusServiceCallback> *)subscribers {
    if (!_subscribers) {
        _subscribers = [NSMapTable weakToStrongObjectsMapTable];
    }
    return _subscribers;
}

- (void)subscribeForRefreshNetworkStat:(id)subscriber event:(NetworkingStatusServiceCallback)callback {
    
    NSAssert(subscriber != nil, @"'subscriber' should be not nil");
    NSAssert(callback != nil, @"'callback' should be not nil");
    
    [self.subscribers setObject:callback forKey:subscriber];
}

#pragma mark - Notifications -

- (void)_networkStatusWasChanged:(NSNotification*)notification {
    if ([[notification.userInfo valueForKey:AFNetworkingReachabilityNotificationStatusItem] boolValue]) {
        [self _notifySubscribers];
    }
}

- (void)_applicationWillRise:(NSNotification*)notification {
    [self _notifySubscribers];
}

#pragma mark - Helpers -

- (void)_notifySubscribers {
    
    NSEnumerator<NetworkingStatusServiceCallback> *enumerator = [self.subscribers objectEnumerator];
    NetworkingStatusServiceCallback callback;

    while ( callback = [enumerator nextObject] ) {
        callback();
    }
}

@end








