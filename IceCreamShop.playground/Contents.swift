struct Flavor {
    let name: String
    let rating: Int
    
}

enum Size: Double {
    case small = 3.99
    case medium = 5.99
    case large = 7.99
}

struct Cone {
    let flavor: String
    let topping: String
    let size : Size
    
    func eat() {
        print("Mmmm! I love \(flavor)")
    }
}

struct IceCream {
    let flavor: Flavor
    let cone: Cone
    let size: Size
}

class IceCreamShop {
    let menu: [IceCream]
    var totalSales: Double
    
    init(menu: [IceCream], totalSales: Double) {
        self.menu = menu
        self.totalSales = totalSales
    }
}
