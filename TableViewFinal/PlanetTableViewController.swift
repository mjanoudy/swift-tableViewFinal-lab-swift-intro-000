//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []
    
    func planetInfo() {
        planets.append(Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a mythical God.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the Universe."]))
        planets.append(Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the Solar System.", "Pieces of Mars have fallen on Earth."]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sections: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        let currentPlanet = planets[indexPath.row]
        
        cell.planetNameLabel?.text = currentPlanet.name
        cell.numberOfMoonsLabel?.text = "\(String(currentPlanet.numberOfMoons)) Moons"
        cell.numberOfDaysFullOrbitLabel?.text = "\(String(currentPlanet.fullOrbit)) Days to Full Orbit"
        cell.numberOfFactsLabel?.text = "\(String(currentPlanet.facts.count)) Facts"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "PlanetDetailsSegue" {return}
        if let dest = segue.destination as? FactTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            dest.planet = planets[(indexPath as NSIndexPath).row]
        }
    }
    
}
