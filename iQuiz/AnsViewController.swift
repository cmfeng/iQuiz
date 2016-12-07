
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

    var sub = ""
    var corCount = 0
    var curQs : [Question]? = nil
    var qCount : Int = 2
    var userAns : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let q = self.curQs![self.qCount]
        
        CorAnsText.text = q.answers[q.answer]
        if self.userAns == q.answer {
            self.corCount += 1
            ResultLabel.text = "Right!"
        } else {
            ResultLabel.text = "Wrong!"
        }
        QuesText.text = q.text
    }
    @IBAction func NextButton(_ sender: AnyObject) {
        if (self.qCount + 1 == self.curQs!.count) {
            performSegue(withIdentifier: "finishSegue", sender: self)
        } else {
            performSegue(withIdentifier: "nextSegue", sender: self)
            //self.dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "finish") {
            let destination = segue.destination as! FinishViewController
            destination.qCount = self.curQs!.count
            destination.corCount = self.corCount
        }
        else if (segue.identifier == "nextSegue") {
            let destination = segue.destination as! QuestionViewController
            destination.subject = self.sub
            destination.qIndex = self.qCount + 1
            destination.numCrt = self.corCount
        }
    }
    

}
