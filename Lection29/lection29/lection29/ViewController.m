//
//  ViewController.m
//  lection29
//
//  Created by Даниил Петров on 05.07.2021.
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController () <MyClassProtocol>

@property (strong) MyClass *myClass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myClass = [MyClass new];
    self.myClass.delegate = self;
    [self.myClass myArray];

}

- (void)getMyArray:(NSArray *)array {
    NSLog(@"Base array");
    NSLog(@"%@", array);
    
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        
        NSUInteger firstObj = [obj1 componentsSeparatedByString:@"d"].count;
        NSUInteger secondObj = [obj2 componentsSeparatedByString:@"d"].count;
        
        if (firstObj > secondObj) {
            return NSOrderedAscending;
        } else if (firstObj < secondObj) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    NSLog(@"Sorted array");
    for (int index = 0; index < sortedArray.count; index++) {
        NSUInteger count = [sortedArray[index] componentsSeparatedByString:@"d"].count - 1;
        NSLog(@"%@ (count 'd': %lu)", sortedArray[index], count);
    }
}

@end
