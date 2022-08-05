//
//  AppDelegate.swift
//  CleanCode
//
//  Created by Anton Hodyna on 02/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print("loginData: ", login)
                
                auth.register(userId: login.user.id, login: "Somebody", password: "mypassword", email: "", gender: "", creditCard: "", bio: "") { response in
                    switch response.result {
                    case .success(let register):
                        print("registerData: ", register)
                        
                        auth.changeUserData(userId: login.user.id, login: "Somebody", password: "mypassword", email: "test@mail.ru", gender: "third", creditCard: "", bio: "") { response in
                            switch response.result {
                            case .success(let change):
                                print("changeData: ", change)
                                
                                auth.logout(userID: login.user.id) { response in
                                    switch response.result {
                                    case .success(let logout):
                                        print("logoutData: ", logout)
                                    case .failure(let error):
                                        print(error.localizedDescription)
                                    }
                                }
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

