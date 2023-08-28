import Foundation

protocol proA {
    var val : Int { get set }
    func proA()
}
extension proA {
    func proA() { //default defination
        print("from protocol proA")
        print("proA value \(val)")
    }
}
protocol proB {
    var val : Int { get set }
    func proB()
}
extension proB {
    func proB() {//default defination
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
}
func testfun(obj : proA) {
    obj.proA()
}

func testfun(obj: proB) {
    obj.proB()
}

func testfun(obj: proA & proB) {
    obj.proA()
    obj.proB()
}

var classAobj : proA = ImplProA(value: 10)
var classBobj : proB = ImplProB(value: 20)
var classABobj : proA & proB = ImplProAProB(value: 30)

testfun(obj: classAobj)
testfun(obj: classBobj)
testfun(obj: classABobj)
