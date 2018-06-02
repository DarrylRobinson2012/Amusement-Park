//
//  TestCases.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 3/28/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import Foundation

// By running the app, the test method will be called from ViewController,
//and all the test cases will be excuted


 func test() {
    
    //success case for VIP guest entering amusemnet areas -- allowed
        print("Test case 1 ...")
        let vipGuest1 = VIPGuest()
        var vipPass1 = CheckPoint.generatePass(entrant: vipGuest1)
        CheckPoint.checkPassForAreaAccess(pass: &vipPass1, to: .amusementAreas)
        print("--- ")
    
    
    // fail case for VIP guest entering amusement areas -- denied
    
    print("Test case 2 ... ")
    let vipGuest2 = VIPGuest()
    var vipPass2 = CheckPoint.generatePass(entrant: vipGuest2)
    CheckPoint.checkPassForAreaAccess(pass: &vipPass2, to: .kitchenAreas)
    print("--- ")
    
    //success case for child guest entering amusement areas -- allowed
    //Date of birth is set to today so the birthday message shows up
    
    do {
        print("Test case 3 ...")
        let childGuest = try ChildGuest(dateofBirth: Date())
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print("---- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    //success case for child guest entering amusemnt areas -- allowed
    //Date of birth is set to some date so birthday message does not show up
    
    do {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let someDate = formatter.date(from: "28.03.18")
        
        print("Test case 4 ... ")
        let childGuest = try ChildGuest(dateofBirth: someDate)
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        print(("----- "))
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    //fail case for child guest missing date of birth -- Error handled
    do {
        print("Test case 6 ... ")
        let childGuest = try ChildGuest(dateofBirth: nil)
        var childPass = CheckPoint.generatePass(entrant: childGuest)
        CheckPoint.checkPassForAreaAccess(pass: &childPass, to: .amusementAreas)
        ("---- ")
    } catch {
        print("Error: \(error)")
        print("---")
    }
    
    //success case for food service employee entering the kitchen -- allowed
    
    do {
        print("Test case 7 ... ")
        let foodServiceEmployee = try FoodServiceEmployee(firstName: "Dave", lastName: "Guru", streetAddress: "876 thu", city: "ibiza", state: "Spain", zipCode: "5737", dateOfBirth: nil  )
        var kitchenPass = CheckPoint.generatePass(entrant: foodServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &kitchenPass, to: .kitchenAreas)
        
    }  catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    // fail case for food service employee with missing first name to trigger the error
    do {
        print("Test case 8 ...")
        let foodserviceEmployee = try FoodServiceEmployee(firstName: "Tim", lastName: "Nelson", streetAddress: "686 yuo", city: "ATL", state: "Ga", zipCode: "4686", dateOfBirth: nil)
        _ = CheckPoint.generatePass(entrant: foodserviceEmployee)
        print("---- ")
    } catch {
        print("Error: \(error)")
        print("---- ")
    }
    //success case for ride service employee entering the ride area
    do {
        print("Test case 9 ...")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "Hue", lastName: "Jackson", streetAddress: "8765 pine", city: "riverdale", state: "South Carolina", zipCode: "9876", entrantType: .RideServiceEmployee, dateOfBirth: nil )
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .rideControlAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("---- ")
    }
    
    //fail case for ride service employee the kitchen  -- denied entry
    do {
        print("Test case 10")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: "you", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", entrantType: .RideServiceEmployee, dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .kitchenAreas)
        print("----- ")
        
    } catch {
        print("Error: \(error)")
        print("---- ")
    }
    
    //fail case for ride service employee --Error missing lastname
    
    do {
        print("Test case 11 ... ")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: nil, streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234", entrantType: .RideServiceEmployee, dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .rideControlAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    //Success case for maintenance employee entering the maintenance area -- allowed
    do {
        print("Test case 12 ...")
        let maintenanceEmployee = try MaintenanceEmployee(firstName: "Jimmi", lastName: "hendrix", streetAddress: "76867 hin cone", city: "Doraville", state: "Tennesee", zipCode: "768967", entrantType: .MaintenanceEmployee, dateOfBirth: nil)
        var ridePass = CheckPoint.generatePass(entrant: maintenanceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &ridePass, to: .maintenanceAreas)
        print("---- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    //fail case for maintenance employee, missing street address -- Error
    do {
        print("Test case 13 ...")
        let maintenanceEmployee = try MaintenanceEmployee(firstName: "james", lastName: "Payne", streetAddress: nil, city: "JKH", state: "GA", zipCode: "879", entrantType: .MaintenanceEmployee, dateOfBirth: nil)
        var maintenancePass = CheckPoint.generatePass(entrant: maintenanceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: &maintenancePass, to: .maintenanceAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("----- ")
    }
    
    // success case for manager, entering the office area -- allowed
    do {
        print("Test case 14 ... ")
        let manager = try Manager(firstName: "John", lastName: "Bon", streetAddress: "674 HUE TOM", city: "ATL", state: "GA", zipCode: "497862", entrantType: .Manager, dateOfBirth: nil)
        var  managerPass = CheckPoint.generatePass(entrant: manager)
        CheckPoint.checkPassForAreaAccess(pass: &managerPass, to: .officeAreas)
        print("---- ")
    } catch {
        print("Error: \(error)")
        print("---- ")
    }
    
    // fail case for manager, missing zipcode ---Error
    do {
         print("Test case 15 ...")
        let manager = try Manager(firstName: "Darryl", lastName: "Robinson", streetAddress: "6286 pine view terrace", city: "Riverdale ", state: "Ga", zipCode: nil, entrantType: .Manager, dateOfBirth: nil)
        var managerPass = CheckPoint.generatePass(entrant: manager)
        CheckPoint.checkPassForAreaAccess(pass: &managerPass, to: .officeAreas)
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    //success case for classic guest entering amusement areas -- allowed
    
    print("Test case 16 ...")
    let classicGuest = ClassicGuest()
    var classicPass = CheckPoint.generatePass(entrant:  classicGuest )
    CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
    print("---- ")
    
    
    
    //cases for classic guest swiping too fast
    print("Test case 17 ")
    // second swipe should fail due to quick reswipe
    CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
    
    
    
    
    //Third swipe should succeed after 6 seconds delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 6 ) {
        CheckPoint.checkPassForAreaAccess(pass: &classicPass, to: .amusementAreas)
        print("---- ")
    }
    
    
 
    
    
    
    
    
    
}













