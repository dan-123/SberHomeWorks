//
//  MyClass.h
//  lection29
//
//  Created by Даниил Петров on 06.07.2021.
//

#import <Foundation/Foundation.h>
#import "MyClassProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject

@property (weak) id<MyClassProtocol> delegate;
-(void)myArray;

@end

NS_ASSUME_NONNULL_END
