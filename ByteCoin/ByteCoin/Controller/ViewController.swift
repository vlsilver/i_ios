//
//  ViewController.swift
//  ByteCoin
//
//  Created by niBVL on 14/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.fetchCoinPrice(for: "USD")
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}
//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.currencyArray[row]
        coinManager.fetchCoinPrice(for: currency)
    }
}
//MARK: - CoinManagerDelegate
extension ViewController : CoinManagerDelegate {
    func didUpdateCoin(coinModel: CoinModel) {
        DispatchQueue.main.async {
            self.currencyLabel.text = coinModel.currency
            self.priceLabel.text = coinModel.rateString
        }
    }
    
    func didErrorCoin(error: Error) {
        print(error)
    }
}
