//
//  ViewController.swift
//  lection31
//
//  Created by Даниил Петров on 11.07.2021.
//

import UIKit
import FirstObjLibrary
import FirstSwiftLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Objective-C в Objective-C
        
        print("Objective-C в Objective-C")

        let firstObjLibrary = FirstObjLibrary()
        print(firstObjLibrary.firstObjLibraryFunc())
        print(firstObjLibrary.callSecondIbjLibrary())
        
        // MARK: - Swift в swift
        
        print("\nSwift в swift")
        
        let firstSwiftLibrary = FirstSwiftLibrary()
        print(firstSwiftLibrary.firstSwiftLibraryText)
        print(firstSwiftLibrary.callSecondSwiftLibrary())
        
        // MARK: - Objective-C в Swift
        
        print("\nObjective-C в Swift")
        
//        let swiftLibrary = FirstSwiftLibrary()
        print(firstSwiftLibrary.firstSwiftLibraryText)
        print(firstSwiftLibrary.callFirstObjLibrary())
        
        // MARK: - Swift в Objective-C
        
        print("\nSwift в Objective-C")
        
//        let ObjLibrary = FirstObjLibrary()
        print(firstObjLibrary.firstObjLibraryFunc())
        print(firstObjLibrary.callFirstSwiftLibrary())
    }
    
}

