

import UIKit

final class ProductsViewController: UITableViewController {
    
    private let manager = ProductManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup UI
private extension ProductsViewController {
    
    func setupView() {
        view.backgroundColor = .white
        setupTableView()
        loadData()
    }
    
    func setupTableView() {
        tableView.register(
            ProductTableViewCell.self,
            forCellReuseIdentifier: ProductTableViewCell.identifier
        )
        tableView.separatorStyle = .none
    }
    
    func loadData() {
        manager.load()
        tableView.reloadData()
    }
}

// MARK: - TableView DataSource
extension ProductsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.categories.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.identifier,
            for: indexPath
        ) as! ProductTableViewCell
        
        let category = manager.categories[indexPath.row]
        cell.configure(with: category)
        cell.onProductTap = { [weak self] id in
            self?.openDetail(id: id)
        }
        return cell
    }
}

// MARK: - Navigation
private extension ProductsViewController {
    
    func openDetail(id: Int) {
        let detailVC = ProductDetailViewController(productId: id)
        detailVC.modalPresentationStyle = .automatic
        present(detailVC, animated: true)
    }
}

