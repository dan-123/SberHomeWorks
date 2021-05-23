//
//  CustomActivity.swift
//  lection 11
//
//  Created by Даниил Петров on 22.05.2021.
//

import UIKit

class CustomActivity: UIActivity {
    
    var title: String
    var image: UIImage?
    var items = [Any]()
    var action: ([Any]) -> Void
    
    init(title: String, image: UIImage?, action: @escaping ([Any]) -> Void) {
        self.title = title
        self.image = image
        self.action = action
        super.init()
    }
    
    override var activityTitle: String? {
        return self.title
    }
    
    override var activityImage: UIImage? {
        return self.image
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("CustomActivity.first")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    //тут можно сделать проверку показывать или нет
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        return self.items = activityItems
    }
    
    override func perform() {
        action(self.items)
        activityDidFinish(true)
    }
}
