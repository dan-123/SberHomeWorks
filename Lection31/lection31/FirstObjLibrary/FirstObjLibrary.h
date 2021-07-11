//
//  FirstObjLibrary.h
//  FirstObjLibrary
//
//  Created by Даниил Петров on 11.07.2021.
//

#import <Foundation/Foundation.h>
#import "SecondObjLibrary.h"

@interface FirstObjLibrary : NSObject

@property (strong, nonatomic, readonly) SecondObjLibrary *secondObjLib;

@end
