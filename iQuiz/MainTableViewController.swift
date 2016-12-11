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
    var quizes = Quizes.shared
    var queS = QuestionS.shared
    @IBAction func SettingAlert(_ sender: AnyObject) {
        let alertcontroller = UIAlertController.init(title: "Update", message: "Input URL below", preferredStyle: UIAlertControllerStyle.alert)
        alertcontroller.addTextField { (textField) in
            textField.placeholder = "URL"
        }
        alertcontroller.addAction(UIAlertAction(title: "check now", style: .default) {
            UIAlertAction in
            let url = alertcontroller.textFields![0] as UITextField
            GetData.getData(url.text)
            self.tableView.reloadData()
            }
        )
        self.present(alertcontroller, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData.getData("http://tednewardsandbox.site44.com/questions.json")
        //print ("from mainTableView \(self.quizes.list)")

        /*self.tableView.tableFooterView = UIView()
        let urlComponents: URLComponents
        let session: URLSession
        var searchURLComponents = URLComponents()
        searchURLComponents.path = "/search"
        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: url)]
        let searchURL = searchURLComponents.url!*/
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.quizes.list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath)
        cell.awakeFromNib()
        cell.setSelected(true, animated: true)
        
        // Configure the cell...
        let image : UIImage = UIImage(named: "3")!
        
        cell.imageView?.image = image
        //cell.addSubview(cellImg)
        let sub = self.quizes.list[indexPath.row].subject
        let desc = self.quizes.list[indexPath.row].quizDescription
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byCharWrapping
        cell.textLabel?.text = "\(sub)\n\(desc)"
        cell.awakeFromNib()
        cell.setSelected(true, animated: true)
        //print (self.quizes.list)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
/*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! QuestionViewController
        let cell = sender
        let seletedRow = tableView.indexPath(for: cell as! UITableViewCell)!.row
        destination.subject = quizes.list[seletedRow].subject
        print (seletedRow)
        print (quizes.list.count)
    }
    

}
