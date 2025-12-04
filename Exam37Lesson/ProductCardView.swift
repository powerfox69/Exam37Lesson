

import UIKit

final class ProductCardView: UIView {
    
    
    private let productId: Int
    var onTap: ((Int) -> Void)?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descLabel = UILabel()
    private let priceLabel = UILabel()
    private let stackView = UIStackView()
    
    
    
    init(product: Product) {
        self.productId = product.id
        super.init(frame: .zero)
        setupView()
        configure(with: product)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Setup UI

private extension ProductCardView {
    
    func setupView() {
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        layer.cornerRadius = 16
        
        setupImageView()
        setupLabels()
        setupStack()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTapped)))
    }
    
    func setupImageView() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLabels() {
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        descLabel.font = .systemFont(ofSize: 14)
        descLabel.numberOfLines = 2
        
        priceLabel.font = .boldSystemFont(ofSize: 18)
    }
    
    func setupStack() {
        let textStack = UIStackView(arrangedSubviews: [titleLabel, descLabel, priceLabel])
        textStack.axis = .vertical
        textStack.spacing = 6
        
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.alignment = .center
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textStack)
        
        addSubview(stackView)
        setupLayout()
    }
}


// MARK: - Configure

extension ProductCardView {
    func configure(with product: Product) {
        imageView.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
        descLabel.text = product.description
        priceLabel.text = "\(product.price)₽"
    }
}


// MARK: - Layout

private extension ProductCardView {
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            widthAnchor.constraint(equalToConstant: 270),
            heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}


// MARK: - Actions

private extension ProductCardView {
    @objc func cardTapped() {
        onTap?(productId)
    }
}

