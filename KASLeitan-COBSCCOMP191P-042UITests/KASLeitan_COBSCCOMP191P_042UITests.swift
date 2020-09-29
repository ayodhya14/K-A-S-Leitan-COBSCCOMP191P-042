import XCTest


class KASLeitan_COBSCCOMP191P_042UITests: XCTestCase {
    
    func testInvalidLogin_CredentialsAlertShown() {
            let app = XCUIApplication()
            app.launch()
            app.buttons["Already Have an Account?"].tap()
            app.textFields["Email"].tap()
            app.secureTextFields["Password"].tap()
            app.buttons["Log In"].tap()

            let alertDialog = app.alerts["Log In"]

            XCTAssertTrue(alertDialog.exists)

            alertDialog.buttons["Ok"].tap()
            
            
        }
        
        func testExample() throws {
            // UI tests must launch the application that they test.
            
            let validEmail = "1234@gmail.com"
//            let validPassword = "1234"
            
            let app = XCUIApplication()
            app.launch()
            
            app.buttons["Already Have an Account?"].tap()
            
            let emailTextField = app.textFields["Email"]
            XCTAssertTrue(emailTextField.exists)

            app.textFields["Email"].tap()
            
            emailTextField.typeText(validEmail)
            
//            let passwordSecureTextField = app.secureTextFields["Password"]
//            XCTAssertTrue(passwordSecureTextField.exists)
            
//            passwordSecureTextField.tap()
//            passwordSecureTextField.typeText(validPassword)
            
            app.buttons["Log In"].tap()
            
        }

        func testPerformance() throws {
            if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                    XCUIApplication().launch()
                }
            }
        }


}
