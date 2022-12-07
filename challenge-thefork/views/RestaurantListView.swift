//
//  ViewController.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import UIKit

protocol RestaurantListViewProtocol: AnyObject {
    func updateUI()
    func showSpinner()
    func hideSpinner()
    func showFetchError()
}

class RestaurantListView: UITableViewController {
    
    var presenter: RestaurantListPresenterProtocol
    
    let spinner = UIActivityIndicatorView()
    
    init(presenter: RestaurantListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSpinner()
        setupView()
        presenter.didLoad()
    }
    
    func addSpinner() {
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            spinner.startAnimating()
            spinner.translatesAutoresizingMaskIntoConstraints = false
            window.addSubview(spinner)
            spinner.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
            hideSpinner()
        }
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = LocalizedString.restaurantListTitle
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        
        tableView.register(RestaurantCellView.self, forCellReuseIdentifier: "\(RestaurantCellView.self)")
        
        let sortButton = UIBarButtonItem(image: AppImages.sort, style: .plain, target: self, action: #selector(handleSortButton))
        sortButton.tintColor = .black
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc func handleSortButton() {
        showSortAlert()
    }
    
    func showSortAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: LocalizedString.restaurantListSortByName, style: .default, handler:{ (UIAlertAction)in
            self.presenter.didTapSortByName()
        }))
        
        alert.addAction(UIAlertAction(title: LocalizedString.restaurantListSortByRating, style: .default, handler:{ (UIAlertAction)in
            self.presenter.didTapSortByRating()
        }))
        
        alert.addAction(UIAlertAction(title: LocalizedString.restaurantListSortCancel, style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

}

extension RestaurantListView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(RestaurantCellView.self)", for: indexPath) as? RestaurantCellView else { return UITableViewCell()}
        cell.delegate = self
        cell.setup(with: presenter.restaurants[indexPath.row])
        return cell
    }
    
}

extension RestaurantListView: RestaurantCellViewDelegate {
    func didTapHeart(restaurant: MinifiedRestaurant) {
        presenter.didTapHeart(restaurant.uuid)
    }
}

extension RestaurantListView: RestaurantListViewProtocol {
    func updateUI() {
        if isViewLoaded {
            tableView.reloadData()
        }
    }
    
    func showSpinner() {
        spinner.isHidden = false
    }

    func hideSpinner() {
        spinner.isHidden = true
    }
    
    func showFetchError() {
        let alert = UIAlertController(title: LocalizedString.restaurantListAlertErrorTitle, message: LocalizedString.restaurantListAlertErrorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocalizedString.restaurantListAlertErrorTryAgain, style: UIAlertAction.Style.default, handler: { _ in
            self.presenter.fetchRestaurants()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
