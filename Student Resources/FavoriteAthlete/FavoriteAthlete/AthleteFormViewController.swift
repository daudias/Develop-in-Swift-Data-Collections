//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Dias on 12/10/20.
//

import UIKit

class AthleteFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?) {
        super.init(coder: coder)
        self.athlete = athlete
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    func updateView() {
        guard let athlete = athlete else { return }
        nameTextField.text = athlete.name
        ageTextField.text = String(athlete.age)
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard
            let name = nameTextField.text,
            let ageString = ageTextField.text,
            let age = Int(ageString),
            let league = leagueTextField.text,
            let team = teamTextField.text
        else { return }
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "toTable", sender: self)
    }
}
