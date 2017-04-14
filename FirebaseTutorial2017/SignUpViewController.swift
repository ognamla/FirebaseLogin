//
//  SignUpViewController.swift
//  FirebaseTutorial2017
//
//  Created by Ognam.Chen on 2017/4/14.
//  Copyright © 2017年 SwiftCourse. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func createAccountAction(_ sender: AnyObject) {
        
        if emailTextField.text == "" {
            
            let alertController = UIAlertController(title: "Error!", message: "Please enter your Email/password", preferredStyle: .alert)
            
            let defaltAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaltAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {
                
                (user, error) in
                
                if error == nil {
                    
                    print("You have successfully signed up")
                    
                    let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    
                    self.present(homeViewController!, animated: true, completion: nil)
                    
                } else {
                    
                    let alertController = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK" , style: .cancel , handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
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
