//
//  HomeViewController.swift
//  ZFit
//
//  Created by Richard Depaz on 4/20/2017.
//  Copyright © 2017 SectorZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    var name = ""
    var execution = ""
    var preparation = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "DumbbellBicepCurls" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Dumbbell Bicep Curls"
                sh.execution = "Lower sled by fixing hips and knees. Return by extending."
                sh.preparation = "Sit on the machine with your back on the padded support. Place feet on platform and extend your hips and knees. Release dock lever and grasp the support handles on sides."
                sh.imageName = "dumbbell_bicep_curls"
        }
        else if segue.identifier == "CableBicepsCrossover" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Cable Biceps Crossover"
                sh.execution = "Bend your arms at the elbow, crossing your arms to bring your hands up towards opposite shoulder. Lower to start position and repeat."
                sh.preparation = "Stand with your feet slightly wider than shoulder width apart. Grab the handles with both hands, palms facing forward and arms straight. Step forward, creating tension in the cables."
                sh.imageName = "cable_biceps_crossover"
        }
        else if segue.identifier == "BodyweightPullUp" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Bodyweight Pull Up"
                sh.execution = "Exhale as you pull yourself up until your neck reaches the height of your hands. Inhale as you lower your body until your arms and shoulders are extended and repeat."
                sh.preparation = "Hold on to the pull up bar using the neutral grip handles (parallel bars) and grip them with your palms facing each other. Hang there with your body extended."
                sh.imageName = "bodyweight_pull_up"
        }
        else if segue.identifier == "LegPressMachine" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Leg Press Machine"
                sh.execution = "Lower sled by flexing hips and knees. Return by extending."
                sh.preparation = "Sit on the machine with your back on the padded support. Place feet on platform and extend your hips and knees. Release dock lever and grasp the support handles on the side."
                sh.imageName = "leg_press_machine"
        }
        else if segue.identifier == "BarbellSquat" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Barbell Squat"
                sh.execution = "Squat down by bending your hips back and letting your knees bend forward, keeping your back straight and knees pointed in the same direction as your feet. Descend until thighs are just parallel to floor. Extend your knees and hips until your legs are straight. Return and repeat."
                sh.preparation = "Load your desired weight on a barbell that is on a weight rack, about chest high. Position the bar on your shoulders, step away from the rack and stand with your hands supporting the bar and feet shoulder width apart."
                sh.imageName = "barbell_squat"
        }
        else if segue.identifier == "BarbellForwardLunge" {
            let sh = (segue.destination) as!WorkoutDetailViewController
                sh.name = "Barbell Forward Lunge"
                sh.execution = "Lunge forward with your right leg. Lower your body by flexing your knee and hip in front, until your left knee is almost in contact with floor. Return and repeat by alternating lunge with opposite leg."
                sh.preparation = "Load your desired weight on a barbell that is on a weight rack, about chest high. Place the barbell on your shoulders with your hands grabbing and supporting it. Stand with your feet shoulder width apart."
                sh.imageName = "barbell_forward_lunge"
        }

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
