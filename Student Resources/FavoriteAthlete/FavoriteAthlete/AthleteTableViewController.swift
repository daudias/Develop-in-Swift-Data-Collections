import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: Athlete?
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        } else {
            athleteToEdit = nil
        }
        return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }
    
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder)
    }
    
    @IBAction func updateAthlete(with segue: UIStoryboardSegue) {
        guard
            let athleteFormViewController = segue.source as? AthleteFormViewController,
            let athlete = athleteFormViewController.athlete
        else {
            return
        }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        } else {
            athletes.append(athlete)
        }
    }
}
