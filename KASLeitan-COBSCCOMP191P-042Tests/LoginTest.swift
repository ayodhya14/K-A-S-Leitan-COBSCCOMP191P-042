
import XCTest

class LoginTest: XCTestCase {

    func validateEmail(email : String) -> Bool{
        if(email.count>0){
            return true;
        }
        else{
            return false;
            
        }
    }

}
