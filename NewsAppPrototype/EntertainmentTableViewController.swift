import UIKit
import FirebaseDatabase
import FirebaseAuth

class EntertainmentTableViewController: UITableViewController {
    
    var dicArray : [Dictionary<String , AnyObject>] = []
    var selectedNews : [String: AnyObject] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        check()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dicArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entertainmentNewsCell", for: indexPath)
        
        // Configure the cell...
        let news = dicArray[indexPath.row]
        if let title =  news["mNewsHeading"] as? String{
            cell.textLabel?.text = title
        }
        return cell
    }
    
    func check() {
        Database.database().reference().child("entertainment-section").observe(.value) { (snapshot) in
            
            if let dataDictionary = snapshot.value as? [String: AnyObject]{
                print("Reaching")
                self.dicArray = []
                for news in dataDictionary.values {
                    
                    
                    self.dicArray.append(news as! Dictionary<String, AnyObject>)
                    //                self.dataSnap.append(snapshot)
                    
                }
                print(self.dicArray.count)
                self.tableView.reloadData()
            }
            
        }
    }
    
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        
        try? Auth.auth().signOut()
        performSegue(withIdentifier: "signOutHere", sender: nil)
      
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNews = dicArray[indexPath.row]
        
        performSegue(withIdentifier: "entertainmentNewSegue", sender: selectedNews)
  
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewNewsVC = segue.destination as? DisplayNewsViewController{
            
            viewNewsVC.news = selectedNews
            
        }
    }
    
    
}

