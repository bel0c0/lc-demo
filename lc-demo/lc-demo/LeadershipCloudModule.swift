//
//  LeadershipCloudModule.swift
//  lc-demo
//
//  Created by Ben Law on 7/19/17.
//  Copyright © 2017 Diligent Boards. All rights reserved.
//

import Foundation
import RealmSwift

class LeadershipCloudModule: Object {
    
    dynamic var lcReviewModule = 0 // 0 - unknown, 1 - Messenger, 2 - notes, 3 - voting, 4 - questionnaires
    
    convenience init(module: Int) {
        self.init()
        self.lcReviewModule = module
    }
}
