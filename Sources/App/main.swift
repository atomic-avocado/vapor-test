import Vapor

let drop = Droplet()

drop.get { _ in
//    return "Hello VAPOR!"
    return try JSON(node: [
        "message": "Hello, VAPOR!"
    ])
}

drop.get("hello") { _ in
    return try JSON(node: [
        "message": "Hello, again :P"
        ])
}

drop.get("beers", Int.self) { _, beers in
    return try JSON(node: [
        "message": "Take one down, pass it around, \(beers - 1) bottles of beer on the wall..."
        ])
}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: [
        "message": "Hello, \(name)!"
        ])
}

drop.run()
