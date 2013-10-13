//
//  Fractions.m
//  Line
//
//  Created by Aaron Block on 10/13/13.
//  Copyright (c) 2013 Aaron Block. All rights reserved.
//

#import "Fractions.h"

@implementation Fractions

//Add two fractions
+(Fractions *)add:(Fractions *)frstFraction and:(Fractions *)scndFraction
{
    Fractions *fractionToReturn;
    if ([frstFraction.denominator isEqual:scndFraction.denominator])     //Check to see that denominators are equal to one another
    {
        float frstNumeratorFloat = frstFraction.numerator.floatValue;     //Get float of 1st fraction numerator
        float scndNumeratorFloat = scndFraction.numerator.floatValue;     //Get float of 2nd fraction numerator
        
        float fractionToReturnFloat = frstNumeratorFloat + scndNumeratorFloat;     //Add numerators of 1st and 2nd fractions
        NSNumber *fractionToReturnNumerator = [NSNumber numberWithFloat:fractionToReturnFloat];
        fractionToReturn = [Fractions newFractionWithNumerator:fractionToReturnNumerator andDenominator:frstFraction.denominator];
    }
    
    else
    {
        NSNumber *denomLCM = [Fractions getLCMOf: frstFraction.denominator and: scndFraction.denominator];     //Get lowest common multiple of the denominator of two input fractions.
        float denomLCMFloat = denomLCM.floatValue;
        float denomFrstFrac = frstFraction.denominator.floatValue;
        float denomScndFrac = scndFraction.denominator.floatValue;
        float multiplier = denomLCMFloat / denomFrstFrac;     //Number to multiply first fraction numerator by.
        
        //Convert fraction numerators to floats from NSNumber.
        float frstNumeratorFloat = frstFraction.numerator.floatValue;
        float scndNumeratorFloat = scndFraction.numerator.floatValue;
        
        float frstNumeratorRev = frstNumeratorFloat * multiplier;    //Multiply first fraction numerator by multiplier variable.
        multiplier = denomLCMFloat / denomScndFrac;     //Redefine multiplier variable for second fraction.
        float secondNumeratorRev = scndNumeratorFloat * multiplier;     //Multiply second fraction numerator by multiplier variable.

        float numeratorFinalFloat = secondNumeratorRev + frstNumeratorRev; //Add numerators after both being multiplied.
        
        NSNumber *numeratorFinal = [NSNumber numberWithFloat:numeratorFinalFloat];             //Convert numerator from float to NSNumber

        fractionToReturn = [Fractions newFractionWithNumerator:numeratorFinal andDenominator:denomLCM];     //Set the returning fraction to the sum of the two input fractions
    
    }
    return fractionToReturn;
}

//Subtract two fractions
+(Fractions *)subtract:(Fractions *)frstFraction by:(Fractions *)scndFraction
{
    Fractions *fractionToReturn;
    
    if ([frstFraction.denominator isEqual:scndFraction.denominator]){      //Check to see that denominators are equal to one another

        float frstFractionNumFloat = frstFraction.numerator.floatValue;     //Get float of 1st fraction numerator
        float scndFractionNumFloat = scndFraction.numerator.floatValue;     //Get float of 2nd fraction numerator
        float fractionToReturnFloat = frstFractionNumFloat - scndFractionNumFloat;     //Subtract numerators of 1st and 2nd fractions

        NSNumber *fractionToReturnNumerator = [NSNumber numberWithFloat: fractionToReturnFloat];
        fractionToReturn = [Fractions newFractionWithNumerator:fractionToReturnNumerator andDenominator:frstFraction.denominator];
    }
    
    else {
        NSNumber *denomLCM = [Fractions getLCMOf: frstFraction.denominator and: scndFraction.denominator];     //Get lowest common multiple of the denominator of two input fractions.
        float denomLCMFloat = denomLCM.floatValue;
        float denomFrstFrac = frstFraction.denominator.floatValue;
        float denomScndFrac = scndFraction.denominator.floatValue;
        float multiplier = denomLCMFloat / denomFrstFrac;     //Number to multiply first fraction numerator by.
        
        //Convert fraction numerators to floats from NSNumber.
        float frstNumeratorFloat = frstFraction.numerator.floatValue;
        float scndNumeratorFloat = scndFraction.numerator.floatValue;
        
        float frstNumeratorRev = frstNumeratorFloat * multiplier;    //Multiply first fraction numerator by multiplier variable.
        multiplier = denomLCMFloat / denomScndFrac;     //Redefine multiplier variable for second fraction.
        float secondNumeratorRev = scndNumeratorFloat * multiplier;     //Multiply second fraction numerator by multiplier variable.
        
        float numeratorFinalFloat = secondNumeratorRev - frstNumeratorRev; //Subtract numerators after both being multiplied.
        
        NSNumber *numeratorFinal = [NSNumber numberWithFloat:numeratorFinalFloat];             //Convert numerator from float to NSNumber
        
        fractionToReturn = [Fractions newFractionWithNumerator:numeratorFinal andDenominator:denomLCM];     //Set the returning fraction to the sum of the two input fractions
        

        
    }
    return fractionToReturn;
}

