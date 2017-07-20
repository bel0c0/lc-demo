//
//  EditViewController.swift
//  lc-demo
//
//  Created by Ben Law on 7/20/17.
//  Copyright © 2017 Diligent Boards. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateLayout(_ sender: Any) {
        let alertController = UIAlertController(title: "Leadership Cloud Layout", message: "Do you want to update layout?", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "NO", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel”")
        }
        
        let okAction = UIAlertAction(title: "YES", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
            let realm = try! Realm()
            let leadershipCloudLayout = LeadershipCloudLayout(userName: self.userNameField.text ?? "Default")
            
            leadershipCloudLayout.lcReviewModules.append(LeadershipCloudModule(module: 1))
            leadershipCloudLayout.lcReviewModules.append(LeadershipCloudModule(module: 2))
            leadershipCloudLayout.lcReviewModules.append(LeadershipCloudModule(module:3))
            leadershipCloudLayout.lcReviewModules.append(LeadershipCloudModule(module: 4))
            
            try! realm.write {
                realm.add(leadershipCloudLayout)
            }
            
            print("OK")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    @IBAction func deleteAll(_ sender: Any) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
        
    }

}
