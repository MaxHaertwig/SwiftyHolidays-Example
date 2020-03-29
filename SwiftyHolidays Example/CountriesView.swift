import SwiftUI
import SwiftyHolidays

struct CountriesView: View {
    var body: some View {
        NavigationView {
            List(Country.allCases, id: \.self) { country in
                NavigationLink(destination: CountryView(country: country)) {
                    Text(country.displayString())
                }
            }
            .navigationBarTitle("Holidays")
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
