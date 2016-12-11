//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by cmfeng on 11/13/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var q0:[String] = ["1 + 2 = ?", "5 * 5 = ?", "5 ! = ?"]
    var ans0 = [["1", "3", "4", "6"], ["5", "10", "25", "19"], ["120", "110", "200", "100"]]
    var cor0 = [1, 2, 0]
    var q1 = ["How did spiderman gain his power", "When is Doctor Stange movive released?"]
    var ans1 = [["Bitten by a radioactive spider", "He ate a spider",
                 "Bitten by a regular spider", "Touched by a spider"],
                ["2015", "2016", "2013", "2014" ]]
    var cor1 = [0, 1]
    var q2 = ["Which is used in pencils?", "Which is a non metal that remains liquid at room temperature?"]
    var ans2 = [["Graphite", "Silicon", "Charcoal", "Phosphorous"],
                ["Phosphorous", "Bromine", "Chlorine", "Helium"]]
    var cor2 = [0, 1]
    var subject = ""
    var rowNumber = 0
    var queCounts = 0
    var selectedAns = 0
    var rightOrNot = "Wrong"
    var questionS = QuestionS.shared
    var pickerData: [String] = [String]()
    var qIndex = 0
    var curQs : [Question]? = nil
    var numCrt = 0
        //let pickerData = UserDefaults.standard.array(forKey: "ques")?[rowNumber][0]
    
    
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var AnsPicker: UIPickerView!
    @IBAction func SubmitButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "ToAnswer", sender: self)
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let q = self.curQs![qIndex]
        return q.answers[row]
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AnsPicker.delegate = self
        self.AnsPicker.dataSource = self
        self.curQs = questionS.list[subject]
        //print ("self.curQs: \(self.curQs)")
        queCounts = (self.curQs?.count)!
        let q = self.curQs![qIndex]
        self.QLabel.text = q.text
        print ("from QView: \(self.QLabel.text)")
        // Do any add=itional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if segue.identifier == "ToAnswer"{
            let destination = segue.destination as! AnsViewController
            destination.userAns = self.AnsPicker.selectedRow(inComponent: 0)
            destination.sub = self.subject
            destination.corCount = self.numCrt
            destination.qCount = self.qIndex
            destination.curQs = self.curQs
        }
    }
    

}
