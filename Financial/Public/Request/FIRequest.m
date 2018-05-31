//
//  FIRequest.m
//  Financial
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import "FIRequest.h"
#import "AFNetworking.h"

@implementation FIRequest

+ (instancetype)share
{
    
    static FIRequest *single = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        single = [[FIRequest alloc] init];
        
    });
    
    return single;
}

+ (AFHTTPSessionManager*)defaultNetManager
{
    static AFHTTPSessionManager *manager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[AFHTTPSessionManager alloc] init];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        /** 设置请求超时秒数*/
        manager.requestSerializer.timeoutInterval = 8;
        
    });
    
    return manager;
}

- (void)reqestWithUrl:(NSString *)url param:(NSDictionary *)param success:(Success)success andFailre:(Failure)failure
{
    AFHTTPSessionManager *manager = [FIRequest defaultNetManager];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:param];
    
    //dict setObject:<#(nonnull id)#> forKey:<#(nonnull id<NSCopying>)#>
    
    [manager POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        id reslut = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        success(reslut);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}


@end
