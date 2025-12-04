
import Foundation

final class ProductManager {
    
    static let shared = ProductManager()
    private init() {}
    
    private(set) var categories: [ProductCategory] = []
    
    func load() {
        categories = ProductRepository().loadFakeData()
    }
    
    func findProduct(by id: Int) -> Product? {
        for category in categories {
            if let product = category.products.first(where: { $0.id == id }) {
                return product
            }
        }
        return nil
    }
}

