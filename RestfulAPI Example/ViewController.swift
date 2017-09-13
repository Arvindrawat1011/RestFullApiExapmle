//
//  ViewController.swift
//  RestfulAPI Example
//
//  Created by Appinventiv Technologies on 12/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var dictMain = [String:Any]()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var id: UITextField!   //id txtField
    
    
    @IBOutlet weak var nameTxtField: UITextField!    //name txtField
    
  
    @IBAction func postBtnAction(_ sender: UIButton) {
        
        post ()
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 5) {
            self.idLabel.text = String(describing: self.dictMain["ID"]!)
            self.nameLabel.text =  self.dictMain["Name"]! as? String
        }
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
    
    }
        
    
    func post (){
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "7e5910cb-d9f0-2ea3-d8e4-50c2ca3269f9"
        ]
        
        let postData = NSMutableData(data: "ID=\(id.text!)".data(using: String.Encoding.utf8)!)
        postData.append("&Name=\( nameTxtField.text!)".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/post")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                 let responseData = String(data: data!, encoding: .utf8)
                print(responseData!)
            }
            
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))

            guard let dict = json as? [String:Any] else { fatalError("dict not memorised") }

            guard let form = dict["form"] as? [String:Any] else { fatalError("routes not memorised") }
            print(form)
           
         
            
            print(form["ID"]!)
            
           
            self.dictMain = ["ID":form["ID"]!,"Name":form["Name"]!]
            print(self.dictMain["ID"]! as Any)
            
        })
        
     
        
        
        dataTask.resume()

    }
    
    
    

}
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   
        
//        let headers = [
//            "content-type": "application/x-www-form-urlencoded",
//            "cache-control": "no-cache",
//            "postman-token": "3c0be4c6-453a-2b61-cf3f-6be52d3737a1",
//
//        ]
//
//        let postData = NSMutableData(data:"key=AIzaSyAklYbpjAZhuv4WYAIpsg6iNZzlpSxKRQs".data(using: String.Encoding.utf8)!)
//
//    let request = NSMutableURLRequest(url: NSURL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=75%209th%20Ave%20New%20York%2C%20NY&destination=MetLife%20Stadium%201%20MetLife%20Stadium%20Dr%20East%20Rutherford%2C%20NJ%2007073&key%2Fhttps%3A%2F%2Fwww.google.co.in%2Fsearch%3Fclient=safari&rls=en&q=AIzaSyAklYbpjAZhuv4WYAIpsg6iNZzlpSxKRQs&ie=UTF-8&oe=UTF-8&gfe_rd=cr&dcr=0&ei=dMO3WdbAFMH08wfMjLS4BQ")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "post"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as Data
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error!)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse!)
//                let resposneData = String(data: data!, encoding: .utf8)
//
//                print("This is a reponse \(resposneData!)")
//
//
//
//
//let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
//
//                guard let dict = json as? [String:Any] else { fatalError("dict not memorised") }
//                print()
//                print()
//                guard let routes = dict["routes"] as? [[String:Any]] else { fatalError("routes not memorised") }
//
//                guard let leg = routes[0]["legs"] as? [[String:Any]] else { fatalError("Legs not initialised") }
//                guard let start_location = leg[0]["start_location"] as? [String:Any] else { fatalError("Legs not initialised")}
//                //guard let lat = start_location[0]["lat"] as? [String:Any] else { fatalError("Legs not initialised") }
//
//                print("My ID is \(String(describing: start_location["lat"]))")
//// print("My ID is \(start_location)")
//
//
//
//
//            }});dataTask.resume()
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }


//import Foundation
//
//let headers = [
//    "content-type": "application/x-www-form-urlencoded",
//    "cache-control": "no-cache",
//    "postman-token": "4f52db6d-f6b7-6bed-8f80-5465d6ffb6eb"
//]
//
//let postData = NSMutableData(data: "key=AIzaSyAklYbpjAZhuv4WYAIpsg6iNZzlpSxKRQs".data(using: String.Encoding.utf8)!)
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=75%209th%20Ave%20New%20York%2C%20NY&destination=MetLife%20Stadium%201%20MetLife%20Stadium%20Dr%20East%20Rutherford%2C%20NJ%2007073&key%2Fhttps%3A%2F%2Fwww.google.co.in%2Fsearch%3Fclient=safari&rls=en&q=AIzaSyAklYbpjAZhuv4WYAIpsg6iNZzlpSxKRQs&ie=UTF-8&oe=UTF-8&gfe_rd=cr&dcr=0&ei=dMO3WdbAFMH08wfMjLS4BQ")! as URL,
//                                  cachePolicy: .useProtocolCachePolicy,
//                                  timeoutInterval: 10.0)
//request.httpMethod = "POST"
//request.allHTTPHeaderFields = headers
//request.httpBody = postData as Data
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//    if (error != nil) {
//        print(error)
//    } else {
//        let httpResponse = response as? HTTPURLResponse
//        print(httpResponse)
//    }
//})
//
//dataTask.resume()


