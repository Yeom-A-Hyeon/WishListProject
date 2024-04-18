//
//  WishListViewController.swift
//  WishListProject
//
//  Created by A Hyeon on 4/18/24.
//

import UIKit
import CoreData

class WishListViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    @IBOutlet weak var tableView: UITableView!
    private var productList: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        setProductList()
    }

    // CoreData에서 상품 정보를 불러와, productList 변수에 저장합니다.
    private func setProductList() {
        guard let context = self.persistentContainer?.viewContext else { return }
    
        let request = Product.fetchRequest()
    
        if let productList = try? context.fetch(request) {
            self.productList = productList
        }
    }
    
    // productList의 count를 반환합니다.
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
                let product = self.productList[indexPath.row]
        
                let id = product.id
                let title = product.title ?? ""
                let price = product.price
        
                cell.textLabel?.text = "[\(id)] \(title) - \(price)$"
                return cell
    }
    
    
}
