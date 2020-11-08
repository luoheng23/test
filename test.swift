class hello {
}

extension hello {
    class func a() -> Int {
        return 40
    }
}

extension hello {
    var a: Int { return type(of: self).a() - 20 }
}

extension hello {
    func story() {
        print(a)
        print(type(of: self).a())
    }
}


print(hello().story())