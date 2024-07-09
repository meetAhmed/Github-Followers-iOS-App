//
//  FollowersListVC.swift
//  GHFollowers
//
//  Created by Ahmed Ali on 13/06/2024.
//

import UIKit

class FollowersListVC: UIViewController {
    enum Section {
        case main
    }
    
    var username: String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower] = []
    
    @Injected var networkManager: NetworkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureCollectionView()
        getFollowers()
        configureCollectionDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

private extension FollowersListVC {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnsFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseId)
    }
    
    func createThreeColumnsFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let itemSpace: CGFloat = 10
        let availableWidth = width - (padding * 2) - (itemSpace * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureCollectionDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersCell.reuseId, for: indexPath) as? FollowersCell
            cell?.set(for: follower)
            return cell
        })
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFollowers() {
        networkManager.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let followers):
                self.followers = followers
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, actionBtnTitle: "OK")
            }
        }
    }
    
    func updateData() {
        var snapchat = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapchat.appendSections([.main])
        snapchat.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapchat, animatingDifferences: true)
        }
    }
}
