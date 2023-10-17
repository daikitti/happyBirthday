///**
/**


*/

import Foundation
import SwiftUI
import Combine

class BirthdayListViewModel: ObservableObject {
    @Published var birthdays = [BirthdayViewModel]()
    
    func fetchAllBirthdays() {
        self.birthdays = DataManager.shared.getBirthdays().map(BirthdayViewModel.init)
    }
    
    func removeBirthday(at index: Int) {
        let bday = birthdays[index]
        DataManager.shared.removeBirthday(id: bday.id)
    }
}
