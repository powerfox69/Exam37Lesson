import Foundation

final class ProductRepository {
    
    func loadFakeData() -> [ProductCategory] {
        return [
            ProductCategory(
                title: "Grains and Bread",
                products: [
                    Product(id: 1,
                            title: "Bread",
                            description: "Freshly baked bread with a golden crust and soft texture.",
                            price: 140,
                            imageName: "bread"),
                    
                    Product(id: 4,
                            title: "Baguette",
                            description: "Classic French baguette with crispy crust.",
                            price: 95,
                            imageName: "baguette"),
                    
                    Product(id: 5,
                            title: "Whole Grain Bread",
                            description: "Healthy bread rich in fiber and minerals.",
                            price: 160,
                            imageName: "wholegrain")
                ]
            ),
            
            ProductCategory(
                title: "Meat and Poultry",
                products: [
                    Product(id: 2,
                            title: "Chicken",
                            description: "Skinless chicken fillet, rich in protein and easy to digest.",
                            price: 250,
                            imageName: "chicken"),
                    
                    Product(id: 6,
                            title: "Beef",
                            description: "Premium beef rich in iron and protein.",
                            price: 390,
                            imageName: "beef"),
                    
                    Product(id: 7,
                            title: "Turkey",
                            description: "Lean turkey meat perfect for healthy meals.",
                            price: 320,
                            imageName: "turkey")
                ]
            ),
            
            ProductCategory(
                title: "Dairy Products",
                products: [
                    Product(id: 3,
                            title: "Milk",
                            description: "Fresh and nutritious dairy product, rich in calcium and vitamin D.",
                            price: 110,
                            imageName: "milk"),
                    
                    Product(id: 8,
                            title: "Cheese",
                            description: "Aged cheese with a rich and creamy flavor.",
                            price: 270,
                            imageName: "cheese"),
                    
                    Product(id: 9,
                            title: "Yogurt",
                            description: "Natural yogurt without sugar or additives.",
                            price: 85,
                            imageName: "yogurt")
                ]
            )
        ]
    }
}

