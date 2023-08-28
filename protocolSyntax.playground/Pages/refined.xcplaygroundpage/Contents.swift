import Foundation

protocol Parent {
    var val : Int { get set }
    func method()
}
protocol proA : Parent {}
extension proA {
    func method() { //default defination
        print("from protocol proA")
        print("proA value \(val)")
    }
}
protocol proB : Parent {}
extension proB {
    func method() {//default defination
        print("from protocol proB")
        print("proB value \(val)")
    }
}
class ImplProA : proA {
    var val: Int
    init(value : Int) {
        val = value
    }
}
class ImplProB : proB {
    var val: Int
    init(value : Int) {
        val = value
    }
}
class ImplProAProB : proA,proB {
    var val: Int
    init(value : Int) {
        val = value
    }
    func method() {
        print("proA value \(val)")
    }
}

func testfun(obj : Parent) {
    obj.method()
}

var classAobj : proA = ImplProA(value: 10)
var classBobj : proB = ImplProB(value: 20)
var classABobj : proA & proB = ImplProAProB(value: 30)

testfun(obj: classAobj)
testfun(obj: classBobj)
testfun(obj: classABobj)
