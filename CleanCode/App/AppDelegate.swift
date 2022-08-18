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
        
        registrationTest()
       // makeAllAuth()
       // productsTest()
        
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
    
    func registrationTest() {
        let authFactory = requestFactory.makeAuthRequestFatory()
        authFactory.register(userId: 123, login: "Somebody", password: "mypassword", email: "", gender: "", creditCard: "", bio: "") { response in
            debugPrint(response)
            switch response.result {
            case .success(let register):
                print("registerData: ", register)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeAllAuth() {
        let authFactory = requestFactory.makeAuthRequestFatory()
        authFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print("loginData: ", login)
                
                authFactory.register(userId: login.user.id, login: "Somebody", password: "mypassword", email: "", gender: "", creditCard: "", bio: "") { response in
                    switch response.result {
                    case .success(let register):
                        print("registerData: ", register)
                        
                        authFactory.changeUserData(userId: login.user.id, login: "Somebody", password: "mypassword", email: "test@mail.ru", gender: "third", creditCard: "", bio: "") { response in
                            switch response.result {
                            case .success(let change):
                                print("changeData: ", change)
                                
                                authFactory.logout(userID: login.user.id) { response in
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
    }
    
    func productsTest() {
        let productsFactory = requestFactory.makeProductRequestFatory()
        productsFactory.getProducts(pageNumber: 1, categoryID: 1) { response in
            switch response.result {
                case .success(let getProductsResult):
                print("getProducts: ", getProductsResult)
                for product in getProductsResult {
                    productsFactory.getProduct(productID: product.productID) { response in
                        switch response.result {
                        case .success(let getProductResult):
                            print("getProduct with ID \(product.productID): \(getProductResult)")
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

