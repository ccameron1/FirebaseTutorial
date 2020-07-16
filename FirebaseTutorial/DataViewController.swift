//
//  DataViewController.swift
//  FirebaseTutorial
//
//  Created by Carly Cameron on 7/15/20.
//  Copyright © 2020 Carly Cameron. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var firebaseLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        db.collection("Test").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let str = document["item"] as! String
                    self.firebaseLable.text = str
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
