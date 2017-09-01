//
//  SideTableViewController.swift
//  PushappTest
//
//  Created by Георгий Кажуро on 31.08.17.
//  Copyright © 2017 Георгий Кажуро. All rights reserved.
//

import UIKit

// Боковое меню

class SideTableViewController: UITableViewController {

    let games = [Game(name:"Game 1", indexLocation: "game1/html/index"), Game(name:"Game 2", indexLocation: "game2/game/index")]
    let cellReuseIdentifier = "gameCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isUserInteractionEnabled = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let game = games[indexPath.item]
        
        cell.textLabel?.text = game.name
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(named: "gameIcon")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Отключаем взаимодействие с таблицей, чтобы предотвратить многократное нажатие
        tableView.isUserInteractionEnabled = false
        // Совершаем переход
        performSegue(withIdentifier: "gameSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "gameSegue" {
            guard let vc = segue.destination as? GameViewController, let indexPath = sender as? IndexPath  else { return }
            vc.game = games[indexPath.item]
        }
    }
    


}
