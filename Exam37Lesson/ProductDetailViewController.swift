

import UIKit

final class ProductDetailViewController: UIViewController {
    
    private let productId: Int
    private var product: Product?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descLabel = UILabel()
    private let priceLabel = UILabel()
    private let stackView = UIStackView()
    
    init(productId: Int) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductDetailViewController()
    }
}

// MARK: - Setup view
private extension ProductDetailViewController {
    
    func setupProductDetailViewController() {
        view.backgroundColor = .white
        
        loadData()
        
        setupStackView()
        setupImageView()
        setupTitleLabel()
        setupDescLabel()
        setupPriceLabel()
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
        stackView.addArrangedSubview(priceLabel)
        
        view.addSubview(stackView)
        
        setupLayout()
    }
    
    func loadData() {
        product = ProductManager.shared.findProduct(by: productId)
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
    }
    
    func setupImageView() {
        guard let product = product else { return }
        imageView.image = UIImage(named: product.imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func setupTitleLabel() {
        guard let product = product else { return }
        titleLabel.text = product.title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
    }
    
    func setupDescLabel() {
        guard let product = product else { return }
        descLabel.text = product.description
        descLabel.font = .systemFont(ofSize: 16)
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .left
    }
    
    func setupPriceLabel() {
        guard let product = product else { return }
        priceLabel.text = "\(product.price) ₽"
        priceLabel.font = .boldSystemFont(ofSize: 22)
        priceLabel.textAlignment = .center
    }
}

// MARK: - Setup Layout
private extension ProductDetailViewController {
    
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

