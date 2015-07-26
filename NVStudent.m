//
//  NVStudent.m
//  15. BitWise
//
//  Created by Admin on 26.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVStudent.h"


@implementation NVStudent
-(NSString*) description {
    NSString* string=[NSString stringWithFormat:@"%ld",self.subject];
    return string;
}
@end
