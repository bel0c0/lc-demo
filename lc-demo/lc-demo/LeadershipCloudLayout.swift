//
//  LeadershipCloudLayout.swift
//  lc-demo
//
//  Created by Ben Law on 7/19/17.
//  Copyright © 2017 Diligent Boards. All rights reserved.
//

import Foundation
import RealmSwift

class LeadershipCloudLayout : Object {
    
    dynamic var userId = UUID().uuidString
    dynamic var userName = ""
    dynamic var lcTopWindowStatus = 1   // 0 - mini, 1 - partial , 2 - full
    dynamic var lcReviewStatus = 1 // 0 - mini, 1 - partial , 2 - full
    dynamic var lcInsightsStatus = 1 // 0 - mini, 1 - partial , 2 - full
    
    let lcReviewModules = List<LeadershipCloudModule>()
    
    dynamic var created = NSDate()

    convenience init(userName: String) {
        self.init()
        self.userName = userName
    }
}
