//
//  Order.swift
//  CupcakeCorner
//
//  Created by Anurag on 21/01/25.
//

import Foundation

@Observable

class Order : Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla","Strawberry","Chocolate","Rainbow"]
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var type = 0;
    var quantity = 3;
    
    var specialRequestEnabled = false {
        didSet{
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false;
    var addSprinkles = false;
    
    var hasValidInputs: Bool {
        
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return false
            }
        return true
    }
    
    var cost : Decimal {
        
        var cost = Decimal(quantity) * 2
        
        cost += Decimal(type) / 2
        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost;
    }
    
  
   func saveAddressToUserDefaults() {
       let address = ["name": name, "streetAddress": streetAddress, "city": city, "zip": zip]
       UserDefaults.standard.set(address,forKey:"User Address")
    }
    
    func loadAddressFromUserDefaults() {
            if let savedAddress = UserDefaults.standard.dictionary(forKey: "SavedAddress") as? [String: String] {
                self.name = savedAddress["name"] ?? ""
                self.streetAddress = savedAddress["streetAddress"] ?? ""
                self.city = savedAddress["city"] ?? ""
                self.zip = savedAddress["zip"] ?? ""
            }
        }
    
}
