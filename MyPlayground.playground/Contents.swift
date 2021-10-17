  protocol DataManager {
        func fetchData()
    }

    // Có thể import một hoặc nhiểu protocol
  struct DataModel: DataManager {
    func fetchData() {
        print("")
    }
    
        var title: String
        var url: String
        // Không cần Contractor khởi tạo
            
    mutating func changeTitle()  {
        title = "Change title"
    }
    
    }

    var data = DataModel(title: "Test", url: "www.test.com")
    var dataCopy = data
    data.changeTitle()
    print(data)
    print(dataCopy)
