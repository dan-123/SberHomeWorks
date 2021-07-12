//
//  FirstObjLibrary.m
//  FirstObjLibrary
//
//  Created by Даниил Петров on 11.07.2021.
//

#import "FirstObjLibrary.h"
#import "FirstSwiftLibrary-Swift.h"

@implementation FirstObjLibrary

-(NSString*) firstObjLibraryFunc {
    return @"First objective-C library";
}

-(NSString*) callSecondIbjLibrary {
    SecondObjLibrary *secondObjLibrary = [SecondObjLibrary new];
    return [secondObjLibrary secondObjLibraryFunc];
}

-(NSString*) callFirstSwiftLibrary {
    FirstSwiftLibrary *firstSwiftLibrary = [FirstSwiftLibrary new];
    return [firstSwiftLibrary firstSwiftLibraryFunc];
    
}

@end
