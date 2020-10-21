enum Rating: String {
    case OK = "* * *"
    case GOOD = "* * * *"
    case BEST = "* * * * *"
}
enum Toppings: String {
    case none
    case sprinkles
    case hotFudge
    case cookieDough
    case whippedCream
}



struct Flavor {
    let name: String
    let rating: Rating
}

let orangeCreamsicle = Flavor(name: "Creamsicle", rating: .BEST)
let favoriteFlavor = Flavor(name: "Vanilla", rating: .GOOD )
let secondFavorite = Flavor(name: "Cheesecake", rating: .GOOD)
let reallyGreatIceCream = Flavor(name: "Oreo", rating: .GOOD)

enum Size: Double {
    case small = 3.99
    case medium = 5.99
    case large = 7.99
}

struct Cone {
    let flavor: String
    
    func eat() {
        print("Mmmm! I love \(flavor)")
    }
}

let cone1 = Cone(flavor: "Plain")
let cone2 = Cone(flavor: "Waffle")
let rainbowCone = Cone(flavor: "Rainbow")

struct IceCream {
    let flavor: Flavor
    let cone: Cone
    let size: Size
    let toppings: Toppings
}

let VanillaCream = IceCream(flavor: favoriteFlavor, cone: rainbowCone, size: .medium, toppings: .sprinkles)
let CheeseCakeIce = IceCream(flavor: secondFavorite, cone: cone2, size: .medium, toppings: .cookieDough)
let OreoIceCream = IceCream(flavor: reallyGreatIceCream, cone: cone1, size: .medium, toppings: .whippedCream)
let menu :[IceCream] = [VanillaCream, CheeseCakeIce, OreoIceCream]

class IceCreamShop {
    let menu: [IceCream]
    var totalSales: Double
    
    init(menu: [IceCream]) {
        self.menu = menu
        self.totalSales = 0.00
    }
}
let myCreamsicles = IceCreamShop(menu: menu)
func listTopFlavors() {
    
    var index = 1
    
    for flavor in menu {
        if flavor.flavor.rating == .BEST {
            print("Top Flavor #\(index): \(flavor.flavor.name)")
            index += 1
        }
    }
}

listTopFlavors()
var toppingsPrice = 0.0
func addToppingsToPrice(toppings: IceCream) -> Double {
    switch toppings.toppings {
    case .cookieDough, .sprinkles:
        return toppingsPrice = 0.50
    case .hotFudge, .whippedCream:
        return toppingsPrice = 0.99
    default:
        return toppingsPrice = 0.0
    }
}

func orderCone(order: IceCream) -> IceCream? {
    let iceCreamOrder = order
    
    if iceCreamOrder.toppings == .none {
        myCreamsicles.totalSales += (iceCreamOrder.size.rawValue)
        print("You ordered a \(iceCreamOrder.size) \(iceCreamOrder.flavor.name). Your total is \(myCreamsicles.totalSales)")
    } else {
        myCreamsicles.totalSales += (iceCreamOrder.size.rawValue + addToppingsToPrice(toppings: iceCreamOrder))
        print("You ordered a \(iceCreamOrder.size) \(iceCreamOrder.flavor.name) with \(iceCreamOrder.toppings). Your total is \(myCreamsicles.totalSales)")
    }
    return iceCreamOrder
}


orderCone(order: VanillaCream)
