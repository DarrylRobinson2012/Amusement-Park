//
//  Guest.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/26/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

//Class for a generic guest
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
    var projectNumber: Int?
    var vendorCompany: VendorCompany?
    var dateOfVisit: Date?
    
    
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Date? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        
        if let firstNameUnwrapped = firstName {
            self.firstName = firstNameUnwrapped
        }
        
        if let lastNameUnwrapped = lastName {
            self.lastName = lastNameUnwrapped
        }
        
        if let streetAddressUnwrapped = streetAddress {
            self.streetAddress = streetAddressUnwrapped
        }
        
        if let cityUnwrapped = city {
            self.city = cityUnwrapped
        }
        
        if let stateUnwrapped = state {
            self.state = stateUnwrapped
        }
        
        if let zipCodeUnwrapped = zipCode {
            self.zipCode = zipCodeUnwrapped
        }
        
        if let dateOfBirthUnwrapped = dateOfBirth {
            self.dateOfBirth = dateOfBirthUnwrapped
        }
        
        self.entrantType = entrantType
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
    }

// Class for Classic guest
class ClassicGuest: Guest {
    init(entrantType: EntrantType = .ClassicGuest, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
    }
}

//Class for a VIPGuest
class VIPGuest: Guest {
    init(entrantType: EntrantType = .VIPGuest, dateOfBirth: Date? = nil) {
        super.init(entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAcess = [.accessAllRides, .skipAllRides]
        self.discountOnFood = 10
        self.discountOnMerchandise = 10
    }
}

//Class for child Guest
// Each child should have a date of birth 
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

class SeasonPassGuest: Guest {
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipcode: String?, entrantType: EntrantType = .SeasonPassGuest, dateOfBirth: Date? = nil ) throws {
        
        
        guard let firstNameUnwrapped = firstName.nilIfEmpty else {
            throw InitializerError.missingFirstName
        }
        
        guard let lastNameUnwrapped = lastName.nilIfEmpty else {
            throw InitializerError.missingLastName
        }
        
        guard let streetAddressUnwrapped = streetAddress.nilIfEmpty else {
            throw InitializerError.missingStreetAddress
        }
        
        guard let cityUnwrapped = city.nilIfEmpty else {
            throw InitializerError.missingCity
        }
        
        guard let stateUnwrapped = state.nilIfEmpty else {
            throw InitializerError.missingState
        }
        
        guard let zipCodeUnwrapped = zipcode.nilIfEmpty else {
            throw InitializerError.missingZipCode
        }
        
        super.init(firstName: firstNameUnwrapped, lastName: lastNameUnwrapped, streetAddress: streetAddressUnwrapped, city: cityUnwrapped, state: stateUnwrapped, zipCode: zipCodeUnwrapped, entrantType: entrantType, dateOfBirth: dateOfBirth)
        self.rideAcess = [.accessAllRides, .skipAllRides]
        self.discountOnFood = 10
        self.discountOnMerchandise = 20
    }
}

class SeniorGuest: Guest {
    init(firstName: String?, lastName: String?, entrantType: EntrantType = .SeniorGuest, dateOfBirth: Date?) throws {
        guard let firstNameUnwrapped = firstName.nilIfEmpty else {
            throw InitializerError.missingFirstName
        }
        
        guard let lastNameUnwrapped = lastName.nilIfEmpty else {
            throw InitializerError.missingLastName
        }
        
        guard let dateOfBirthUnwrapped = dateOfBirth else {
            throw InitializerError.missingDateOfBirth
        }
        
        super.init(firstName: firstNameUnwrapped, lastName: lastNameUnwrapped, entrantType: entrantType, dateOfBirth: dateOfBirthUnwrapped)
        self.rideAcess = [.accessAllRides, .skipAllRides]
        self.discountOnFood = 10
        self.discountOnMerchandise = 10
    }
}












