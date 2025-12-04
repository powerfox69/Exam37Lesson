

import UIKit

final class ProductTableViewCell: UITableViewCell {
    
    static let identifier = "ProductTableViewCell"
    
    private let titleLabel = UILabel()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    var onProductTap: ((Int) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupViews()
        setupLayout()
        setupStyles()
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Setup UI
private extension ProductTableViewCell {
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    func setupStyles() {
        titleLabel.font = .boldSystemFont(ofSize: 22)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        stackView.axis = .horizontal
        stackView.spacing = 16
    }

    func setupLayout() {
        [titleLabel, scrollView, stackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 170),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16)
        ])
    }
}

// MARK: - Configure
extension ProductTableViewCell {
    
    func configure(with category: ProductCategory) {
        titleLabel.text = category.title
        
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        category.products.forEach { product in
            let card = ProductCardView(product: product)
            card.onTap = { [weak self] id in
                self?.onProductTap?(id)
            }
            stackView.addArrangedSubview(card)
        }
    }
}

