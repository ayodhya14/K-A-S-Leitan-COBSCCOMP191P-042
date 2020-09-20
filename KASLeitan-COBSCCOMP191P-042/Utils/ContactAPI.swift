class ContactAPI {
    static func getContacts() -> [Contact]{
        let contacts = [
            Contact(name: "Supun Perera", jobTitle: "Designer", country: "bo"),
            Contact(name: "Mahesh Kumara", jobTitle: "SEO Specialist", country: "be"),
            Contact(name: "Jonathon Andrewson", jobTitle: "Interactive Designer", country: "af"),
            Contact(name: "Sunimal Opatha", jobTitle: "Architect", country: "al"),
            Contact(name: "Iresha Shyamean", jobTitle: "Economist", country: "br"),
            Contact(name: "Tharindu Perera", jobTitle: "Web Strategist", country: "ar"),
            Contact(name: "Lawanya Siriwardhena", jobTitle: "Product Designer", country: "az"),
            Contact(name: "Kanchana Opatha", jobTitle: "Editor", country: "bo"),
            Contact(name: "Nipuna Supun", jobTitle: "Creative Director", country: "au")
        ]
        return contacts
    }
}
