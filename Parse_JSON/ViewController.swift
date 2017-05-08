//
//  ViewController.swift
//  Parse_JSON
//
//  Created by user128130 on 5/8/17.
//  Copyright © 2017 a.yahello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://api.adorable.io/avatars/list")
        
        let task = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            
            if error != nil{
                print("Error")
            }
            else
            {
                    if let mydata = data {
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as  AnyObject
                            
                            //print(myJson) //dictionary
                            //going one step in a dictionary
                            if let face = myJson["face"] as AnyObject?
                            {
                                if let mouth = face["mouth"] as! NSArray?
                                {
                                    //print(mouth)//separate dictionary mouth
                                    //printfirst 3
                                    for i in 0..<3
                                    {
                                        print(mouth[i])
                                    }
                                }
                                }
                        }
                            catch{
                                
                            }
                        }
                    }
                }
        task.resume()
        
            }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

