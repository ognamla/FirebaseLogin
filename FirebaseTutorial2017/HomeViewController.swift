//
//  HomeViewController.swift
//  FirebaseTutorial2017
//
//  Created by Ognam.Chen on 2017/4/14.
//  Copyright © 2017年 SwiftCourse. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logOutAction(sender: AnyObject) {
        
        if FIRAuth.auth() != nil {
            
            do {
            
            try FIRAuth.auth()?.signOut()
            
            let signupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
            
            self.present(signupViewController, animated: true, completion: nil)
                
            } catch let error as NSError {
                
                print(error.localizedDescription)
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
