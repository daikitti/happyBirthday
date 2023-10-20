///**


import SwiftUI

struct BirthdayList: View {
    @ObservedObject var birthdayVM = BirthdayListViewModel()
    @State private var addNewPresented = false
    let notify = NotificationsHandler()
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    BirthdayHeader().padding(.top, 30)
                    Button(action: {self.addNewPresented.toggle()}) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }.padding([.trailing, .bottom], 15)
                        .sheet(isPresented: $addNewPresented) {
                            AddNewBirthdayView(addNewPresented: self.$addNewPresented).onDisappear {
                                self.refreshData()
                            }
                    }
                }
                List {
                    ForEach(self.birthdayVM.birthdays.indices, id: \.self) {idx in
                        ZStack {
                            BirthdayCell(birthdayVM: self.birthdayVM.birthdays[idx]).shadow(radius: 10)
                               

                            NavigationLink(destination:
                                UpdateBirthdayView(bdayVM: self.birthdayVM.birthdays[idx])
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                            ) {
                                EmptyView()
                                    
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    
                    }.onDelete(perform: delete(at:))
                    
                        .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                }.listRowSeparator(.hidden)
                    .scrollContentBackground(.hidden)
                    .padding(-30)
            }.onAppear {
                self.refreshData()
                notify.askPermisson()
                
            }
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
        .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            
            
        }.edgesIgnoringSafeArea(.all)
            .background(.black)
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            self.birthdayVM.removeBirthday(at: index)
        }
        refreshData()
    }
    
    func refreshData() {
        self.birthdayVM.fetchAllBirthdays()
    }
}

struct BirthdayHeader: View {
    var body: some View {
        VStack {
            Text("Дни рождения")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Rectangle().fill(Color.clear))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BirthdayList_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayList()
    }
}