//Set fraction to another fraction
-(Fractions *)set:(Fractions *)inputFraction {
    self.numerator = inputFraction.numerator;
    self.denominator = inputFraction.denominator;
    
    return self;
}
//Get LCM
+(NSNumber *)getLCMOf:(NSNumber *)frstNumber and:(NSNumber *)scndNumber {
    float n;
    float a = frstNumber.floatValue;
    float b = scndNumber.floatValue;
    
    for (n=1;;n+=0.01) {     //Go through all numbers and
        if (fmodf(n, a)==0 && fmodf(n, b) == 0){     //check to see if the input numbers are evenly divisible by the current number
            NSNumber *numberToReturn = [NSNumber numberWithFloat:n];
            return numberToReturn;     //If it is, return the current number that the for loop is on.
        }
    }
}

+(Fractions *)newFractionWithNumerator:(NSNumber *)numerator andDenominator:(NSNumber *)denominator {
    Fractions *returningFraction;
    returningFraction.numerator = numerator;     //Set numerator of returning fraction to input numerator
    returningFraction.denominator = denominator;     //Set denominator of returning fraction to input denominator
    return returningFraction;
}

-(NSString *)fractionToString{
    NSString *returningString;
    returningString = [NSString stringWithFormat:@"(%@,%@)",self.numerator, self.denominator];
    return returningString;
}

+(Fractions *)multiply:(Fractions *)frstFraction by:(Fractions *)scndFraction {
    Fractions *returningFraction;
    
    //Convert numerators of both fractions to float
    float frstFractionNum = frstFraction.numerator.floatValue;
    float scndFractionNum = scndFraction.numerator.floatValue;
    
    //Convert denominators of both fractions to float
    float frstFractionDenom = frstFraction.denominator.floatValue;
    float scndFractionDenom = scndFraction.denominator.floatValue;
    
    frstFractionNum = frstFractionNum * scndFractionNum;     //Multiply two numerators together
    frstFractionDenom = frstFractionDenom * scndFractionDenom;     //Multiply two denominators together
    
    NSNumber *fractionNum = [NSNumber numberWithFloat: frstFractionNum];
    NSNumber *fractionDenom = [NSNumber numberWithFloat: frstFractionDenom];
    
    returningFraction = [Fractions newFractionWithNumerator: fractionNum andDenominator: fractionDenom];
    
    return returningFraction;
    
}

+(Fractions *)divide:(Fractions *)frstFraction by:(Fractions *)scndFraction {
    Fractions *returningFraction;
    
    //Convert numerator of both fractions to float
    float frstFractionNum = frstFraction.numerator.floatValue;
    float scndFractionNum = scndFraction.numerator.floatValue;
    
    //Convert denominators of both fractions to float
    float frstFractionDenom = frstFraction.denominator.floatValue;
    float scndFractionDenom = scndFraction.denominator.floatValue;
    
    frstFractionNum = frstFractionNum * scndFractionDenom;
    frstFractionDenom = frstFractionDenom * scndFractionNum;
    
    NSNumber *fractionNum = [NSNumber numberWithFloat: frstFractionNum];
    NSNumber *fractionDenom = [NSNumber numberWithFloat: scndFractionDenom];
    
    returningFraction = [Fractions newFractionWithNumerator: fractionNum andDenominator: fractionDenom];
}
@end
