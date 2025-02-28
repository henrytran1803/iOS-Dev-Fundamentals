import Foundation
//MARK: exersice 3
class Order{
    private var orderID: String
    private var customerName: String
    
    init(orderID: String, customerName: String) {
        self.orderID = orderID
        self.customerName = customerName
    }
    
    func getOrderID() -> String {
        return orderID
    }
    func getCustomerName() -> String {
        return customerName
    }
    func setCustomerName(_ customerName: String) {
        self.customerName = customerName
    }
    func setOrderID(_ orderID: String) {
        self.orderID = orderID
    }
    
    func orderDetails() -> String {
        return "Order ID: \(orderID)\nCustomer Name: \(customerName)"
    }
}

class OnlineOrder: Order {
    private var shippingAddress: String
    init(orderID: String, customerName: String, shippingAddress: String) {
        self.shippingAddress = shippingAddress
        super.init(orderID: orderID, customerName: customerName)
    }
    
    func setShippingAddress(_ shippingAddress: String) {
        self.shippingAddress = shippingAddress
    }
    func getShippingAddress() -> String {
        return shippingAddress
    }
    override func orderDetails() -> String {
        let orderDetails = super.orderDetails()
        return orderDetails + "shipping address \(shippingAddress)"
    }
}

class InStoreOrder: Order {
    private var pickupLocation : String
    init(pickupLocation: String, customerName: String, orderID: String) {
        self.pickupLocation = pickupLocation
        super.init(orderID: orderID, customerName: customerName)
    }
    func getPickupLocation() -> String {
        return pickupLocation
    }
    func setPickupLocation(_ pickupLocation: String) {
        self.pickupLocation = pickupLocation
    }
    override func orderDetails() -> String {
        let orderDetails = super.orderDetails()
        return orderDetails + "pickup location \(pickupLocation)"
    }
}
let onlineOrder = OnlineOrder(orderID: "12345", customerName: "Alice", shippingAddress: "123 Online St.")
onlineOrder.setShippingAddress("456 New Address St.")
print("Online Order Details:")
print(onlineOrder.orderDetails())

let inStoreOrder = InStoreOrder(pickupLocation: "Store A", customerName: "Bob", orderID: "54321")
inStoreOrder.setPickupLocation("Store B")
print("\nIn-Store Order Details:")
print(inStoreOrder.orderDetails())

//MARK: exersice 4

class User {
    private var username: String
    private var email: String
    
    init(username: String, email: String) {
        self.username = username
        self.email = email
    }
    
    func getUsername() -> String {
        return username
    }
    
    func getEmail() -> String {
        return email
    }
    
    func setUsername(username: String) {
        self.username = username
    }
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func profileInfo() {
        print("Username: \(username), Email: \(email)")
    }
}

class RegularUser: User {
    private var friendsList: [String] = []
    
    func getFriendsList() -> [String] {
        return friendsList
    }
    
    func addFriend(friend: String) {
        friendsList.append(friend)
    }
    
    func removeFriend(friend: String) {
        if let index = friendsList.firstIndex(of: friend) {
            friendsList.remove(at: index)
        }
    }
    
    override func profileInfo() {
        super.profileInfo()
        print("Friends List: \(friendsList)")
    }
}

class AdminUser: User {
    private var permissions: [String] = []
    
    func getPermissions() -> [String] {
        return permissions
    }
    
    func addPermission(permission: String) {
        permissions.append(permission)
    }
    
    func removePermission(permission: String) {
        if let index = permissions.firstIndex(of: permission) {
            permissions.remove(at: index)
        }
    }
    
    override func profileInfo() {
        super.profileInfo()
        print("Permissions: \(permissions)")
    }
}

class PremiumUser: User {
    private var subscriptionDate: Date?
    
    func getSubscriptionDate() -> Date? {
        return subscriptionDate
    }
    
    func setSubscriptionDate(subscriptionDate: Date) {
        self.subscriptionDate = subscriptionDate
    }
    
    override func profileInfo() {
        super.profileInfo()
        if let subscriptionDate = subscriptionDate {
            print("Subscription Date: \(subscriptionDate)")
        } else {
            print("Subscription Date: Not subscribed")
        }
    }
}

class SocialNetwork {
    private var users: [User] = []
    
    func addUser(user: User) {
        users.append(user)
    }
    
    func displayAllUsers() {
        for user in users {
            user.profileInfo()
            print("-----------")
        }
    }
    
    func addFriend(user: RegularUser, friend: String) {
        user.addFriend(friend: friend)
    }
    
    func removeFriend(user: RegularUser, friend: String) {
        user.removeFriend(friend: friend)
    }
}

let user1 = RegularUser(username: "alice", email: "alice@email.com")
let user2 = AdminUser(username: "bob", email: "bob@email.com")
let user3 = PremiumUser(username: "charlie", email: "charlie@email.com")

let socialNetwork = SocialNetwork()

socialNetwork.addUser(user: user1)
socialNetwork.addUser(user: user2)
socialNetwork.addUser(user: user3)

socialNetwork.addFriend(user: user1, friend: "bob")
socialNetwork.addFriend(user: user1, friend: "charlie")

socialNetwork.displayAllUsers()

socialNetwork.removeFriend(user: user1, friend: "bob")

socialNetwork.displayAllUsers()
//MARK: exersice 5


class Room {
    private var roomNumber: Int
    private var price: Double
    private var isAvailable: Bool
    
