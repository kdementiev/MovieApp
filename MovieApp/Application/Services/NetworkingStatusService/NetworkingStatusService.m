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
@property (nonatomic, strong) NSMutableArray<NetworkingStatusServiceCallback> *subscribers;
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
        
        self.subscribers = [NSMutableArray new];
        
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

#pragma mark - -

- (void)_networkStatusWasChanged:(NSNotification*)notification {
    
    if ([[notification.userInfo valueForKey:AFNetworkingReachabilityNotificationStatusItem] boolValue]) {
        [self _notifySubscribers];
    }
}

- (void)_applicationWillRise:(NSNotification*)notification {
    [self _notifySubscribers];
}

#pragma mark - - 

- (void)_notifySubscribers {
    for (NetworkingStatusServiceCallback callback in _subscribers) {
        callback();
    }
}

#pragma mark - - 

- (void)subscribeForRefreshNetworkState:(NetworkingStatusServiceCallback)callback {
    [_subscribers addObject:callback];
}



@end
