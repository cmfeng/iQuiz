
//  AnsViewController.swift
//  iQuiz
//
//  Created by cmfeng on 11/13/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import UIKit

class AnsViewController: UIViewController {

    
    @IBOutlet weak var QuesText: UILabel!
    @IBOutlet weak var CorAnsText: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    var ques : String?
    var corAns: String?
    var result: String?
    var LastQue: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        QuesText.text = ques
        CorAnsText.text = "Right Answer:\n \(corAns!)"
        ResultLabel.text = result

        // Do any additional setup after loading the view.
    }
    @IBAction func NextButton(_ sender: AnyObject) {
        if LastQue == 0{
            self.performSegue(withIdentifier: "Segue1", sender: self)
        } else {
            self.performSegue(withIdentifier: "Segue2", sender: self)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
