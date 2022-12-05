//
//  ViewController.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import UIKit

protocol RestaurantListViewProtocol: AnyObject {
    func updateUI()
}

class RestaurantListView: UITableViewController {
    
    var presenter: RestaurantListPresenterProtocol
    
    init(presenter: RestaurantListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter.didLoad()
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Restaurants"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
        tableView.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "\(RestaurantTableViewCell.self)")
    }

}

extension RestaurantListView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(RestaurantTableViewCell.self)", for: indexPath) as? RestaurantTableViewCell else { return UITableViewCell()}
        cell.setup(with: presenter.restaurants[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension RestaurantListView: RestaurantListViewProtocol {
    
    func updateUI() {
        if isViewLoaded {
            tableView.reloadData()
        }
    }
    
}


