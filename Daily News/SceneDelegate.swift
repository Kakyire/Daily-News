//
//  SceneDelegate.swift
//  Daily News
//
//  Created by Daniel Frimpong on 13/10/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController(rootViewController: setupTabController())
        navigationController.navigationBar.prefersLargeTitles = true
        window = UIWindow(windowScene: scene)
        window?.rootViewController = setupTabController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    private func setupTabController () -> UIViewController{
        let homeScreen = HomeScreen()
        homeScreen.title = K.home
        homeScreen.tabBarItem = UITabBarItem(title: K.home, image: UIImage(systemName: "house.circle"), selectedImage: UIImage(systemName: "house.circle.fill"))
        
        
        let techScreen = TechScreen()
        techScreen.title = K.tech
        techScreen.tabBarItem = UITabBarItem(title: K.tech, image: UIImage(systemName: "cursorarrow.click"), selectedImage: UIImage(systemName: "cursorarrow.click.2"))
        
        
       
        
        let sportScreen = SportsScreen()
        sportScreen.title = K.sports
        sportScreen.tabBarItem = UITabBarItem(title: K.sports, image: UIImage(systemName: "sportscourt.circle"), selectedImage: UIImage(systemName: "sportscourt.circle.fill"))
        
        
        let entertainmentScreen = EntertainmentScreen()
        entertainmentScreen.title = K.entertainment
        entertainmentScreen.tabBarItem = UITabBarItem(title: K.entertainment, image: UIImage(systemName: "play.circle"), selectedImage: UIImage(systemName: "play.circle.fill"))
        
        
        let settingsScreen = SettingsScreen()
        settingsScreen.title = K.settings
        settingsScreen.tabBarItem = UITabBarItem(title: K.settings, image: UIImage(systemName: "gearshape.circle"), selectedImage: UIImage(systemName: "gearshape.circle.fill"))
        
        
        let screens = [homeScreen, techScreen,sportScreen,entertainmentScreen]
        
        let viewControllers = screens.map { screen in
            screen.view.backgroundColor = .systemBackground
           let navController = UINavigationController(rootViewController: screen)
            navController.navigationBar.prefersLargeTitles = true
            
           return navController
        }
        
        let uiTab = UITabBarController()
        uiTab.viewControllers = viewControllers
        
        
        return uiTab
        
    }

}

