//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by cmfeng on 11/13/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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

    /*let ansView : AnsViewController! = nil
    func setUp() -> Void{
        let queArray : [[String]] = [q0, q1, q2]
        let ansArray = [ans0 , ans1, ans2]
        let corArray = [cor0, cor1, cor2]
        UserDefaults.standard.set(queArray, forKey: "ques")
        UserDefaults.standard.set(ansArray, forKey: "ans")
        UserDefaults.standard.set(corArray, forKey: "cor")
        //AnsPicker.dataSource = ansArray[rowNumber][0]
    }*/
    //let pickerData = UserDefaults.standard.array(forKey: "ques")?[rowNumber][0]
    
    
    //var a = UserDefaults.standard.set(questionsArray, forKey: "ques")
    //UserDefault.standard.set(self.questionsArray, forKey: "ques")
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var AnsPicker: UIPickerView!
    @IBAction func SubmitButton(_ sender: AnyObject) {
        /*var q = UserDefaults.standard.integer(forKey: "queNumber")
        let corArray = UserDefaults.standard.array(forKey: "cor") as! [[Int]]
        var r = UserDefaults.standard.integer(forKey: "rightNumber")
        if corArray[rowNumber][q] == selectedAns {
            r += 1
            rightOrNot = "Right"
        }
        //AnsViewController.set(ques : self.QLabel.text, corAns: pickerData[corArray[rowNumber][q]], result: rightOrNot)
        UserDefaults.standard.set(r, forKey: "rightNumber")
        q += 1
        UserDefaults.standard.set(q, forKey: "queNumber")
        */
        performSegue(withIdentifier: "ToAnswer", sender: self)
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> String? {
        let q = self.curQs![qIndex]
        return q.answers[row]
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.setUp()
        rowNumber = UserDefaults.standard.integer(forKey: "selectedRow")
        let queNumber = UserDefaults.standard.integer(forKey: "queNumber")
        self.AnsPicker.delegate = self
        self.AnsPicker.dataSource = self
        let ques = UserDefaults.standard.array(forKey: "ques")! as! [[String]]
        self.QLabel.text = ques[rowNumber][queNumber]
        let answers = UserDefaults.standard.array(forKey: "ans")! as! [[[String]]]
        pickerData = answers[rowNumber][queNumber]
        queCounts = ques[rowNumber].count
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        self.curQs = questionS.list[subject]
        print (questionS.list)
        print (subject)
        self.AnsPicker.delegate = self
        self.AnsPicker.dataSource = self
        print ("self.curQs: \(self.curQs)")
        queCounts = (self.curQs?.count)!
        let q = self.curQs![qIndex]
        self.QLabel.text = q.text

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    /* The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }*/
    
    /* The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }*/
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using
        if segue.identifier == "ToAnswer"{
            let destination = segue.destination as! AnsViewController
            destination.userAns = self.AnsPicker.selectedRow(inComponent: 0)
            destination.qCount = self.qIndex
            destination.curQs = self.curQs
            destination.sub = self.subject
            destination.corCount = self.numCrt
        // Pass the selected object to the new view controller.
        }
    }
    

}
