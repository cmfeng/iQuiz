//
//  Questions.swift
//  iQuiz
//
//  Created by cmfeng on 11/14/16.
//  Copyright © 2016 com.ischool.cmfeng. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answer: Int
    let answers: [String]
}

struct Questions {
    let title: String
    let desc: String
    let questions: [Question]
}

extension Questions{

    //let urlComponents: URLComponents // base URL components of the web service
    //private let session: URLSession // shared session for interacting with the web service
    
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
            
        }
        /*session.dataTask(url: searchURL, completion: { (_, _, data, _)
        var             }
            
            completion(questionses)
        }).resume()*/
}