    init(roomNumber: Int, price: Double, isAvailable: Bool) {
        self.roomNumber = roomNumber
        self.price = price
        self.isAvailable = isAvailable
    }
    func getIsAvailable() -> Bool {
        return isAvailable
    }
    func getRoomNumber() -> Int {
        return roomNumber
    }
    func roomDetails() -> String {
        return "Room number \(roomNumber), price \(price), status \(isAvailable)"
    }
}
class SingleRoom: Room {
    private var bedType: String
    
    init(roomNumber: Int, price: Double, isAvailable: Bool, bedType: String) {
        self.bedType = bedType
        super.init(roomNumber: roomNumber, price: price, isAvailable: isAvailable)
    }
    override func roomDetails() -> String {
        return "\(super.roomDetails()), bed type: \(bedType)"
    }
}
class DoubleRoom: Room {
    private var viewType: String
    
    init(roomNumber: Int, price: Double, isAvailable: Bool, viewType: String) {
        self.viewType = viewType
        super.init(roomNumber: roomNumber, price: price, isAvailable: isAvailable)
    }
    override func roomDetails() -> String {
        return "\(super.roomDetails()), view type: \(viewType)"
    }
}
class SuiteRoom: Room {
    private var livingArea: Double
    
    init(roomNumber: Int, price: Double, isAvailable: Bool, livingArea: Double) {
        self.livingArea = livingArea
        super.init(roomNumber: roomNumber, price: price, isAvailable: isAvailable)
    }
    override func roomDetails() -> String {
        return "\(super.roomDetails()), living area: \(livingArea) square meters"
    }
}
class Hotel {
    private var rooms: [Room] = []
    
    func addRoom(_ room: Room) {
        rooms.append(room)
    }
    func getAvailableRooms() -> [Room] {
        return rooms.filter { $0.getIsAvailable() }
    }
    func removeRoom(withNumber roomNumber: Int) -> Bool {
        if let index = rooms.firstIndex(where: { $0.getRoomNumber() == roomNumber }) {
            rooms.remove(at: index)
            return true
        }
        return false
    }
    func findRoom(withNumber roomNumber: Int) -> Room? {
        return rooms.first(where: { $0.getRoomNumber() == roomNumber })
    }
    func listRoomDetails() -> String {
        return rooms.map { $0.roomDetails()} .joined(separator: "\n")
    }
}
let hotel = Hotel()

let singleRoom1 = SingleRoom(roomNumber: 101, price: 100.0, isAvailable: true, bedType: "Single")
let doubleRoom1 = DoubleRoom(roomNumber: 102, price: 150.0, isAvailable: false, viewType: "Sea View")
let suiteRoom1 = SuiteRoom(roomNumber: 201, price: 300.0, isAvailable: true, livingArea: 45.0)

hotel.addRoom(singleRoom1)
hotel.addRoom(doubleRoom1)
hotel.addRoom(suiteRoom1)

print("All Rooms in the Hotel:")
hotel.listRoomDetails()

if let foundRoom = hotel.findRoom(withNumber: 101) {
    print("\nFound Room 101: \(foundRoom.roomDetails())")
}

let roomRemoved = hotel.removeRoom(withNumber: 102)
if roomRemoved {
    print("\nRoom 102 has been removed.")
}

print("\nAll Rooms in the Hotel after removal:")
for room in hotel.getAvailableRooms() {
    print(room.roomDetails())
}

//MARK: exersice 6

class Event {
    private var eventName: String
    private var eventDate: String
    private var location: String
    
    init(eventName: String, eventDate: String, location: String) {
        self.eventName = eventName
        self.eventDate = eventDate
        self.location = location
    }
    func getEventName() -> String {
        return eventName
    }
    func eventDetail()-> String{
        return "Event Name: \(eventName)\nEvent Date: \(eventDate)\nLocation: \(location)"
    }
}
class Conference: Event {
    private var speakers: [String]
    
    init(eventName: String, eventDate: String, location: String, speakers: [String]) {
        self.speakers = speakers
        super.init(eventName: eventName, eventDate: eventDate, location: location)
    }
    override func eventDetail() -> String {
        let result = super.eventDetail()
        return result + "\nSpeakers: \(speakers)"
    }
}

class Workshop: Event {
    private var participants: [String]
    
    init(eventName: String, eventDate: String, location: String, participants: [String]) {
        self.participants = participants
        super.init(eventName: eventName, eventDate: eventDate, location: location)
    }
    override func eventDetail() -> String {
        let result = super.eventDetail()
        return result + "\nParticipants: \(participants)"
    }
}
class EventManager {
    private var events: [Event] = []
    
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    func removeEvent(named eventName: String) {
        if let index = events.firstIndex(where: { $0.getEventName() == eventName }) {
            events.remove(at: index)
        }
    }
    func findEvent(named eventName: String) -> Event? {
        return events.first(where: { $0.getEventName() == eventName })
    }
    func listAllEvents() -> [String] {
        return events.map { $0.getEventName() }
    }
}

let conference1 = Conference(eventName: "Tech Conference 2023", eventDate: "2023-10-10", location: "New York", speakers: ["Alice", "Bob", "Charlie"])
let workshop1 = Workshop(eventName: "iOS Development Workshop", eventDate: "2023-11-15", location: "San Francisco", participants: ["John", "Sara", "Tom"])

let eventManager = EventManager()


eventManager.addEvent(conference1)
eventManager.addEvent(workshop1)


print("All Events:")
for eventName in eventManager.listAllEvents() {
    print(eventName)
}

if let foundEvent = eventManager.findEvent(named: "Tech Conference 2023") {
    print("\nEvent Details for Tech Conference 2023:")
    print(foundEvent.eventDetail())
}

eventManager.removeEvent(named: "iOS Development Workshop")
print("\nAll Events after removal:")
for eventName in eventManager.listAllEvents() {
    print(eventName)
}

