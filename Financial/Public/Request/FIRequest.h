//
//  FIRequest.h
//  Financial
//
//  Created by Mac on 2018/1/23.
//  Copyright © 2018年 MLBiMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success) (id response);
typedef void(^Failure) (NSError *error);

@interface FIRequest : NSObject

+ (instancetype)share;

- (void)reqestWithUrl:(NSString *)url param:(NSDictionary *)param success:(Success)success andFailre:(Failure)failure;

@end
