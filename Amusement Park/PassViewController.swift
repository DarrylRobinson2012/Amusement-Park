//
//  PassViewController.swift
//  Amusement Park
//
//  Created by Darryl Robinson  on 6/1/18.
//  Copyright © 2018 Darryl Robinson . All rights reserved.
//

import UIKit
import  AudioToolbox
class PassViewController: UIViewController {

    
    @IBOutlet weak var NewPassButton: UIButton!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var PassType: UILabel!
    @IBOutlet weak var RideBenefits: UILabel!
    @IBOutlet weak var FoodDiscount: UILabel!
    @IBOutlet weak var MarchandiseDiscount: UILabel!
    @IBOutlet weak var TestResults: UILabel!
    
    
    
    
    var pass: Pass?
    
    //Audio Variables
    var accessDenied: SystemSoundID = 0
    var accessGranted: SystemSoundID = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadSounds()
        
        if let firstNameUnwrapped = pass?.firstName, let lastNameUnwrapped = pass?.lastName { Name.text = "\(firstNameUnwrapped) \(lastNameUnwrapped)"
    
    }
        if let passTypeUnwrapped = pass?.entrantType {
            PassType.text = "\(passTypeUnwrapped)"
        }
    
        if let ridesAccessUnwrapped = pass?.rideAcess {
            var phrase: String = " "
            
            for ride in ridesAccessUnwrapped {
                phrase += "\(ride.rawValue)"
            }
        RideBenefits.text = phrase
        }
        
        if let discountOnFoodUnWrapped = pass?.discountOnFood {
            FoodDiscount.text = "\(discountOnFoodUnWrapped)% Food Discount"
        }
        
        if let discountOnMerchandiseUnwrapped = pass?.discountOnMerchandise {
            MarchandiseDiscount.text = "\(discountOnMerchandiseUnwrapped)"
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createNewPass(_ sender: UIButton) {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
            if segue.identifier == "newPass" {
                let vc = segue.destination as! ViewController
                vc.pass = pass
            }
        }
    }
    
    @IBAction func testAmusementArea(_ sender: UIButton){
        //Force unwrapping the pass is ok, as we are 100% sure pass is not nill
        //sinc user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.amusementAreas) {
            TestResults.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            TestResults.backgroundColor = .red
            playWrongAnswerSound()
            
        }
        TestResults.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .amusementAreas)
        }
    
    @IBAction func testKitchenArea(_ sender: UIButton) {
        //Force unwrapping the pass is ok, as we are 100% sure pass is not nil
        //since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.kitchenAreas) {
            TestResults.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            TestResults.backgroundColor = .red
            playWrongAnswerSound()
        }
        TestResults.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .kitchenAreas)
    }
    
    @IBAction func testOfficeArea(_ sender: UIButton) {
        if pass!.areaAccess.contains(.officeAreas) {
            TestResults.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            TestResults.backgroundColor = .red
            playWrongAnswerSound()
            
        }
        TestResults.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .officeAreas)
    }
    
    @IBAction func testMaintenanceArea(_ sender: UIButton) {
        //Force unwrapping the pass is ok, as we are 100% sure pass is not nil
        //since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.maintenanceAreas) {
            TestResults.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            TestResults.backgroundColor = .red
            playWrongAnswerSound()
        }
        TestResults.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .maintenanceAreas)
    }
    @IBAction func testRideControlArea(_ sender: UIButton) {
        //Force unwrapping the pass is ok, as we are 100% sure pass is not nil
        //since user will only see this page if pass is initialized
        if pass!.areaAccess.contains(.rideControlAreas) {
            TestResults.backgroundColor = .green
            playCorrectAnswerSound()
        } else {
            TestResults.backgroundColor = .red
            playWrongAnswerSound()
        }
        TestResults.text = CheckPoint.checkPassForAreaAccess(pass: &pass!, to: .officeAreas)
        
        
    }
    @IBAction func testDiscountAccess(_ sender: UIButton) {
        TestResults.backgroundColor = .white
        if let discountOnFoodUnwrapped = pass?.discountOnFood, let discountOnMerchandiseUnwrapped = pass?.discountOnMerchandise{
            TestResults.text = "\n\(discountOnFoodUnwrapped)% Food Discount\n\(discountOnMerchandiseUnwrapped)% Merch Discount"
            playCorrectAnswerSound()
        } else {
            TestResults.text = "No Discount!"
            playWrongAnswerSound()
        }
    }
    
    
    
    
    

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //Help Functions
    //load and play sounds for correct and wrong answer
    
    func loadSounds() {
        let pathToCorrectSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let correctSoundUrl = URL(fileURLWithPath: pathToCorrectSoundFile!)
        AudioServicesCreateSystemSoundID(correctSoundUrl as CFURL, &accessGranted)
        
        
        
        let pathToIncorrect = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let wrongSoundURL = URL(fileURLWithPath: pathToIncorrect!)
        AudioServicesCreateSystemSoundID(wrongSoundURL as CFURL, &accessDenied)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(accessGranted)
    }
    
    func playWrongAnswerSound() {
        AudioServicesPlaySystemSound(accessDenied)
    }
    
    
}
