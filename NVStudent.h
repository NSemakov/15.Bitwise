//
//  NVStudent.h
//  15. BitWise
//
//  Created by Admin on 26.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, NVStudentSubject){
    NVStudentSubjectMath        = 1<<0,
    NVStudentSubjectBiology     = 1<<1,
    NVStudentSubjectPhysics     = 1<<2,
    NVStudentSubjectPsycho      = 1<<3,
    NVStudentSubjectDev         = 1<<4
    
};
@interface NVStudent : NSObject
@property (assign,nonatomic) NVStudentSubject subject;
@end
