//
//  ViewController.swift
//  Q2
//
//  Created by Muhammad Mu'Alim on 04/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dataJson = getDataFromJsonData()
        let userNoPhoneNumber = findDontHavePhoneNumber(data: dataJson)
        let userOwnArticles = findWhoHaveArticles(data: dataJson)
        let userNamedAnis = findWhoAnis(data: dataJson)
        let userBorn1986 = findWhoBorn1986(data: dataJson)
        
        print("1 . User No PhoneNumber",userNoPhoneNumber)
        print("2 . User who own articles", userOwnArticles)
        print("3 . User who have name annis", userNamedAnis)
        print("4 . User have articles on 2020")
        print("5 . User who are bone 1986", userBorn1986)
        print("6 . article containe tips on title")
        print("7 . article published before aug2019")
    }
    
    func getDataFromJsonData() -> [[String:Any]] {
        var data = [[String:Any]]()
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!
            do {
                let jsonData = try Data(contentsOf: url)
                let json = try JSONSerialization.jsonObject(with: jsonData) as! [[String:Any]]
                data = json
            }
            catch {
                print(error)
            }
        return data
    }
    
    func findDontHavePhoneNumber (data: [[String:Any]]) -> [String] {
        var userNoPhoneNumber = [String]()
        for items in data {
            let username = items["username"] as! String
            let profile = items["profile"] as! [String:Any]
            let phones = profile["phones"] as! [String]
            if (phones.isEmpty) {
                userNoPhoneNumber.append(username)
            }
        }
        return userNoPhoneNumber
    }
    
    func findWhoHaveArticles (data: [[String:Any]]) -> [String] {
        var userOwnArticles = [String]()
        for items in data {
            let item = items as [String : AnyObject]
            let articles  = item["article"] as? [Any]
        }
        return userOwnArticles
    }
    
    func findWhoAnis(data : [[String: Any]]) -> [String] {
        var userNamedAnis = [String]()
        for items in data {
            let username = items["username"] as! String
            let profile  = items["profile"] as! [String:Any]
            let fullName = profile["full_name"] as! String
            if (fullName.lowercased().contains("annis")){
                userNamedAnis.append(username)
            }
            
        }
        return userNamedAnis
    }
    
    func findWhoBorn1986(data: [[String:Any]]) -> [String] {
        var userWhoBorn1986 = [String]()
        for items in data {
            let username = items["username"] as! String
            let profile  = items["profile"] as! [String:Any]
            let birthday = profile["birthday"] as! String
            if (birthday.contains("1986")) {
                userWhoBorn1986.append(username)
            }
        }
        return userWhoBorn1986
    }


}

