//
//  LogManager.m
//  oxPush2-IOS
//
//  Created by Nazar Yavornytskyy on 2/12/16.
//  Copyright © 2016 Nazar Yavornytskyy. All rights reserved.
//

#import "LogManager.h"
#import "Constants.h"

@implementation LogManager

+ (instancetype) sharedInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)addLog:(NSString*)logs{
    NSString* log = [[NSUserDefaults standardUserDefaults] stringForKey:LOGS_KEY];
    if (log != nil){
        log = [log stringByAppendingString:[NSString stringWithFormat:@"\n %@|%@", [self dateFormat:[NSDate date]], logs]];
    } else {
        log = logs;
    }
    [[NSUserDefaults standardUserDefaults] setObject:log forKey:LOGS_KEY];
}

-(NSString*)getLogs{
    NSString* logs = [[NSUserDefaults standardUserDefaults] stringForKey:LOGS_KEY];
    
    return logs;
}

-(void)deleteAllLogs{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:LOGS_KEY];
}

-(NSString*)dateFormat:(NSDate*)date{

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM hh:mm:ss"];
    NSString* newDateStr = [formatter stringFromDate:date];
    
    return newDateStr;
}

@end
