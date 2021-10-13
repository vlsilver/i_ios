//
//  main.swift
//  Protocol And Delegate Demo
//
//  Created by niBVL on 12/10/2021.
//

protocol StudentProtocol {
    func showProtocol()
}

struct Thanh:StudentProtocol {
    init(controller: Company ) {
        controller.inter = self
    }
    func showProtocol() {
        print("Thành tốt nghiệp năm 2012")
    }
    }
class Linh: StudentProtocol{
    
    init(controller: Company ) {
        controller.inter = self
    }
    
    func showProtocol() {
        print("Linh tốt nghiệp nămg 2012")
    }
}
class Company {
    var inter: StudentProtocol?
    func checkProtocol()  {
        inter?.showProtocol()
    }
}


var decomLab = Company()
var a = Thanh(controller: decomLab)
var b = Linh(controller: decomLab)

decomLab.checkProtocol()

