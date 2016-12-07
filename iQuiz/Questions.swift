//
//  Questions.swift
//  iQuiz
//
//  Created by cmfeng on 11/14/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import Foundation
import UIKit
public class Question{
    let text: String
    let answer: Int
    let answers: [String]
    public init(_ t: String, _ aas : [String],_ a: Int) {
        text = t
        answers = aas
        answer = a
    }
}

public class Questions {
    let title: String
    let desc: String
    let questions: [Question]
    
    public init(_ t: String, _ des : String,_ a: [Question]) {
        title = t
        desc = des
        questions = a
    }
}
public class Quiz: NSObject, NSCoding {
    var subject : String = ""
    var quizDescription : String = ""
    var icon : UIImage?
    override public var description : String {
        return "\(subject), \(quizDescription)"
    }
    
    init(subject: String, quizDesc: String, icon: UIImage?) {
        self.subject = subject
        self.quizDescription = quizDesc
        self.icon = icon
    }
    
    //Try starts
    
    required convenience public init?(coder decoder: NSCoder) {
        guard let subject = decoder.decodeObject(forKey: "subject") as? String,
            let quizDescription = decoder.decodeObject(forKey: "quizDescription") as? String?,
            let icon = decoder.decodeObject(forKey: "quizDescription") as? UIImage?
            else { return nil }
        
        self.init(
            subject: subject,
            quizDesc: quizDescription!,
            icon: icon
        )
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.subject, forKey: "subject")
        aCoder.encode(self.quizDescription, forKey: "quizDescription")
        aCoder.encode(self.icon, forKey: "icon")
    }
    //try ends

}

extension Questions{

    //let urlComponents: URLComponents // base URL components of the web service
    //private let session: URLSession // shared session for interacting with the web service
    /*
    static func questions(matching query: String, completion: @escaping ([Questions]) -> Void) {
        var searchURLComponents = URLComponents()
        searchURLComponents.path = "/search"
        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: query)]
        let searchURL = searchURLComponents.url!
        let session: URLSession
        session.dataTask(with: searchURL, completionHandler: { (data, response, error) in
            var questionses: [Questions] = []
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] {
                for case let result in json {
                //for case let result in json["results"] {
                    if let questions = Questions(title: result["title"], desc: result["desc"], questions: result["questions"]) {
                    //if let questions = Questions(json: result) {
                        questionses.append(questions)
                    }
                }
            }
            completion(questionses)

        }).resume()
            
        }*/
        /*session.dataTask(url: searchURL, completion: { (_, _, data, _)
        var             }
            
            completion(questionses)
        }).resume()*/
}


class Quizes: NSObject {
    static let shared = getOriginalQuizes()
    private (set) var list: [Quiz] = Array()
    
    public static func getOriginalQuizes() -> Quizes {
        let quizes = Quizes()
        return quizes
    }
    
    private static let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "quizes"
    
    override init() {
        super.init()
    }
    
    func add(quiz: Quiz) {
        list.append(quiz)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Quizes.filePath)
    }
    
    func loadFromFile() {
        let list = NSKeyedUnarchiver.unarchiveObject(withFile: Quizes.filePath) as? [Quiz]
        if list != nil {
            self.list = list!
        }
    }
    
    
    
    func clear() {
        self.list = Array()
    }
    
    func remove(at: Int) {
        list.remove(at: at)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Quizes.filePath)
    }

}
class QuestionS {
    static let shared = getQuestionsS()
    
    private static func getQuestionsS() -> QuestionS{
        
        return QuestionS()
    }
    
    var list : [String: [Question]]
    init () {
        self.list = [:]
    }

}
class QuizCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var dscp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

