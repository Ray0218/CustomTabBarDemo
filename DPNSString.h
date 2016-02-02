//
//  DPNSString.h
//  JCZJ
//
//  Created by sunny_ios on 16/1/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPNSString : NSObject

+(NSString *)getSubStringWithIndexnewString:(NSString *) newString;

@end


@interface NSString (floatString)
/**
 *  <#Description#>
 *
 *  @param num 小数点后几位
 *
 *  @return <#return value description#>
 */
-(instancetype)gotFloatStringWithFloatNum:(NSInteger) num ;

-(BOOL)hasSpecialString  ;


@end