//
//  ViewController.swift
//  Q3
//
//  Created by Muhammad Mu'Alim on 02/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dataJson = getDataFromJsonData()
        let allItem = getAllItem(data: dataJson)
        let electronicDevices = getElectronicDevices(data: dataJson)
        let furnitures = getFurnitures(data: dataJson)
        let itemPurchasedAt = getItemPurchasedByDate(data: dataJson)
        let brownItem = getItemBrown(data: dataJson)
        
        print("1 . All item in meeting room", allItem)
        print("2 . All electronic devices", electronicDevices)
        print("3 . All Furniture", furnitures)
        print("4 . All item purchased on 16 Januari 2020", itemPurchasedAt)
        print("5 . All item with brown color", brownItem)
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
    
    func getAllItem(data: [[String:Any]]) -> [String]{
        var allItem = [String]()
        for items in data {
            let name = items["name"] as! String
            let placement = items["placement"] as! [String:Any]
            let placementName = placement["name"] as! String
            if (placementName == "Meeting Room") {
                allItem.append(name)
            }
            
        }
        return allItem
        
    }
    
    func getElectronicDevices(data : [[String:Any]]) -> [String]{
        var electronicDevices = [String]()
        for items in data {
            let name = items["name"] as! String
            let type = items["type"] as! String
            if (type == "electronic") {
                electronicDevices.append(name)
            }
            
        }
        return electronicDevices
    }
    
    func getFurnitures(data : [[String:Any]]) -> [String]{
        var furniture = [String]()
        for items in data {
            let name = items["name"] as! String
            let type = items["type"] as! String
            if (type == "furniture") {
                furniture.append(name)
            }
            
        }
        return furniture
    }
    
    func getItemPurchasedByDate(data: [[String: Any]]) -> [String] {
        var allItem = [String]()
        for items in data {
            let name = items["name"] as! String
            let purchased_at = items["purchased_at"] as! Double
            let purchased_date = Date(timeIntervalSince1970: purchased_at)
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let strDate = dateFormatter.string(from: purchased_date)
            print(name)
            print(strDate)
            if (strDate == "16-01-2020") {
                allItem.append(name)
            }
            
        }
        return allItem
    }
    
    func getItemBrown(data: [[String: Any]]) -> [String] {
        var itemBrown = [String]()
        for items in data {
            let name = items["name"] as! String
            let itemTag = items["tags"] as! [String]
            if (itemTag.contains("brown")) {
                itemBrown.append(name)
            }
            
        }
        return itemBrown
    }

}

