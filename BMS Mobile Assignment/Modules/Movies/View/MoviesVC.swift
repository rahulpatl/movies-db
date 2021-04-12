//
//  ViewController.swift
//  BMS Mobile Assignment
//
//  Created by Rahul Patil on 10/04/21.
//

import UIKit

class MoviesVC: UIViewController {
  private var list = [Movie]()
  private var nextPage = 1
  private var baseModel: MoviesBase? {
    didSet {
      if let pages = baseModel?.total_pages, pages != 0 {
        isNextRequestEnable = true
        nextPage += 1
      }
    }
  }
  private var isNextRequestEnable = false
  
  var presenter: MoviesViewOutput!
  
  lazy var collectionViewLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    let spacing = Constants.defaultSpacing
    layout.itemSize = Constants.getMovieCellSize()
    layout.minimumInteritemSpacing = spacing
    layout.minimumLineSpacing = spacing
    layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    return layout
  }()
  
  lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: MovieListCell.reuseId, bundle: nil), forCellWithReuseIdentifier: MovieListCell.reuseId)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  //MARK: ViewController Lifecycle.
  override func loadView() {
    view = UIView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    presenter.getMovies(for: nextPage)
  }
  
  private func setupViews() {
    view.addSubview(collectionView)
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    let searchButton = UIBarButtonItem(image: UIImage(with: .SEARCH), style: .plain, target: self, action: #selector(searchTapped))
    navigationItem.rightBarButtonItem = searchButton
  }
  
  @objc private func searchTapped() {
    presenter.showSearchController(for: list)
  }
}

extension MoviesVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.reuseId, for: indexPath) as? MovieListCell
    cell?.updateMovie(of: list[indexPath.item])
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter.didSelect(movie: list[indexPath.item])
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if (list.count - 3) < indexPath.item, isNextRequestEnable {
      isNextRequestEnable = false
      presenter.getMovies(for: nextPage)
    }
    print(list[indexPath.item].title)
  }
  
  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    print(list[indexPath.item].title)
  }
}

extension MoviesVC: MoviesViewInput {
  func insertMovies(with model: MoviesBase) {
    let currentCount = list.count
    let totalCount = currentCount + model.results!.count
    let indexPaths = (currentCount..<totalCount).map({
      return IndexPath(item: $0, section: 0)
    })
    baseModel = model
    DispatchQueue.main.async { [weak self] in
      guard let self = self else {return}
      self.collectionView.performBatchUpdates({
        self.list.append(contentsOf: model.results!)
        self.collectionView.insertItems(at: indexPaths)
      })
    }
  }
  
  func showAlertOnFailure(title: String, msg: String) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let okayAction = UIAlertAction(title: "Okay", style: .cancel) { (_) in}
    alert.addAction(okayAction)
    present(alert, animated: true)
  }
}
