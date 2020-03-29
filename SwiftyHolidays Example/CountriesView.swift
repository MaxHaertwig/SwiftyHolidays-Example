import SwiftUI
import SwiftyHolidays

struct CountriesView: View {
    var body: some View {
        NavigationView {
            List(Country.allCases, id: \.self) { country in
                NavigationLink(destination: CountryView(country: country)) {
                    Text(self.emojiFlag(iso2Code: country.iso2Code) + " " + country.displayString())
                }
            }
            .navigationBarTitle("Holidays")
        }
    }
    
    private func emojiFlag(iso2Code: String) -> String {
        return iso2Code.uppercased().unicodeScalars.reduce("") { acc, us in
            return acc + String(UnicodeScalar(127397 + us.value)!)
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
