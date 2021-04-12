//
//  MovieDetailsVC.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 12/04/21.
//

import UIKit

class MovieDetailsVC: UIViewController {
  var presenter: MovieDetailsViewOutput!
  private var movieDetailsViewModel: MovieDetailsViewModel? {
    didSet {
      guard let movieDetailsViewModel = movieDetailsViewModel else {
        return
      }
      title = movieDetailsViewModel.movie?.title
    }
  }
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: view.bounds)
    tableView.sectionHeaderHeight = 44
    tableView.dataSource = self
    tableView.delegate = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.registerCellWith(nibName: MoviePosterCell.reuseId)
    tableView.registerCellWith(nibName: SynopsisCell.reuseId)
    tableView.registerCellWith(nibName: CollectionCell.reuseId)
    return tableView
  }()
  
  override func loadView() {
    super.loadView()
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    presenter.getMovieDetails()
  }
  
  private func setupViews() {
    view.addSubview(tableView)
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}

extension MovieDetailsVC: MovieDetailsViewInput {
  func insertMovies(with model: MoviesBase) {
    
  }
  
  func reloadView(at index: Int, viewModel: MovieDetailsViewModel) {
      movieDetailsViewModel = viewModel
      tableView.beginUpdates()
      tableView.reloadSections(IndexSet(arrayLiteral: index), with: .none)
      tableView.endUpdates()
  }
  
  func showAlertOnFailure(title: String, msg: String) {
    
  }
}

extension MovieDetailsVC: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return MovieDetailsType.allCases.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 2:
      if let value = movieDetailsViewModel?.credits?.cast, value.count > 0 {
        return MovieDetailsType.allCases[section].rawValue
      } else {
        return nil
      }
      
    case 3:
      if let value = movieDetailsViewModel?.reviews, value.count > 0 {
        return MovieDetailsType.allCases[section].rawValue
      } else {
        return nil
      }
      
    case 4:
      if let value = movieDetailsViewModel?.similarMovies, value.count > 0 {
        return MovieDetailsType.allCases[section].rawValue
      } else {
        return nil
      }
      
    default:
      return MovieDetailsType.allCases[section].rawValue
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0://Poster
      let cell = tableView.dequeueReusableCell(withIdentifier: MoviePosterCell.reuseId, for: indexPath) as? MoviePosterCell
      if let value = movieDetailsViewModel?.synopsis?.backdrop_path {
        cell?.setPoster(url: value)
      }
      return cell!
      
    case 1://Synopsis
      let cell = tableView.dequeueReusableCell(withIdentifier: SynopsisCell.reuseId, for: indexPath) as? SynopsisCell
      if let value = movieDetailsViewModel?.synopsis {
        cell?.setSynopsis(data: value)
      }
      return cell!
      
    case 2://Cast
      let cell = tableView.dequeueReusableCell(withIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell
      if let value = movieDetailsViewModel?.credits?.cast {
        cell?.setData(for: value)
      }
      return cell!
      
    case 3://Reviews
      let cell = tableView.dequeueReusableCell(withIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell
      if let value = movieDetailsViewModel?.reviews {
        cell?.setData(for: value)
      }
      return cell!
      
    case 4://Similar movies
      let cell = tableView.dequeueReusableCell(withIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell
      if let value = movieDetailsViewModel?.similarMovies {
        cell?.setData(for: value, cellDelegate: self)
      }
      return cell!
      
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: CollectionCell.reuseId, for: indexPath) as? CollectionCell
      return cell!
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return view.bounds.height * 0.3
      
    case 2:
      if let value = movieDetailsViewModel?.credits?.cast, value.count > 0 {
        return 184
      } else {
        return 0
      }
      
    case 3:
      if let value = movieDetailsViewModel?.reviews, value.count > 0 {
        return 154
      } else {
        return 0
      }
      
    case 4:
      if let value = movieDetailsViewModel?.similarMovies, value.count > 0 {
        return Constants.getMovieCellSize().height
      } else {
        return 0
      }
      
    default:
      if let value = movieDetailsViewModel?.synopsis?.overview, value.count > 0 {
        return UITableView.automaticDimension
      } else {
        return 0
      }
    }
  }
}

extension MovieDetailsVC: CollectionCellProtocol {
  func didSelect(index: Int) {
    presenter.didSelectMovie(at: index)
  }
}
