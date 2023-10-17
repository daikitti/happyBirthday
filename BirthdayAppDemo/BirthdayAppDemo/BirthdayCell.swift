


import SwiftUI

struct BirthdayCell: View {
    var birthdayVM: BirthdayViewModel
    @State private var updatePresented = false
    
    var body: some View {
        HStack {
            // cal
            VStack {
                Text(birthdayVM.monthString)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 20)
                    .background(Rectangle().fill(Color.random))
                
                Text(birthdayVM.dayString)
                    .bold()
                    .frame(height: 35)
            }.background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                .shadow(radius: 5)
            
            // name
            Text(birthdayVM.name)
                .font(.system(size: 40))
                .autoSize()
                .font(.title2)
                .lineLimit(2)
                .foregroundColor(.white)
                .padding(.leading, 10)
                
            
            Spacer()
            
            // last col, turning, days, in # days
            VStack {
                Text("Исполнится")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("\(birthdayVM.turningYear)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                if birthdayVM.remainingDays == 0 {
                    Text("🥳 Cегодня 🎉")
                        .autoSize()
                    .font(.caption)
                   // .bold()
                    .lineLimit(0)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding([.horizontal], 10)
                    .padding([.vertical], 5)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Text("Через \(birthdayVM.remainingDays) дней")
                        .autoSize()
                    .font(.caption)
                   // .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding([.horizontal], 10)
                    .padding([.vertical], 5)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }.padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            .shadow(radius: 5)
            
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

extension Text {
  func autoSize(minimumScaleFactor: CGFloat = 0.01) -> some View {
    self.lineLimit(2)
      .minimumScaleFactor(minimumScaleFactor)
  }
}
struct BirthdayCell_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayCell(birthdayVM: BirthdayViewModel(id: UUID(), name: "Никита Зиганшин друг dfdfdf", date: Date.now))
    }
}
