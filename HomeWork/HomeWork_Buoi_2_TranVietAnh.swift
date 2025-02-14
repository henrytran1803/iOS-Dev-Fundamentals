import Foundation

// homework1
//Bài Tập 1: Hệ Thống Quản Lý Đơn Hàng
class Product {
    var productID: Int
    var name: String
    var price: Double
    var quantity: Int
    
    init(productID: Int, name: String, price: Double, quantity: Int) {
        self.productID = productID
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

class Order {
    var orderId: Int
    var customerName: String
    var items: [Product]
    
    init(orderId: Int, customerName: String, items: [Product]) {
        self.orderId = orderId
        self.customerName = customerName
        self.items = items
    }
    
    func addProduct(_ product: Product) {
        items.append(product)
    }
    
    func removeProduct(_ productId: Int) {
        if let index = items.firstIndex(where: { $0.productID == productId }) {
            items.remove(at: index)
        }
    }
    
    func total() -> Double {
        if items.isEmpty {
            print("Cart is empty")
            return 0.0
        }
        
        let sum = items.reduce(0.0) { (result, product) in
            return result + (product.price * Double(product.quantity))
        }
        
        return sum
    }
    
    func isValid() -> Bool {
        return items.allSatisfy { $0.quantity > 0 }
    }
    func infoCart() {
        print("Order ID: \(orderId)")
        print("Customer Name: \(customerName)")
        print("--------------------")
        for item in items {
            print("Product ID: \(item.productID), Name: \(item.name), Price: \(item.price), Quantity: \(item.quantity)")
        }
        print("--------------------")
        print("Total: \(total())")
    }
}
let product1 = Product(productID: 1, name: "iPhone", price: 999.0, quantity: 2)
let product2 = Product(productID: 2, name: "AirPods", price: 199.0, quantity: 1)
let order = Order(orderId: 1, customerName: "John Doe", items: [product1, product2])
let product3 = Product(productID: 3, name: "iPad", price: 499.0, quantity: 1)
order.addProduct(product3)
order.removeProduct(2)
order.infoCart()
// homework2
//Bài Tập 2: Hệ Thống Quản Lý Khách Sạn
enum RoomType {
    case luxury, standard
}
class Room {
    var roomNumber: Int
    var type: RoomType
    var price: Double
    var isAvailable: Bool = true
    init(roomNumber: Int, type: RoomType, price: Double) {
        self.roomNumber = roomNumber
        self.type = type
        self.price = price
    }
}
class Reservation {
    var guestName: String
    var room: Room
    var checkInDate: Date
    var checkOutDate: Date!
    init(guestName: String, room: Room, checkInDate: Date) {
        self.guestName = guestName
        self.room = room
        self.checkInDate = checkInDate
    }
    func info() -> String {
        guard let checkOutDate = checkOutDate else { return "No check out date" }
        return "\(guestName) booked room \(room.roomNumber) from \(checkInDate) to \(checkOutDate)"
    }
}
class Hotel {
    var rooms: [Room]
    var reservations: [Reservation] = []
    
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    
    func addRoom(_ room: Room) {
        rooms.append(room)
    }
    
    func makeReservation(guestName: String, roomNumber: Int, checkIn: Date) -> Bool {
        guard let room = rooms.first(where: { $0.roomNumber == roomNumber && $0.isAvailable }) else {
            print("Room \(roomNumber) is not available")
            return false
        }
        
        room.isAvailable = false
        let reservation = Reservation(guestName: guestName, room: room, checkInDate: checkIn)
        reservations.append(reservation)
        print("Reservation successful for \(guestName)")
        return true
    }
    
    func checkRoomStatus(_ roomNumber: Int) -> String {
        guard let room = rooms.first(where: { $0.roomNumber == roomNumber }) else {
            return "Room not found"
        }
        
        let status = room.isAvailable ? "Available" : "Occupied"
        let roomInfo = "Room \(roomNumber) (\(room.type)): \(status)"
        
        if !room.isAvailable {
            let currentReservations = reservations.filter { $0.room.roomNumber == roomNumber }
            let reservationInfo = currentReservations.map { reservation in
                "Reserved by: \(reservation.guestName)\n" +
                "Check-in: \(reservation.checkInDate)\n" +
                "Check-out: \(reservation.checkOutDate)"
            }.joined(separator: "\n")
            return roomInfo + "\n" + reservationInfo
        }
        
        return roomInfo
    }
    
    func cancelReservation(guestName: String, roomNumber: Int) -> Bool {
        guard let reservationIndex = reservations.firstIndex(where: {
            $0.guestName == guestName && $0.room.roomNumber == roomNumber
        }) else {
            print("Reservation not found")
            return false
        }
        
        reservations[reservationIndex].room.isAvailable = true
        reservations[reservationIndex].checkOutDate = Date()
        print("Reservation cancelled successfully")
        return true
    }
}
let room1 = Room(roomNumber: 101, type: .luxury, price: 200.0)
let room2 = Room(roomNumber: 102, type: .standard, price: 100.0)
let room3 = Room(roomNumber: 103, type: .luxury, price: 250.0)

let hotel = Hotel(rooms: [room1, room2])

hotel.addRoom(room3)

let today = Date()

hotel.makeReservation(guestName: "John Doe", roomNumber: 101, checkIn: today)
hotel.makeReservation(guestName: "Jane Smith", roomNumber: 102, checkIn: today)

hotel.makeReservation(guestName: "Alice Brown", roomNumber: 101, checkIn: today)

print(hotel.checkRoomStatus(101))
print("\n")
print(hotel.checkRoomStatus(102))
print("\n")
print(hotel.checkRoomStatus(103))

hotel.cancelReservation(guestName: "John Doe", roomNumber: 101)

print(hotel.checkRoomStatus(101))

print("\n--- Trying to Cancel Non-existent Reservation ---")
hotel.cancelReservation(guestName: "Not Found", roomNumber: 101)

//homework 3
//Bài Tập 3: Quản Lý Thời Gian và Lịch
class Event {
    var title: String
    var startTime: Date
    var endTime: Date
    var location: String
    
    init(title: String, startTime: Date, endTime: Date, location: String) {
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
    }
}

class Calendar {
    
    var events: [Event] = []
    func addEvent(_ event: Event) {
        if checkOverlappingEvent(event) {
            print("Event overlaps with existing event")
            return
        }
        events.append(event)
    }
    func removeEvent(withTitle title: String) {
        if let index = events.firstIndex(where: { $0.title == title }) {
            events.remove(at: index)
        }
    }
    func checkOverlappingEvent(_ event: Event) -> Bool {
        for e in events {
            if e.title != event.title {
                if event.startTime < e.endTime && event.endTime > e.startTime {
                    return true
                }
            }
        }
        return false
    }
}
let calendar = Calendar()

let now = Date()
let oneHourLater = Date(timeIntervalSinceNow: 3600)
let twoHoursLater = Date(timeIntervalSinceNow: 7200)
let threeHoursLater = Date(timeIntervalSinceNow: 10800)

let meetingEvent = Event(
    title: "Team Meeting",
    startTime: now,
    endTime: oneHourLater,
    location: "Conference Room A"
)

let lunchEvent = Event(
    title: "Team Lunch",
    startTime: oneHourLater,
    endTime: twoHoursLater,
    location: "Restaurant"
)

let overlappingEvent = Event(
    title: "Overlapping Meeting",
    startTime: oneHourLater,
    endTime: threeHoursLater,
    location: "Room B"
)

calendar.addEvent(meetingEvent)
calendar.addEvent(lunchEvent)
calendar.addEvent(overlappingEvent)
calendar.removeEvent(withTitle: "Team Lunch")
calendar.addEvent(overlappingEvent)
for event in calendar.events {
    print("- \(event.title) at \(event.location)")
}

