struct Flavor {
    let name: String
    let rating: Int
    
}

enum Size: Double {
    case small = 3.99
    case medium = 4.99
    case large = 5.99
}

struct Cone {
    let flavor: String
    let topping: String
    let size : Size
}
