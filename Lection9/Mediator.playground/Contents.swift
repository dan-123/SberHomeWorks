//MARK: - Mediator

/*
 Задача: В системе умного дома есть центральный контроллер, который позволяет выставлять температуру и влажность воздуха.
 */

enum Event {
    case changeTemperature
    case changeHumidity
}

protocol Mediator {
    func notify(sender: Component, event: Event)
}

protocol Component {
    var controller: Mediator? {get set}
}

class TemperatureSensors: Component {
    var controller: Mediator?
    
    var temperatureValue: Int = 25 {
        didSet {
            controller?.notify(sender: self, event: .changeTemperature)
        }
    }
}

class HumiditySensors: Component {
    var controller: Mediator?
    var humidityValue: Int = 40 {
        didSet {
            controller?.notify(sender: self, event: .changeHumidity)
        }
    }
}

class CentralController: Mediator {
    var temperature: TemperatureSensors
    var humidity: HumiditySensors
    
    init(temperature: TemperatureSensors, humidity: HumiditySensors) {
        self.temperature = temperature
        self.humidity = humidity
    }
    
    func notify(sender: Component, event: Event) {
        switch event {
        case .changeTemperature:
            print("Выставлена температура \(temperature.temperatureValue) градусов")
        case .changeHumidity:
            print("Выставлена влажость воздуха \(humidity.humidityValue) процентов")
        }
    }
    
    func change(newTemperature: Int, newHumidity: Int) {
        if 20...35 ~= newTemperature {
            temperature.temperatureValue = newTemperature
        } else {
            print("Температура должна быть в диапазоне от 20 до 30 градусов")
        }
        
        if 40...60 ~= newHumidity {
            humidity.humidityValue = newHumidity
        } else {
            print("Влажность воздуха должна быть в диапазоне от 40 до 60 процентов")
        }
    }
}

// MARK: - Test

let temperatureSensor = TemperatureSensors()
let humiditySensor = HumiditySensors()

let controller = CentralController(temperature: temperatureSensor, humidity: humiditySensor)

temperatureSensor.controller = controller
humiditySensor.controller = controller

controller.change(newTemperature: 30, newHumidity: 60)
