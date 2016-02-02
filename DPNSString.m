//
//  DPNSString.m
//  JCZJ
//
//  Created by sunny_ios on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DPNSString.h"

@implementation DPNSString
+(NSString *)getSubStringWithIndexnewString:(NSString *)newSubstring{
    
    NSString *newString = [[NSString alloc] init];
    newString = [newString substringFromIndex:3];

    return newString;
    
}


@end


@implementation NSString (floatString)

-(instancetype)gotFloatStringWithFloatNum:(NSInteger) num {

    
    NSString *baseString = self ;
     NSRange range = [baseString rangeOfString:@"."];
    return  [self substringToIndex:range.location+range.length+num] ;

}

-(BOOL)hasSpecialString {
    
//    NSRange urgentRange = [self rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @",.？、 ~￥#&<>《》()[]{}【】^@/￡¤|§¨「」『』￠￢￣~@#&*（）——+|《》$_€"]];
    NSRange urgentRange = [self rangeOfCharacterFromSet:[[NSCharacterSet characterSetWithCharactersInString:@"_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet]] ;
    
    return urgentRange.location != NSNotFound ;
}


@end