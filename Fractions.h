//
//  Fractions.h
//  Fractions
//
//  Created by Aaron Block on 10/13/13.
//
//

#import <Foundation/Foundation.h>

@interface Fractions : NSObject
@property (strong, nonatomic) NSNumber *numerator;
@property (strong, nonatomic) NSNumber *denominator;

+(Fractions *)add: (Fractions *)frstFraction and: (Fractions *)scndFraction;
+(Fractions *)subtract: (Fractions *)frstFraction by: (Fractions *)scndFraction;
- (Fractions *)set: (Fractions *)inputFraction;
+(NSNumber *)getLCMOf: (NSNumber *)frstNumber and: (NSNumber *)scndNumber;
+(Fractions *)newFractionWithNumerator: (NSNumber *)numerator andDenominator: (NSNumber *)denominator;
-(NSString *)fractionToString;
+(Fractions *)multiply:(Fractions *)frstFraction by:(Fractions *)scndFraction;
+(Fractions *)divide:(Fractions *)frstFraction by: (Fractions *)scndFraction;
+(NSNumber *)getGCFOf: (NSNumber *)frstNumber and: (NSNumber *)scndNumber;
-(Fractions *)simplify;
+(Fractions *)newFractionWithFloat:(float)floatNumber and:(float)otherFloatNumber;

@end
