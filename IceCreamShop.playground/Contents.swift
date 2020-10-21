enum Rating: String {
    case OK = "* * *"
    case GOOD = "* * * *"
    case BEST = "* * * * *"
}
enum Toppings: Double {
    case none = 0.00
    case sprinkles = 0.50
    case hotFudge = 0.99
    case cookieDough = 0.55
    case whippedCream = 0.10
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

func orderCone(order: IceCream) -> IceCream? {
    let iceCreamOrder = order
    myCreamsicles.totalSales += (iceCreamOrder.size.rawValue + iceCreamOrder.toppings.rawValue)
    print("You ordered a \(iceCreamOrder.size) \(iceCreamOrder.flavor.name). Your total is \(myCreamsicles.totalSales)")
    return iceCreamOrder
}


orderCone(order: VanillaCream)
