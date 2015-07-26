//
//  AppDelegate.m
//  15. BitWise
//
//  Created by Admin on 26.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "NVStudent.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Uchenik
    NSMutableArray* arrayOfStudents=[NSMutableArray new];
    for (NSInteger i=0; i<10; i++) {
        NVStudent *student=[[NVStudent alloc]init];
        for (NSInteger j=0; j<5; j++) {
            if (arc4random_uniform(2)) {
                student.subject=student.subject | 1<<j;
            }
        }
        [arrayOfStudents addObject:student];
        
    }
    NSLog(@"%@",arrayOfStudents);
    
    //-------
    //end of Uchenik
    
    //Student
    NSMutableArray *arrayOfTechmen=[[NSMutableArray alloc]init];
    NSMutableArray *arrayOfPhilosof=[[NSMutableArray alloc]init];
    NSInteger numberOfDevStudents=0;
    for (NVStudent *stud in arrayOfStudents){
        NSInteger tech=(NVStudentSubjectMath | NVStudentSubjectPhysics |
                        NVStudentSubjectDev);
       // NSLog(@"tech if stud has %ld",tech);
        if (stud.subject== tech) {
            [arrayOfTechmen addObject:stud];
            //NSLog(@"student is techman");
        } else {
            [arrayOfPhilosof addObject:stud];
            //NSLog(@"student is philosoph");
        }
        if (stud.subject & NVStudentSubjectDev) {
            numberOfDevStudents++;
        }
    }
    NSLog(@"numberOfDevStudents = %ld",numberOfDevStudents);
    //-------
    //end of Student
    
    //Master
    for (NVStudent *stud in arrayOfStudents){
        //NSLog(@"before biology is = %ld",stud.subject & NVStudentSubjectBiology);
        if (stud.subject & NVStudentSubjectBiology) {
            stud.subject=stud.subject & ~NVStudentSubjectBiology;
            NSLog(@"subject is cancelled");
        }
    
        
    }
    //-------
    //end of Master
    
    //Superman
    NSInteger randomNumber=arc4random_uniform(sizeof(int)*8+1);
    NSMutableString *binaryRepresentation=[[NSMutableString alloc]init];
    for (NSInteger i=0; i<sizeof(int)*8; i++) {
        NSString * bit=randomNumber & (1<<i) ? @"1":@"0";
        [binaryRepresentation insertString:bit atIndex:0];
    }
    NSLog(@"binary of int = %@, number is %ld",binaryRepresentation,randomNumber);
    //---------
    //end of Superman
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
