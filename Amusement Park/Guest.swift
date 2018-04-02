//
//  Guest.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/26/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

class Guest: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var areaAccess: [AreaAcess] = [.amusementAreas]
    var rideAcess: [RideAccess] = [.accessAllRides]
    var dateOfBirth: Date?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    
    init(firstName: String? = nil, lastname: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        
        
        self.firstName = firstName
        self.lastName = lastname
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.entrantType = entrantType
        self.dateOfBirth = dateOfBirth
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
        
    }
}


class ClassicGuest: Guest {
    override init(firstName: String? = nil, lastname: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType = .ClassicGuest, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        super.init(entrantType: entrantType)
    }
}
class VIPGuest: Guest {
    override init(firstName: String? = nil, lastname: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType = .VIPGuest, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        super.init(entrantType: entrantType)
        self.rideAcess = [.accessAllRides, .skipAllRides]
        self.discountOnFood = 10
        self.discountOnMerchandise = 10
    }
}

class ChildGuest: Guest {
    let maxChildAge: Int = 5
    
    init(dateofBirth: Date?, entrantType: EntrantType = .ChildGuest) throws {
        super.init(entrantType: entrantType)
        guard let dateOfBirthUnwrapped = dateofBirth else {
            throw InitializerError.missingDateOfBirth
        }
   
    let calendar = Calendar.current
        let ageComponent = calendar.dateComponents([.year], from: dateOfBirthUnwrapped, to: Date())
        
        if let ageComponentUnwrapped = ageComponent.year {
            if ageComponentUnwrapped <= maxChildAge {
                self.dateOfBirth = dateOfBirthUnwrapped
            } else {
                throw InitializerError.olderThenAgeLimit
            }
        }
    
    }
}











