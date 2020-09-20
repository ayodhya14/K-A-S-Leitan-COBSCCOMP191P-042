import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha:1)
        tabBar.barTintColor = UIColor.white
        setTabBar()
    }
    
    func setTabBar(){
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.tabBarItem.image = UIImage(systemName: "house")
        homeController.tabBarItem.title = "Home"
        
        let plusController = UINavigationController(rootViewController: CreateViewController())
        plusController.tabBarItem.image = UIImage(systemName: "plus")
        plusController.tabBarItem.title = ""
        
        let settingsController = UINavigationController(rootViewController: SettingsViewController())
        settingsController.tabBarItem.image = UIImage(systemName: "gear")
        settingsController.tabBarItem.title = "setting"

        viewControllers = [homeController, plusController, settingsController]
    }
    

    
}
