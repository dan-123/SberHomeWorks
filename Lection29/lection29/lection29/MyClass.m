//
//  MyClass.m
//  lection29
//
//  Created by Даниил Петров on 06.07.2021.
//

#import "MyClass.h"

@implementation MyClass

- (void)myArray {
    NSArray *array = @[
      @"1. abcdabcdabcdabcdabcd",
      @"2. abcdabcd",
      @"3. abcdabcdabcdabcdabcdabcdabcd",
      @"4. abc",
      @"5. abcdabcdabcdabcdabcdabcd"
    ];
    
    [self.delegate getMyArray:array];
}

@end
