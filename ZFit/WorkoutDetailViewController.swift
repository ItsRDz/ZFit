//
//  WorkoutDetailViewController.swift
//  ZFit
//
//  Created by Richard Depaz on 4/20/2017.
//  Copyright © 2017 SectorZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class WorkoutDetailViewController: UIViewController {
    
    var name = ""
    var execution = ""
    var preparation = ""
    var imageName = ""
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var executionLabel: UILabel!
    @IBOutlet var preparationLabel: UILabel!
    @IBOutlet var workoutImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(name)"
        executionLabel.text = "\(execution)"
        preparationLabel.text = "\(preparation)"
        workoutImage.image = UIImage(named: "\(imageName)")
        
        executionLabel.sizeToFit()
        preparationLabel.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutAction(sender: AnyObject) {
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
}
