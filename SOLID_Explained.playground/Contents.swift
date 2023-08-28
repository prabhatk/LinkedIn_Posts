import Foundation
//SOLID PRINCIPAL WITH SINGLE EXAMPLE
//1. SRP Single Responsibility: Manage order details
// Putting single reposibility to maintain the order item array
class Order {
    var orderItems: [OrderItem] = []
    
    func addOrderItem(item: OrderItem) {
        orderItems.append(item)
    }
    
    func calculateTotalPrice() -> Double {
        return orderItems.reduce(0.0) { $0 + $1.calculatePrice() }
    }
}

// Single Responsibility: Represent an item in an order
class OrderItem {
    var product: Product
    var quantity: Int
    
    init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
    
    func calculatePrice() -> Double {
        return product.price * Double(quantity)
    }
}

extension OrderItem : DiscountApplicable {
    func applyDiscount(strategy: DiscountStrategy) -> Double {
        let discount = strategy.calculateDiscount(for: self)
        return discount
    }
}
// Single Responsibility: Represent a product
struct Product {
    var product_id: String
    var name: String
    var price: Double
}

//2.0 OCP  Open/Closed: Introduce new discount types without changing existing code
protocol DiscountStrategy {
    func calculateDiscount(for item: OrderItem) -> Double
}

struct NoDiscountStrategy: DiscountStrategy {
    func calculateDiscount(for item: OrderItem) -> Double {
        return 0.0
    }
}

struct PercentageDiscountStrategy: DiscountStrategy {
    let percentage: Double
    
    func calculateDiscount(for item: OrderItem) -> Double {
        return item.calculatePrice() * percentage / 100
    }
}

//3. LSP // Liskov Substitution: All discount strategies are substitutable
let noDiscount = NoDiscountStrategy()
let tenPercentDiscount = PercentageDiscountStrategy(percentage: 10)

let discountStrategies: [DiscountStrategy] = [noDiscount, tenPercentDiscount]

//4. ISP // Interface Segregation: Separate interfaces for different concerns
protocol OrderCalculator {
    func calculateTotalPrice() -> Double
}

protocol DiscountApplicable {
    func applyDiscount(strategy: DiscountStrategy) -> Double
}

//5. DIP // Dependency Inversion: High-level Order depends on abstractions
class OrderService: OrderCalculator, DiscountApplicable {
    private var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    func calculateTotalPrice() -> Double {
        return order.calculateTotalPrice()
    }
    
    func applyDiscount(strategy: DiscountStrategy) -> Double{
        return order.orderItems.reduce(0.0) { $0 + $1.applyDiscount(strategy: strategy)}
    }
}

var order = Order()
order.addOrderItem(item: OrderItem(product: Product(product_id: "apl", name: "Apple", price: 10.0), quantity: 1))
order.addOrderItem(item: OrderItem(product: Product(product_id: "org", name: "Orange", price: 8.0), quantity: 1))
order.addOrderItem(item: OrderItem(product: Product(product_id: "kwi", name: "Kiwi", price: 12.0), quantity: 5))


let orderService = OrderService(order: order)
print("calculated price $\(orderService.calculateTotalPrice())")
print("discount Applied $\(orderService.applyDiscount(strategy: tenPercentDiscount))")
print("final price will be $\(orderService.calculateTotalPrice() - orderService.applyDiscount(strategy: tenPercentDiscount))")
