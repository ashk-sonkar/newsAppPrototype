//
//  ViewController.swift
//  NewsAppPrototype
//
//  Created by apple on 06/03/18.
//  Copyright © 2018 Sonkar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LogInController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    var dataSnap : [DataSnapshot] = []
    var dicArray : [Dictionary<String , AnyObject>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //check()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func displayAlert(title: String, message: String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }

    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        
        if emailText.text == "" || passwordText.text == ""{
            displayAlert(title: "Error!", message: "Fields can't be empty.")
        }else{
        
            if let email = emailText.text{
                if let password = passwordText.text{
            
                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                        
                        
                        if error != nil{
                            self.displayAlert(title: "Error", message: error!.localizedDescription)
                        }
                        else{
                           // self.displayAlert(title: "Success", message: "Login Successful")
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                    })
        
        }
    }
    
    
    
}
    }
    
 
  //  func check() {
      //  Database.database().reference().child("sports-section").observe(.value) { (snapshot) in
//            if let dataDictionary = snapshot.value as? [String: AnyObject]{
//
//                //problem - creating dictionary with unique keys as dictionary keys and news as value i.e. dictionary of sports news
//
//                if let head = dataDictionary["-L44kRDc2P3pa7FiLMUL"] as? [String: Any] {
//
//                    print("reaching")
//                    print(head)
//                }
//                else
//                {
//                    print(dataDictionary)
//                }
//            }
//            else{
//                print("initial fail")
//            }
//        }
        
            // array of snapshots approach
            
//            if let dataDictionary = snapshot.value as? [String: AnyObject]{
//                    print("Reaching")
//                self.dicArray = []
//                for news in dataDictionary.values {
//
//
//                    self.dicArray.append(news as! Dictionary<String, AnyObject>)
//               self.dataSnap.append(snapshot)
//
//                }
//                print(self.dicArray.count)
//                self.arrayele()
//            }
//
//        }
//
//
//    //    var dataDictionary : Dictionary<String, AnyObject>
//
//
//}
//
//    func arrayele(){
//        if let dataDictionary: Dictionary<String, AnyObject> = dicArray[4] {
//            print("Here1")
//            print(dataDictionary)
//            if let head = dataDictionary["mNewsDescription"] as? String{
//                print("Here")
//                print(head)
//            }
//        }
//
//    }
}

