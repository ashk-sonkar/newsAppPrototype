//
//  DisplayNewsViewController.swift
//  NewsAppPrototype
//
//  Created by apple on 11/03/18.
//  Copyright © 2018 Sonkar. All rights reserved.
//

import UIKit
import SDWebImage
class DisplayNewsViewController: UIViewController {

    
    @IBOutlet weak var newsImage: UIImageView!
    
    
    @IBOutlet weak var detalLabel: UILabel!
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var newsContent: UITextView!
    var news : [String: AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        displayNews()
        
        //self.dismiss(animated: true, completion: nil)
    }
    
    func displayNews(){
        
        setupViews()
        
        if let head = news["mNewsHeading"] as? String{
            
            headingLabel.text = head
        }
        else{
            print("Value not reaching")
        }
        
        if let description = news["mNewsDescription"] as? String{
            newsContent.text = description
        }
        else{
            print("News Content Value not reaching")
        }
        var details = ""
        if let place = news["mNewsLocation"] as? String{
            details = place + ", "
        }
        if let date = news["mNewsDate"] as? String{
            details = details + date + ", "
        }
        if let time = news["mNewsPublishTime"] as? String{
            details = details + time
        }
        
        detalLabel.text = details
        
    }

    func setupViews(){
        newsContent.isEditable = false
        if let url = (news["mNewsImageUrl1"] as? String){
            let getUrl = URL(string: url)
        newsImage.sd_setImage(with: getUrl, completed: nil)
        }
    }
    @IBAction func backPressed(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
