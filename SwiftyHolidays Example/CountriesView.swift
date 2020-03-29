import SwiftUI
import SwiftyHolidays

struct CountriesView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DateCheckerView()) {
                    Text("Date Checker")
                }
                Section(header: Text("Countries".uppercased())) {
                    ForEach(Country.allCases, id: \.self) { country in
                        NavigationLink(destination: CountryView(country: country)) {
                            Text(country.displayStringWithFlag)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Holidays")
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
