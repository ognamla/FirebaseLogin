//
//  ResetPasswordViewController.swift
//  FirebaseTutorial2017
//
//  Created by Ognam.Chen on 2017/4/14.
//  Copyright © 2017年 SwiftCourse. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func submitAction(_ sender: AnyObject) {
        if emailTextField.text == "" {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter your Email", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.sendPasswordReset(withEmail: emailTextField.text!, completion: {
                
                (error) in
                
                var title = ""
                
                var message = ""
                
                if error != nil {
                    
                    title  = "Error!"
                    
                    message = (error?.localizedDescription)!
                    
                } else {
                    
                    title = "Sucess!"
                    
                    message = "Passworl reset email sent."
                    
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                
            })
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
