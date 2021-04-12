//
//  SearchMoviesVC.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

final class SearchMoviesVC: UIViewController {
  var searchText = ""
  var presenter: SearchMoviesViewOutput? 
  private var movies = [Movie]()
  lazy var searchController: UISearchController = {
    let controller = UISearchController(searchResultsController: nil)
    controller.obscuresBackgroundDuringPresentation = false
    controller.searchResultsUpdater = nil
    controller.searchBar.placeholder = Constants.SearchPlaceholder
    controller.searchBar.delegate = self
    return controller
  }()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.registerCellWith(nibName: SearchItemCell.reuseId)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  //MARK: ViewController Lifecycle.
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.getRecentAccessedData()
    setupViews()
  }
  
  private func setupViews() {
    title = "Search"
    view.addSubview(tableView)
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    navigationItem.searchController = searchController
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.hidesSearchBarWhenScrolling = false
  }
}

extension SearchMoviesVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SearchItemCell.reuseId, for: indexPath) as? SearchItemCell
    cell?.update(movie: movies[indexPath.row])
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    StorageUtils.shared.storeRecent(movie: movies[indexPath.item])
    searchController.dismiss(animated: true)
    presenter?.showDetails(movie: movies[indexPath.item])
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if searchText.isEmpty {
      return "Recently visited"
    } else {
      return nil
    }
  }
}


extension SearchMoviesVC: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    self.searchText = searchText
    if searchText.isEmpty {
      presenter?.getRecentAccessedData()
    } else {
      presenter?.search(text: searchText)
    }
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchText.removeAll()
    presenter?.getRecentAccessedData()
    
  }
}

extension SearchMoviesVC: SearchMoviesViewInput {
  func recentAccessed(movies: [Movie]) {
    self.movies = movies
    tableView.beginUpdates()
    tableView.reloadSections(IndexSet(arrayLiteral: 0), with: .none)
    tableView.endUpdates()
  }
  
  func searched(movies: [Movie]) {
    self.movies = movies
    tableView.beginUpdates()
    tableView.reloadSections(IndexSet(arrayLiteral: 0), with: .none)
    tableView.endUpdates()
  }
}
