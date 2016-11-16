//
//  MainTableViewController.swift
//  iQuiz
//
//  Created by cmfeng on 11/2/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    private var subs = ["Mathematics", "Marvel Super Heroes","Science"]
    private var descs = ["Think you are good at math?","Provided by Marvel Comics",
                         "I love science"]
    private var url = "http://tednewardsandbox.site44.com/questions.json"
    @IBAction func SettingAlert(_ sender: AnyObject) {
        let alertcontroller = UIAlertController.init(title: "Setting", message: "Settings go here", preferredStyle: .alert)
        let act = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)})
        alertcontroller.addAction(act)
        self.present(alertcontroller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        let urlComponents: URLComponents
        let session: URLSession
        var searchURLComponents = URLComponents()
        searchURLComponents.path = "/search"
        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: url)]
        let searchURL = searchURLComponents.url!
    }
        /*session.dataTask(url: searchURL, completion: {(_, _, data, _)
            } completion(),,,};).resume()

            (data, response, error) -> Void in
            
            let statusCode = respons
        }
        
        let requestURL: NSURL = NSURL(string: url)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest){
            (data, response, error) -> Void in
            
            if error != nil{
                callback("", error!.localizedDescription)
            } else{
                let result = NSString
            }
        }
        task.resume() */

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.subs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)

        // Configure the cell...
        let image : UIImage = UIImage(named: "3")!
        cell.imageView?.image = image
        let sub = self.subs[indexPath.row]
        let desc = descs[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        cell.textLabel?.text = "Subject: \(sub)\nDescp: \(desc)"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row, forKey: "selectedRow")
        UserDefaults.standard.set(0, forKey: "queNumber")
        UserDefaults.standard.set(0, forKey: "rightNumber")
        //UserDefaults.standard.integer(forKey: "selectedRow") = indexPath.row
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
