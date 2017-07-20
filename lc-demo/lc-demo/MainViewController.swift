//
//  MainViewController.swift
//  lc-demo
//
//  Created by Ben Law on 7/19/17.
//  Copyright © 2017 Diligent Boards. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    var leadershipCloudLayouts: Results<LeadershipCloudLayout>!
    var subscription: NotificationToken?
    
    
    @IBOutlet weak var databaseInfoLabel:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        leadershipCloudLayouts = realm.objects(LeadershipCloudLayout.self)
        subscription = notificationSubscription(leadershipCloudLayouts: leadershipCloudLayouts)
    }

    func notificationSubscription(leadershipCloudLayouts: Results<LeadershipCloudLayout>) -> NotificationToken {
        return leadershipCloudLayouts.addNotificationBlock {[weak self] (changes: RealmCollectionChange<Results<LeadershipCloudLayout>>) in
            self?.updateUI(changes: changes)
        }
    }

    
    func updateUI(changes:RealmCollectionChange<Results<LeadershipCloudLayout>>){
        switch changes {
        case .initial(_):

            print("Initial")
            break
        case .update(_, let deletions, let insertions, _):
            
            updateLabel()
            
            print("Update");
            break
        case .error(let error):
            print(error)
        }
    }
    
    func updateLabel(){
        
        var databaseInfo = ""
        
        for leadershipCloudLayout in leadershipCloudLayouts {
            databaseInfo += "User Id:" + leadershipCloudLayout.userId + "\n"
            databaseInfo += "User Name:" + leadershipCloudLayout.userName + "\n"
            databaseInfo += "Top window status:" + String(leadershipCloudLayout.lcTopWindowStatus) + "\n"
            databaseInfo += "Review status:" + String(leadershipCloudLayout.lcReviewStatus) + "\n"
            databaseInfo += "insight status:" + String(leadershipCloudLayout.lcInsightsStatus) + "\n"
            
            databaseInfo += "Module includes - \n"
            
            for module in leadershipCloudLayout.lcReviewModules {
                databaseInfo += String(module.lcReviewModule) + "\n"
            }
            
        }
        
        
        
        databaseInfoLabel.text = databaseInfo
    }
    
}

