enum Rating: String {
    case OK = "* * *"
    case GOOD = "* * * *"
    case BEST = "* * * * *"
}

struct Flavor {
    let name: String
    let rating: Rating
}


let favoriteFlavor = Flavor(name: "Vanilla", rating: .BEST )
let secondFavorite = Flavor(name: "Cheesecake", rating: .BEST)
let reallyGreatIceCream = Flavor(name: "Oreo", rating: .BEST)

enum Size: Double {
    case small = 3.99
    case medium = 5.99
    case large = 7.99
}

struct Cone {
    let flavor: String
    let toppings: String
    
    func eat() {
        print("Mmmm! I love \(flavor)")
    }
}

let cone1 = Cone(flavor: "Plain", toppings: "none")
let cone2 = Cone(flavor: "Waffle", toppings: "Toasted waffles")
let rainboowCone = Cone(flavor: "Rainbow", toppings: "Rainbow sprinkles")

struct IceCream {
    let flavor: Flavor
    let cone: Cone
    let size: Size
}

let VanillaCream = IceCream(flavor: favoriteFlavor, cone: rainboowCone, size: .medium)
let CheeseCakeIce = IceCream(flavor: secondFavorite, cone: cone2, size: .medium)
let OreoIceCream = IceCream(flavor: reallyGreatIceCream, cone: cone1, size: .medium)
let menu :[IceCream] = [VanillaCream, CheeseCakeIce, OreoIceCream]

class IceCreamShop {
    let menu: [IceCream]
    var totalSales: Double
    
    init(menu: [IceCream]) {
        self.menu = menu
        self.totalSales = 0.00
    }
}



