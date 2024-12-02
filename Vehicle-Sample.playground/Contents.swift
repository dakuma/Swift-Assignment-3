import UIKit


// super means the Parent or Base class
// self means the class itself as in Car

//=======================>>
// Vehicle class
class Vehicle {
    private var color: String
    private var fuelAmount: Int = 0
    private var fuelRate: Int
    
    init(color: String, fuelRate: Int) {
        self.color = color
        self.fuelRate = fuelRate
    }
    
    // getter(s)
    func getColor() -> String {
        return self.color
    }
    func getFuelAmount() -> Int {
        return self.fuelAmount
    }
    func getRange() -> Int {
        return self.fuelAmount / self.fuelRate
    }
    
    // setter(s)
    func setColor(color: String) {
        self.color = color
    }
    func setFuelAmount(fuelAmount: Int) {
        self.fuelAmount = fuelAmount
    }
} // Vehicle


//=========================>>
// Car Class
class Car: Vehicle {
    private var fuelRange: Int = Int.random(in: 50...100) // 50 to 100 inclusive
    private var fuelRateRange: Int = Int.random(in: 2...4) // 2 to 4 inclusive
    private var hasRadio: Bool
    
    init(color: String, hasRadio: Bool) {
        self.hasRadio = hasRadio
        super.init(color: color, fuelRate: self.fuelRateRange) // calling the parents init
        super.setFuelAmount(fuelAmount: self.fuelRange) // calls the parents setter
    }
    
    // getters
    func getHasRadio() -> Bool {
        return self.hasRadio
    }
} // Car


//=====================>>
// Truck Class
class Truck: Vehicle {
    private var fuelRange: Int = Int.random(in: 150...250)
    private var fuelRateRange: Int = Int.random(in: 5...9)
    private var truckBedCapacity: Int
    
    init(color: String, truckBedCapacity: Int) {
        self.truckBedCapacity = truckBedCapacity
        super.init(color: color, fuelRate: self.fuelRateRange)
        super.setFuelAmount(fuelAmount: self.fuelRange)
    }
    
    // getters
    func getTruckBedCapacity() -> Int {
        return self.truckBedCapacity
    }
} // Truck


//============================>>
// testing the car class
let hasARadio = Int.random(in: 0...1) == 0
var car: Car = Car(color: "Red", hasRadio: hasARadio ? true : false)
print("Fuel amount: \(car.getFuelAmount())")
print("The car can drive approx. \(car.getRange()) miles.")
if car.getHasRadio() {
    print("The car has a radio!")
} else {
    print("The car has no disco!")
}
print() // prints and empty line


//============================>>
// testing the truck class
var truck: Truck = Truck(color: "Blue", truckBedCapacity: 200)
print("Fuel amount: \(truck.getFuelAmount())")
print("The truck can drive approx. \(truck.getRange()) miles.")
print("The truck as a bed capacity of \(truck.getTruckBedCapacity())")
