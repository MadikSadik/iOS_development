import Foundation

//======================
// Part 1

// 1.1

struct Product {
    let id: String
    let name: String
    let price: Double
    let category: Category
    let description: String
    var stockQuantity: Int // Bonus part 3
    
    enum Category{
        case electronic, clothing, food, book
    }

    var displayPrice: String{
        "$\(price)"
    }
}


// --------------------
// 1.2

struct CartItem {
    let product: Product
    var quantity: UInt
    
    var subtotal: Double {
        product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0 {
            quantity = UInt(newQuantity)
        }
    }
    
    mutating func increaseQuantity(by amount: Int) {
        if amount > 0{
            quantity += UInt(amount)
        }
    }
}


//=======================
//Part 2

class ShoppingCart {
    private(set) var items: [CartItem]
    var discountCode: String?
    
    init() {
        items = []
        discountCode = nil
    }
    
    func addItem(someproduct: Product, somequantity: Int) -> Bool{
        guard somequantity > 0 else {return false}
        
        guard someproduct.stockQuantity >= somequantity else {
          print("Not enough quantity for \(someproduct.name)")
          return false
        }
        
        for i in 0..<items.count {
            if items[i].product.id == someproduct.id {
                var existingItem = items[i]
                existingItem.increaseQuantity(by: somequantity)
                items[i] = existingItem
                return true
            }
        }
        let newItem = CartItem(product: someproduct, quantity: UInt(somequantity))
        items.append(newItem)
        return true
    }
    
    
    func removeItem(productId: String) {
        for i in 0..<items.count {
            if items[i].product.id == productId{
                items.remove(at: i)
                break
            }
        }
    }
    
    func updateItemQuantity(productId: String, quantity: Int){
        guard let index = items.firstIndex(where: {$0.product.id == productId})
        else {
            print("Item not found")
            return
        }
        
        if quantity > 0 {
            var theItem = items[index]
            theItem.updateQuantity(quantity)
            items[index] = theItem
        }
        else{
            items.remove(at: index)
        }
    }
    
    
    func clearCart() {
        items.removeAll()
    }
    
        //var part
    
    var subtotal: Double {
        var total = 0.0
        for item in items {
            total += item.subtotal
        }
        return total
    }
    
    var discountAmount: Double {
        if discountCode == "SAVE10"{
            return subtotal * 0.1
        }
        else if discountCode == "SAVE20"{
            return subtotal * 0.2
        }
        else{return 0.0}
        
    }
    
    var total: Double {
        return subtotal - discountAmount
    }
    
    var itemCount: Int {
        var counting: Int = 0
        for valuable in items{
            counting += Int(valuable.quantity)
        }
        return counting
    }
    
    var isEmpty: Bool {
        if itemCount == 0 {return true}
        else {return false}
    }
    
}


//======================
//Part 3

//3.1
struct Address {
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        """
        Destination info:
        Country: \(country)
        City: \(city)
        Street: \(street)
        Zip code: \(zipCode)
        """
    }
}

//3.2
struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address){
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
        var count = 0
        for i in items{
            count += Int(i.quantity)
        }
        return count
    }
}


//========================
//Part 4

//1
let laptop = Product(id: "1", name: "MacBook", price: 8000, category: .electronic, description: "Apple laptop with m chip", stockQuantity: 10)
let book = Product(id: "2", name: "Chainsaw-Man", price: 20, category: .book, description: "Japan manga created by Tatsuki Fujimoto", stockQuantity: 50)
let headphones = Product(id: "3", name: "Airpods MAX", price: 550, category: .electronic, description: "Headphones by apple with strong sound isolation", stockQuantity: 5)

//2
let cart = ShoppingCart() // Changed because compilater crying about it
if cart.addItem(someproduct: laptop, somequantity: 1) {
    print("Added to cart")
} else {
    print("Not enough stock")
}
if cart.addItem(someproduct: book, somequantity: 2) {
    print("Added to cart")
} else {
    print("Not enough stock")
}
print("Total items in cart:")
print(cart.itemCount)

//3
if cart.addItem(someproduct: laptop, somequantity: 1) {
    print("Added to cart")
} else {
    print("Not enough stock")
}
print("\nAdded another laptop:")
print(cart.itemCount)
for item in cart.items {
    print("\(item.product.name): \(item.quantity)")
}

//4
print("\nSubtotal: \(cart.subtotal)")
print("Item count: \(cart.itemCount)")

//5
cart.discountCode = "SAVE10"
print("\nTotal with discount: \(cart.total)")

//6
cart.removeItem(productId: book.id)
print("\n Total amount after deleteing books: \(cart.itemCount)")
for item in cart.items {
    print("\(item.product.name): \(item.quantity)")
}

//7
func modifyCart(_ cart: ShoppingCart) {
    if cart.addItem(someproduct: headphones, somequantity: 1) {
    print("Added to cart")
  } else {
    print("Not enough stock")
  }

}
modifyCart(cart)
print(" ")
for item in cart.items {
    print("\(item.product.name): \(item.quantity)")
}

//8
let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)
print("\nItem-1 quantity: \(item1.quantity)")
print("Item-2 quantity: \(item2.quantity)")


//9
let address = Address(street: "Baker street", city: "London", zipCode: "UB8 678", country: "UK")
let order = Order(from: cart, shippingAddress: address)

print(order.shippingAddress.formattedAddress)

//10
cart.clearCart()

print("\nOrder items count: \(order.itemCount)")
print("Cart items count: \(cart.itemCount)")


//====================
//Bonus Challange

//1
class User {
  let userId: String
  let name: String
  let email: String
  private(set) var orderHistory: [Order]
  
  init(userId: String, name: String, email: String) {
    self.userId = userId
    self.name = name
    self.email = email
    self.orderHistory = []
  }
  
  func placeOrder(_ order: Order) {
    orderHistory.append(order)
  }
  
  var totalSpent: Double {
    var total = 0.0
    for order in orderHistory{
      total += order.total
    }
    return total
  }
  
}


//2
enum DiscountType {
  case percentage(Double)
  case fixedAmount(Double)
  case buyXGetY(buy: Int, get: Int)
}



let user = User(userId: "U001", name: "Madiyar Bekmurat", email: "m_bekmurat@kbtu.kz")

user.placeOrder(order)
print("\n=== User Order History ===")
print("User: \(user.name)")
print("Orders placed: \(user.orderHistory.count)")
print("Total spent so far: \(user.totalSpent)")


let address2 = Address(street: "Nazarbayev Ave", city: "Almaty", zipCode: "050000", country: "Kazakhstan")

let cart2 = ShoppingCart()
cart2.addItem(someproduct: laptop, somequantity: 5)
let secondOrder = Order(from: cart2, shippingAddress: address2)
user.placeOrder(secondOrder)
print("\nAfter placing a second order:")
print("Orders placed: \(user.orderHistory.count)")
print("Total spent so far: \(user.totalSpent)")

