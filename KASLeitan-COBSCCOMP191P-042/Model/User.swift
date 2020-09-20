import CoreLocation

enum AccountType: Int {
    case passenger
    case driver
}

struct User {
    let firstname: String
    let lastname: String
    var email: String
    var role: String
    var location: CLLocation?
    let temperature: String
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.firstname = dictionary["firstname"] as? String ?? ""
        self.lastname = dictionary["lastname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.role = dictionary["role"] as? String ?? ""
        self.temperature = dictionary["temperature"] as? String ?? "37°C"
        
        
    }
}
