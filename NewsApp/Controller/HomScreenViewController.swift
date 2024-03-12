//
//  HomScreenViewController.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 08/03/24.
//

import UIKit

class HomScreenViewController: UIViewController{
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var btnrefernce: [UIButton]!
    
    @IBOutlet weak var allButtonReference: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var politicsButton: UIButton!
    @IBOutlet weak var festivalButton: UIButton!
    @IBOutlet weak var fashionButton: UIButton!
    
    var cellDataSource:[NewsTableCellModel]=[]
    var viewModel:MainViewModel=MainViewModel()
    
    @IBOutlet weak var topButtonsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bindViewModel()
        allButtonReference.layer.cornerRadius=20.0
        sportsButton.layer.cornerRadius=20.0
        educationButton.layer.cornerRadius=20.0
        politicsButton.layer.cornerRadius=20.0
        festivalButton.layer.cornerRadius=20.0
        fashionButton.layer.cornerRadius=20.0
        
        activityIndicator.startAnimating()
        
        newsTableView.register(UINib(nibName: "newsTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTableView()
    }

    
    func configureView(){
        self.title="Discover News"
        if let navigationController = self.navigationController {
            navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        setUpTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if(cellDataSource.count==0){
            viewModel.getData()
        }
    }
    
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self
                    , let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind{[weak self] news in
            guard let self = self , let news = news else{
                return
            }
            self.cellDataSource=news
            self.reloadTableView()
        }
    }
    
    func resetButton(){
        allButtonReference.backgroundColor = UIColor(hex: "6F727B")
        allButtonReference.setTitleColor(.white, for: .normal)
        sportsButton.backgroundColor = UIColor(hex: "6F727B")
        sportsButton.setTitleColor(.white, for: .normal)
        educationButton.backgroundColor = UIColor(hex: "6F727B")
        educationButton.setTitleColor(.white, for: .normal)
        politicsButton.backgroundColor = UIColor(hex: "6F727B")
        politicsButton.setTitleColor(.white, for: .normal)
        festivalButton.backgroundColor = UIColor(hex: "6F727B")
        festivalButton.setTitleColor(.white, for: .normal)
        fashionButton.backgroundColor = UIColor(hex: "6F727B")
        fashionButton.setTitleColor(.white, for: .normal)


    }
    
    @IBAction func categoryResultSelectionButtonClicked(_ sender: UIButton) {
        
        resetButton();
        
        if sender.tag == 1 {
            allButtonReference.backgroundColor = UIColor(hex: "6F5EBF")
            allButtonReference.setTitleColor(.white, for: .normal)
        }
        if sender.tag == 2 {
            
            sportsButton.backgroundColor = UIColor(hex: "6F5EBF")
            sportsButton.setTitleColor(.white, for: .normal)
        }
        if sender.tag == 3 {
            
            educationButton.backgroundColor = UIColor(hex: "6F5EBF")
            educationButton.setTitleColor(.white, for: .normal)
        }
        if sender.tag == 4 {
            
            politicsButton.backgroundColor = UIColor(hex: "6F5EBF")
            politicsButton.setTitleColor(.white, for: .normal)
        }
        if sender.tag == 5 {
            
            festivalButton.backgroundColor = UIColor(hex: "6F5EBF")
            festivalButton.setTitleColor(.white, for: .normal)
        }
        if sender.tag == 6 {
            
            fashionButton.backgroundColor = UIColor(hex: "6F5EBF")
            fashionButton.setTitleColor(.white, for: .normal)
        }
        
    }
}
    
  

extension HomScreenViewController: UITableViewDelegate , UITableViewDataSource{
    
    func setUpTableView(){
        self.newsTableView.dataSource=self
        self.newsTableView.delegate=self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:newsTableViewCell=newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! newsTableViewCell
        
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel, tableView: newsTableView)
        cell.selectionStyle = .none
      
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = cellDataSource[indexPath.row]
        let controller = NewsDetailViewController(viewModel: cellViewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
