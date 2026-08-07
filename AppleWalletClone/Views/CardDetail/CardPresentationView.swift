import SwiftUI

struct CardTemplates {

    // MARK: - USA Elite Cards (расширенный список)

    static let amexCenturion = CardTemplate(
        name: "American Express Centurion",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .centurion,
        gradientColors: ["#0A0A0A", "#1C1C1E", "#0D0D0D", "#2C2C2E"],
        patternType: .amexCenturion,
        logoColor: "#C0A062",
        textColor: "#C0A062",
        description: "The legendary Black Card. Invitation only."
    )

    static let amexPlatinum = CardTemplate(
        name: "American Express Platinum",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Premium travel and lifestyle benefits"
    )

    static let amexGold = CardTemplate(
        name: "American Express Gold",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Dining and travel rewards"
    )

    static let amexGreen = CardTemplate(
        name: "American Express Green",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#2E8B57", "#228B22", "#3CB371", "#006400"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Everyday travel rewards"
    )

    static let amexBusinessPlatinum = CardTemplate(
        name: "Amex Business Platinum",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#C0C0C0", "#A8A8A8", "#D8D8D8", "#909090"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Business premium travel"
    )

    static let amexBusinessGold = CardTemplate(
        name: "Amex Business Gold",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Business rewards"
    )

    static let amexBusinessGreen = CardTemplate(
        name: "Amex Business Green",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#2E8B57", "#228B22", "#3CB371", "#006400"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Business travel"
    )

    static let amexDeltaPlatinum = CardTemplate(
        name: "Amex Delta SkyMiles Platinum",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Delta Air Lines co-branded"
    )

    static let amexDeltaReserve = CardTemplate(
        name: "Amex Delta SkyMiles Reserve",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .reserve,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Delta premium"
    )

    static let amexDeltaGold = CardTemplate(
        name: "Amex Delta SkyMiles Gold",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Delta rewards"
    )

    static let amexHiltonAspire = CardTemplate(
        name: "Amex Hilton Honors Aspire",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#104C97", "#0D3D7A", "#1A5CB0", "#0A2E5D"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Hilton premium"
    )

    static let amexHiltonSurpass = CardTemplate(
        name: "Amex Hilton Honors Surpass",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .gold,
        gradientColors: ["#104C97", "#0D3D7A", "#1A5CB0", "#0A2E5D"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Hilton rewards"
    )

    static let amexHilton = CardTemplate(
        name: "Amex Hilton Honors",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#104C97", "#0D3D7A", "#1A5CB0", "#0A2E5D"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Hilton co-branded"
    )

    static let amexMarriottBrilliant = CardTemplate(
        name: "Amex Marriott Bonvoy Brilliant",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#8B4513", "#A0522D", "#CD853F", "#D2691E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Marriott premium"
    )

    static let amexMarriottBevy = CardTemplate(
        name: "Amex Marriott Bonvoy Bevy",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .gold,
        gradientColors: ["#8B4513", "#A0522D", "#CD853F", "#D2691E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Marriott rewards"
    )

    static let amexMarriott = CardTemplate(
        name: "Amex Marriott Bonvoy",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#8B4513", "#A0522D", "#CD853F", "#D2691E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Marriott co-branded"
    )

    static let amexBlueCashPreferred = CardTemplate(
        name: "Amex Blue Cash Preferred",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#0066CC", "#0052A3", "#0078E6", "#003D7A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back"
    )

    static let amexBlueCashEveryday = CardTemplate(
        name: "Amex Blue Cash Everyday",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#0066CC", "#0052A3", "#0078E6", "#003D7A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "No annual fee cash back"
    )

    static let amexEveryDay = CardTemplate(
        name: "Amex EveryDay",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Membership Rewards"
    )

    static let amexEveryDayPreferred = CardTemplate(
        name: "Amex EveryDay Preferred",
        cardNetwork: .amex,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Enhanced Membership Rewards"
    )

    static let chaseSapphireReserve = CardTemplate(
        name: "Chase Sapphire Reserve",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .reserve,
        gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Ultimate Rewards premium"
    )

    static let chaseSapphirePreferred = CardTemplate(
        name: "Chase Sapphire Preferred",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#1B3A5C", "#2A4A6C", "#3A5A7C", "#0D1F33"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Popular travel rewards"
    )

    static let chaseFreedom = CardTemplate(
        name: "Chase Freedom",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1E5AA8", "#164785", "#2A6AB8", "#0E3462"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back rewards"
    )

    static let chaseFreedomStudent = CardTemplate(
        name: "Chase Freedom Student",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Student cash back"
    )

    static let chaseFreedomUnlimited = CardTemplate(
        name: "Chase Freedom Unlimited",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1E5AA8", "#164785", "#2A6AB8", "#0E3462"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Unlimited cash back"
    )

    static let chaseUnited = CardTemplate(
        name: "Chase United MileagePlus",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#003399", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "United Airlines co-branded"
    )

    static let chaseInkBusinessPreferred = CardTemplate(
        name: "Chase Ink Business Preferred",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#1B3A5C", "#0D1F33", "#2A4A6C", "#05101A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Business Ultimate Rewards"
    )

    static let chaseInkBusinessCash = CardTemplate(
        name: "Chase Ink Business Cash",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1E5AA8", "#164785", "#2A6AB8", "#0E3462"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Business cash back"
    )

    static let chaseAmazonPrime = CardTemplate(
        name: "Chase Amazon Prime Visa",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#FF9900", "#E68A00", "#FFB84D", "#CC7A00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Amazon rewards"
    )

    static let chaseIHG = CardTemplate(
        name: "Chase IHG Rewards",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "IHG Hotels rewards"
    )

    static let chaseHyatt = CardTemplate(
        name: "Chase World of Hyatt",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Hyatt Hotels rewards"
    )

    static let chaseSouthwest = CardTemplate(
        name: "Chase Southwest Rapid Rewards",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#304CB2", "#263D8F", "#4A66CC", "#1C2E6C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Southwest Airlines"
    )

    static let chaseSlate = CardTemplate(
        name: "Chase Slate",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "No annual fee"
    )

    static let jpMorganReserve = CardTemplate(
        name: "JP Morgan Reserve",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .reserve,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Ultra-premium private banking"
    )

    static let citiPrestige = CardTemplate(
        name: "Citi Prestige",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Premium travel and lifestyle"
    )

    static let citiAAdvantage = CardTemplate(
        name: "Citi AAdvantage",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#0078D2", "#005FA3", "#1A8CE6", "#004674"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "American Airlines co-branded"
    )

    static let citiDoubleCash = CardTemplate(
        name: "Citi Double Cash",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#0078D2", "#005FA3", "#1A8CE6", "#004674"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "2% cash back"
    )

    static let citiCustomCash = CardTemplate(
        name: "Citi Custom Cash",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#0078D2", "#005FA3", "#1A8CE6", "#004674"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "5% top category"
    )

    static let citiSimplicity = CardTemplate(
        name: "Citi Simplicity",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "No late fees"
    )

    static let citiCostco = CardTemplate(
        name: "Citi Costco Anywhere",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Costco rewards"
    )

    static let boaPremium = CardTemplate(
        name: "Bank of America Premium Rewards",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Flexible travel rewards"
    )

    static let boaCustomizedCash = CardTemplate(
        name: "Bank of America Customized Cash",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "3% category choice"
    )

    static let boaTravelRewards = CardTemplate(
        name: "Bank of America Travel Rewards",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Travel rewards"
    )

    static let capitalOneVentureX = CardTemplate(
        name: "Capital One Venture X",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Premium travel rewards"
    )

    static let capitalOneSavor = CardTemplate(
        name: "Capital One Savor",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Dining and entertainment"
    )

    static let capitalOneQuicksilver = CardTemplate(
        name: "Capital One Quicksilver",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "1.5% cash back"
    )

    static let capitalOnePlatinum = CardTemplate(
        name: "Capital One Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Building credit"
    )

    static let discoverIt = CardTemplate(
        name: "Discover It",
        cardNetwork: .discover,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#FF6000", "#E05500", "#FF7A33", "#C04A00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back match"
    )

    static let wellsFargoActiveCash = CardTemplate(
        name: "Wells Fargo Active Cash",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#D71E28", "#B81821", "#E8404A", "#9A141C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "2% cash back"
    )

    static let wellsFargoAutograph = CardTemplate(
        name: "Wells Fargo Autograph",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#D71E28", "#B81821", "#E8404A", "#9A141C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "3X points"
    )

    static let usBankAltitudeReserve = CardTemplate(
        name: "US Bank Altitude Reserve",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .reserve,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Premium travel"
    )

    static let usBankAltitudeGo = CardTemplate(
        name: "US Bank Altitude Go",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "No annual fee rewards"
    )

    static let pncCashRewards = CardTemplate(
        name: "PNC Cash Rewards",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#F58025", "#D96A1A", "#FF9440", "#B85A15"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back"
    )

    static let truistFuture = CardTemplate(
        name: "Truist Future",
        cardNetwork: .visa,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#5C068C", "#4A0570", "#6E1AA3", "#38045A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Student rewards"
    )

    static let appleCard = CardTemplate(
        name: "Apple Card",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#FFFFFF", "#F5F5F7", "#E8E8ED", "#D2D2D7"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Apple's titanium card"
    )

    static let appleCash = CardTemplate(
        name: "Apple Cash",
        cardNetwork: .other,
        cardType: .appleCash,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#1C1C1E", "#2C2C2E", "#3A3A3C", "#48484A"],
        patternType: .appleCashPattern,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Apple's digital cash"
    )

    static let appleAccount = CardTemplate(
        name: "Apple Account",
        cardNetwork: .other,
        cardType: .appleAccount,
        country: "USA",
        eliteTier: .standard,
        gradientColors: ["#FFFFFF", "#F5F5F7", "#E8E8ED", "#D2D2D7"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Apple Account balance"
    )

    // MARK: - UK Cards

    static let amexUKPlatinum = CardTemplate(
        name: "Amex UK Platinum",
        cardNetwork: .amex,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "UK Platinum"
    )

    static let amexUKGold = CardTemplate(
        name: "Amex UK Gold",
        cardNetwork: .amex,
        cardType: .credit,
        country: "UK",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UK Gold"
    )

    static let amexUKPreferred = CardTemplate(
        name: "Amex UK Preferred Rewards Gold",
        cardNetwork: .amex,
        cardType: .credit,
        country: "UK",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UK Preferred Rewards"
    )

    static let couttsSilk = CardTemplate(
        name: "Coutts World Silk",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UK",
        eliteTier: .silk,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "UK's most exclusive. Royal family bank."
    )

    static let natwestBlack = CardTemplate(
        name: "NatWest Black",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Premium UK banking"
    )

    static let natwestReward = CardTemplate(
        name: "NatWest Reward",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .standard,
        gradientColors: ["#42145F", "#35104D", "#4F1871", "#280C3A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back rewards"
    )

    static let hsbcPremier = CardTemplate(
        name: "HSBC Premier World",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#DB0011", "#B8000E", "#F01A2A", "#95000B"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "HSBC premium banking"
    )

    static let barclaysAvios = CardTemplate(
        name: "Barclays Avios",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#00AEEF", "#008DC9", "#1AC4FF", "#006CA3"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "British Airways rewards"
    )

    static let barclaysPlatinum = CardTemplate(
        name: "Barclays Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#00AEEF", "#008DC9", "#1AC4FF", "#006CA3"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Barclays premium"
    )

    static let lloydsWorldElite = CardTemplate(
        name: "Lloyds World Elite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .worldElite,
        gradientColors: ["#006A4D", "#00553E", "#1A8062", "#00402F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Lloyds premium"
    )

    static let santanderAllInOne = CardTemplate(
        name: "Santander All in One",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .standard,
        gradientColors: ["#EC0000", "#C40000", "#FF1A1A", "#A30000"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "All in one rewards"
    )

    static let halifaxClarity = CardTemplate(
        name: "Halifax Clarity",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .standard,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "No foreign fees"
    )

    static let virginAtlanticReward = CardTemplate(
        name: "Virgin Atlantic Reward+",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#E10A0A", "#C00808", "#FF2A2A", "#A00606"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Virgin Atlantic rewards"
    )

    static let tsbPlatinum = CardTemplate(
        name: "TSB Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "TSB premium"
    )

    static let monzoPlus = CardTemplate(
        name: "Monzo Plus",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "UK",
        eliteTier: .standard,
        gradientColors: ["#FF4D4D", "#E64444", "#FF6666", "#CC3B3B"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Monzo premium"
    )

    static let starlingBank = CardTemplate(
        name: "Starling Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "UK",
        eliteTier: .standard,
        gradientColors: ["#5B2E91", "#4A2578", "#6C3DAA", "#391E5F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Digital banking"
    )

    static let revolutMetal = CardTemplate(
        name: "Revolut Metal",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Metal card premium"
    )

    static let revolutUltra = CardTemplate(
        name: "Revolut Ultra",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "UK",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Ultra premium"
    )

    // MARK: - UAE Cards

    static let dubaiFirstRoyale = CardTemplate(
        name: "Dubai First Royale MasterCard",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UAE",
        eliteTier: .royal,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#C0A062",
        textColor: "#C0A062",
        description: "Diamond-encrusted. Invitation only."
    )

    static let emiratesNBDInfinite = CardTemplate(
        name: "Emirates NBD Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UAE premium banking"
    )

    static let emiratesNBDPlatinum = CardTemplate(
        name: "Emirates NBD Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .platinum,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UAE Platinum"
    )

    static let adcbInfinite = CardTemplate(
        name: "ADCB Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Abu Dhabi premium"
    )

    static let emiratesIslamicInfinite = CardTemplate(
        name: "Emirates Islamic Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#006A4D", "#00553E", "#1A8062", "#00402F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Islamic banking premium"
    )

    static let mashreqInfinite = CardTemplate(
        name: "Mashreq Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Mashreq premium"
    )

    static let fabInfinite = CardTemplate(
        name: "FAB Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "FAB premium"
    )

    static let cbdInfinite = CardTemplate(
        name: "CBD Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CBD premium"
    )

    static let rakbankInfinite = CardTemplate(
        name: "RAKBANK Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "UAE",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "RAKBANK premium"
    )

    static let noorBankWorld = CardTemplate(
        name: "Noor Bank World",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "UAE",
        eliteTier: .worldElite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Noor Bank premium"
    )

    // MARK: - Russia Cards

    static let sberbankInfinite = CardTemplate(
        name: "Sberbank Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .infinite,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Russia's top tier card"
    )

    static let sberbankWorldElite = CardTemplate(
        name: "Sberbank World Elite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .worldElite,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank premium"
    )

    static let sberbankPlatinum = CardTemplate(
        name: "Sberbank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank Platinum"
    )

    static let sberbankGold = CardTemplate(
        name: "Sberbank Visa Gold",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .gold,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank Gold"
    )

    static let sberbankClassic = CardTemplate(
        name: "Sberbank Visa Classic",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank Classic"
    )

    static let sberbankMastercardWorld = CardTemplate(
        name: "Sberbank Mastercard World",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank World"
    )

    static let sberbankMastercardPlatinum = CardTemplate(
        name: "Sberbank Mastercard Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#1A9F29", "#158A23", "#2AB33D", "#10751C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sberbank MC Platinum"
    )

    static let tinkoffBlackEdition = CardTemplate(
        name: "Tinkoff Black Edition",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFDD2D",
        textColor: "#FFDD2D",
        description: "Tinkoff premium debit"
    )

    static let tinkoffPlatinum = CardTemplate(
        name: "Tinkoff Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#FFDD2D", "#E5C528", "#FFE840", "#CCAE1F"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Tinkoff popular card"
    )

    static let tinkoffBlack = CardTemplate(
        name: "Tinkoff Black",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFDD2D",
        textColor: "#FFDD2D",
        description: "Tinkoff debit"
    )

    static let tinkoffDrive = CardTemplate(
        name: "Tinkoff Drive",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Auto rewards"
    )

    static let tinkoffS7 = CardTemplate(
        name: "Tinkoff S7",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "S7 Airlines rewards"
    )

    static let tinkoffPro = CardTemplate(
        name: "Tinkoff Pro",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#FFDD2D", "#E5C528", "#FFE840", "#CCAE1F"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Tinkoff Pro"
    )

    static let tinkoffJunior = CardTemplate(
        name: "Tinkoff Junior",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Kids card"
    )

    static let tinkoffAllAirlines = CardTemplate(
        name: "Tinkoff All Airlines",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Travel rewards card"
    )

    static let alfa100 = CardTemplate(
        name: "Alfa-Bank 100",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#EF3124", "#D52A1F", "#FF4A3D", "#BB231A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Alfa-Bank premium"
    )

    static let alfaCashback = CardTemplate(
        name: "Alfa-Bank Cashback",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#EF3124", "#D52A1F", "#FF4A3D", "#BB231A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Cash back"
    )

    static let alfaTravel = CardTemplate(
        name: "Alfa-Bank Travel",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#EF3124", "#D52A1F", "#FF4A3D", "#BB231A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Travel rewards"
    )

    static let alfaAeroflot = CardTemplate(
        name: "Alfa-Bank Aeroflot",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#EF3124", "#D52A1F", "#FF4A3D", "#BB231A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Aeroflot miles"
    )

    static let vtbMulticardWorld = CardTemplate(
        name: "VTB Multicard World",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .worldElite,
        gradientColors: ["#002F87", "#00266E", "#1A4DB3", "#001D55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "VTB premium multicard"
    )

    static let vtbClassic = CardTemplate(
        name: "VTB Classic",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#002F87", "#00266E", "#1A4DB3", "#001D55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "VTB Classic"
    )

    static let vtbGold = CardTemplate(
        name: "VTB Gold",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .gold,
        gradientColors: ["#002F87", "#00266E", "#1A4DB3", "#001D55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "VTB Gold"
    )

    static let vtbPlatinum = CardTemplate(
        name: "VTB Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#002F87", "#00266E", "#1A4DB3", "#001D55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "VTB Platinum"
    )

    static let vtbMulticard = CardTemplate(
        name: "VTB Multicard",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#002F87", "#00266E", "#1A4DB3", "#001D55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "VTB Multicard"
    )

    static let raiffeisenInfinite = CardTemplate(
        name: "Raiffeisen Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .infinite,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen premium"
    )

    static let raiffeisenGold = CardTemplate(
        name: "Raiffeisen Gold",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .gold,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Gold"
    )

    static let raiffeisenPlatinum = CardTemplate(
        name: "Raiffeisen Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Platinum"
    )

    static let raiffeisenTravel = CardTemplate(
        name: "Raiffeisen Travel",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Travel"
    )

    static let gazprombankInfinite = CardTemplate(
        name: "Gazprombank Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .infinite,
        gradientColors: ["#0078BE", "#00609A", "#1A8FD4", "#004C77"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Gazprombank premium"
    )

    static let gazprombankUnionPay = CardTemplate(
        name: "Gazprombank UnionPay",
        cardNetwork: .unionPay,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "Gazprombank UnionPay"
    )

    static let rosbankPlatinum = CardTemplate(
        name: "Rosbank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Rosbank Platinum"
    )

    static let rosbankWorld = CardTemplate(
        name: "Rosbank Mastercard World",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Rosbank World"
    )

    static let otkritieInfinite = CardTemplate(
        name: "Otkritie Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .infinite,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Otkritie premium"
    )

    static let sovcombankHalva = CardTemplate(
        name: "Sovcombank Halva",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Installment card"
    )

    static let mtsBankCashback = CardTemplate(
        name: "MTS Bank Cashback",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "MTS cash back"
    )

    static let homeBank = CardTemplate(
        name: "Home Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Home Credit Bank"
    )

    static let tBankBlack = CardTemplate(
        name: "T-Bank Black",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFDD2D",
        textColor: "#FFDD2D",
        description: "T-Bank debit"
    )

    static let tBankPlatinum = CardTemplate(
        name: "T-Bank Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#FFDD2D", "#E5C528", "#FFE840", "#CCAE1F"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "T-Bank Platinum"
    )

    static let mirPremium = CardTemplate(
        name: "Mir Premium",
        cardNetwork: .mir,
        cardType: .credit,
        country: "Russia",
        eliteTier: .platinum,
        gradientColors: ["#00AEEF", "#008DC9", "#1AC4FF", "#006CA3"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Russia's domestic network"
    )

    static let mirClassic = CardTemplate(
        name: "Mir Classic",
        cardNetwork: .mir,
        cardType: .debit,
        country: "Russia",
        eliteTier: .standard,
        gradientColors: ["#00AEEF", "#008DC9", "#1AC4FF", "#006CA3"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Mir Classic"
    )

    // MARK: - Ukraine Cards

    static let privatBankUniversal = CardTemplate(
        name: "PrivatBank Universal",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#76B82A", "#669E24", "#8ACC40", "#55841E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Ukraine's most popular"
    )

    static let privatBankGold = CardTemplate(
        name: "PrivatBank Gold",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "PrivatBank Gold"
    )

    static let privatBankPlatinum = CardTemplate(
        name: "PrivatBank Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .platinum,
        gradientColors: ["#76B82A", "#669E24", "#8ACC40", "#55841E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "PrivatBank Platinum"
    )

    static let privatBankInfinite = CardTemplate(
        name: "PrivatBank Infinite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "PrivatBank premium"
    )

    static let monoBankBlack = CardTemplate(
        name: "MonoBank Black",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FF4D4D",
        textColor: "#FF4D4D",
        description: "MonoBank premium"
    )

    static let monoBankWhite = CardTemplate(
        name: "MonoBank White",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#FFFFFF", "#F5F5F7", "#E8E8ED", "#D2D2D7"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "MonoBank standard"
    )

    static let monoBankPlatinum = CardTemplate(
        name: "MonoBank Platinum",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "MonoBank Platinum"
    )

    static let monoBankIron = CardTemplate(
        name: "MonoBank Iron",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "MonoBank Iron"
    )

    static let aBank = CardTemplate(
        name: "A-Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "A-Bank Ukraine"
    )

    static let senseBank = CardTemplate(
        name: "Sense Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sense Bank"
    )

    static let senseBankSuper = CardTemplate(
        name: "Sense Bank Super",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .platinum,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sense Bank premium"
    )

    static let oschadBank = CardTemplate(
        name: "OschadBank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "State Savings Bank"
    )

    static let ukrsibBank = CardTemplate(
        name: "UkrsibBank",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#00843D", "#006A31", "#1A9A53", "#005026"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BNP Paribas group"
    )

    static let pumb = CardTemplate(
        name: "PUMB",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "First Ukrainian International Bank"
    )

    static let otpBank = CardTemplate(
        name: "OTP Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "OTP Bank Ukraine"
    )

    static let raiffeisenUkraine = CardTemplate(
        name: "Raiffeisen Bank Aval",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Ukraine"
    )

    static let citiBankUkraine = CardTemplate(
        name: "Citibank Ukraine",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .platinum,
        gradientColors: ["#0078D2", "#005FA3", "#1A8CE6", "#004674"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Citibank Ukraine"
    )

    static let forwardBank = CardTemplate(
        name: "Forward Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Forward Bank"
    )

    static let iziBank = CardTemplate(
        name: "IZI Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#76B82A", "#669E24", "#8ACC40", "#55841E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "IZI Bank"
    )

    static let tascomBank = CardTemplate(
        name: "TascomBank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "TascomBank"
    )

    static let creditDnepr = CardTemplate(
        name: "Credit Dnipro",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Credit Dnipro Bank"
    )

    static let bankLviv = CardTemplate(
        name: "Bank Lviv",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Bank Lviv"
    )

    static let concordBank = CardTemplate(
        name: "Concord Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Ukraine",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Concord Bank"
    )

    // MARK: - Switzerland Cards

    static let ubsVisaInfinite = CardTemplate(
        name: "UBS Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "UBS premium"
    )

    static let ubsKeyClub = CardTemplate(
        name: "UBS KeyClub",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UBS rewards"
    )

    static let creditSuissePlatinum = CardTemplate(
        name: "Credit Suisse Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Credit Suisse premium"
    )

    static let creditSuisseBonviva = CardTemplate(
        name: "Credit Suisse Bonviva",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Bonviva rewards"
    )

    static let swissBankersTravelCash = CardTemplate(
        name: "Swiss Bankers Travel Cash",
        cardNetwork: .mastercard,
        cardType: .prepaid,
        country: "Switzerland",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Swiss prepaid"
    )

    static let postFinanceVisaPlatinum = CardTemplate(
        name: "PostFinance Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .platinum,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "PostFinance premium"
    )

    static let zkbVisaPlatinum = CardTemplate(
        name: "ZKB Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Zürcher Kantonalbank"
    )

    static let raiffeisenSwissGold = CardTemplate(
        name: "Raiffeisen Switzerland Gold",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Raiffeisen Gold"
    )

    static let juliusBaer = CardTemplate(
        name: "Julius Baer Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Julius Baer private"
    )

    static let pictet = CardTemplate(
        name: "Pictet Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Pictet private banking"
    )

    static let lombardOdier = CardTemplate(
        name: "Lombard Odier Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Switzerland",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Lombard Odier private"
    )

    // MARK: - France Cards

    static let bnpParibasInfinite = CardTemplate(
        name: "BNP Paribas Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .infinite,
        gradientColors: ["#00915A", "#007A4C", "#1AAB6E", "#00633E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "French premium banking"
    )

    static let bnpParibasWorldElite = CardTemplate(
        name: "BNP Paribas World Elite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "France",
        eliteTier: .worldElite,
        gradientColors: ["#00915A", "#007A4C", "#1AAB6E", "#00633E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BNP premium"
    )

    static let creditAgricoleInfinite = CardTemplate(
        name: "Crédit Agricole Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Crédit Agricole premium"
    )

    static let sgWorldElite = CardTemplate(
        name: "Société Générale World Elite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "France",
        eliteTier: .worldElite,
        gradientColors: ["#E60028", "#CC0023", "#FF1A3D", "#B3001E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "SG premium card"
    )

    static let sgVisaInfinite = CardTemplate(
        name: "Société Générale Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .infinite,
        gradientColors: ["#E60028", "#CC0023", "#FF1A3D", "#B3001E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "SG Visa Infinite"
    )

    static let laBanquePostale = CardTemplate(
        name: "La Banque Postale Visa Premier",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .platinum,
        gradientColors: ["#FFC0CB", "#E6ACB8", "#FFD4DC", "#CC99A5"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "French postal bank"
    )

    static let carteBleue = CardTemplate(
        name: "Carte Bleue",
        cardNetwork: .visa,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#0055A4", "#004489", "#1A6ABE", "#00336E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "French classic debit"
    )

    static let banquePopulaire = CardTemplate(
        name: "Banque Populaire Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Banque Populaire"
    )

    static let caisseEpargne = CardTemplate(
        name: "Caisse d'Epargne Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Caisse d'Epargne"
    )

    static let lcl = CardTemplate(
        name: "LCL Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "LCL bank"
    )

    static let hsbcFrance = CardTemplate(
        name: "HSBC France Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "France",
        eliteTier: .platinum,
        gradientColors: ["#DB0011", "#B8000E", "#F01A2A", "#95000B"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "HSBC France"
    )

    static let axaBanque = CardTemplate(
        name: "AXA Banque",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#00008F", "#000073", "#1A1AA3", "#00005C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "AXA Banque"
    )

    static let boursoramaBanque = CardTemplate(
        name: "Boursorama Banque",
        cardNetwork: .visa,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Online banking"
    )

    static let helloBank = CardTemplate(
        name: "Hello bank!",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BNP digital"
    )

    static let fortuneo = CardTemplate(
        name: "Fortuneo",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Online broker bank"
    )

    static let monabanq = CardTemplate(
        name: "Monabanq",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Crédit Mutuel digital"
    )

    static let ingDirectFrance = CardTemplate(
        name: "ING Direct France",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "France",
        eliteTier: .standard,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ING France"
    )

    // MARK: - Germany Cards

    static let deutscheBankBlack = CardTemplate(
        name: "Deutsche Bank MasterCard Black",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Germany",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "German premium banking"
    )

    static let deutscheBankVisaPlatinum = CardTemplate(
        name: "Deutsche Bank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Germany",
        eliteTier: .platinum,
        gradientColors: ["#0018A8", "#001388", "#1A33C0", "#000E68"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Deutsche Bank Platinum"
    )

    static let comdirect = CardTemplate(
        name: "Comdirect Visa",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#FFCC00", "#E5B800", "#FFD633", "#CCA300"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Comdirect bank"
    )

    static let commerzbankVisaInfinite = CardTemplate(
        name: "Commerzbank Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Germany",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Commerzbank premium"
    )

    static let sparkasseGold = CardTemplate(
        name: "Sparkasse Gold",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Germany",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sparkasse Gold"
    )

    static let volksbankenPremium = CardTemplate(
        name: "Volksbanken Premium",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Germany",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Volksbanken premium"
    )

    static let dkb = CardTemplate(
        name: "DKB Visa",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "DKB bank"
    )

    static let n26Metal = CardTemplate(
        name: "N26 Metal",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .platinum,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "N26 Metal card"
    )

    static let n26You = CardTemplate(
        name: "N26 You",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "N26 colored cards"
    )

    static let n26Standard = CardTemplate(
        name: "N26 Standard",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "N26 free"
    )

    static let bunqPremium = CardTemplate(
        name: "bunq Premium",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "bunq bank"
    )

    static let wise = CardTemplate(
        name: "Wise",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#00B9FF", "#009EE0", "#1AC8FF", "#0082B3"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Wise multi-currency"
    )

    static let consorsbank = CardTemplate(
        name: "Consorsbank Visa",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BNP Paribas Germany"
    )

    static let fidorBank = CardTemplate(
        name: "Fidor Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#FFCC00", "#E5B800", "#FFD633", "#CCA300"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Fidor digital"
    )

    static let solarisBank = CardTemplate(
        name: "Solarisbank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Banking-as-a-service"
    )

    static let tomorrowBank = CardTemplate(
        name: "Tomorrow Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Germany",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sustainable banking"
    )

    // MARK: - Netherlands Cards

    static let ingPlatinum = CardTemplate(
        name: "ING Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Netherlands",
        eliteTier: .platinum,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Dutch premium banking"
    )

    static let ingGold = CardTemplate(
        name: "ING Visa Gold",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Netherlands",
        eliteTier: .gold,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ING Gold"
    )

    static let rabobankPlatinum = CardTemplate(
        name: "Rabobank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Netherlands",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Rabobank premium"
    )

    static let abnAmroGold = CardTemplate(
        name: "ABN AMRO Visa Gold",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Netherlands",
        eliteTier: .gold,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ABN AMRO Gold"
    )

    static let triodosBank = CardTemplate(
        name: "Triodos Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Netherlands",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sustainable banking"
    )

    static let knab = CardTemplate(
        name: "Knab",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Netherlands",
        eliteTier: .standard,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Knab digital"
    )

    // MARK: - Belgium Cards

    static let bpostBank = CardTemplate(
        name: "bpost bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Belgium",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Belgian postal bank"
    )

    static let kbcBank = CardTemplate(
        name: "KBC Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Belgium",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "KBC Belgium"
    )

    static let belfius = CardTemplate(
        name: "Belfius",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Belgium",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Belfius bank"
    )

    static let argenta = CardTemplate(
        name: "Argenta",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Belgium",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Argenta bank"
    )

    // MARK: - Italy Cards

    static let unicreditInfinite = CardTemplate(
        name: "UniCredit Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Italy",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UniCredit premium"
    )

    static let intesaSanpaoloPlatinum = CardTemplate(
        name: "Intesa Sanpaolo Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Italy",
        eliteTier: .platinum,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Intesa premium"
    )

    static let monteDeiPaschi = CardTemplate(
        name: "Monte dei Paschi",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Italy",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "World's oldest bank"
    )

    static let mediobanca = CardTemplate(
        name: "Mediobanca",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Italy",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Mediobanca private"
    )

    static let finecoBank = CardTemplate(
        name: "Fineco Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Italy",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Fineco online"
    )

    static let mediolanum = CardTemplate(
        name: "Banca Mediolanum",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Italy",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Mediolanum bank"
    )

    // MARK: - Spain Cards

    static let santanderSpainInfinite = CardTemplate(
        name: "Santander Spain Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Spain",
        eliteTier: .infinite,
        gradientColors: ["#EC0000", "#C40000", "#FF1A1A", "#A30000"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Santander premium"
    )

    static let bbvaInfinite = CardTemplate(
        name: "BBVA Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Spain",
        eliteTier: .infinite,
        gradientColors: ["#004481", "#00376B", "#1A5E9E", "#002B55"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BBVA premium"
    )

    static let caixaBankPlatinum = CardTemplate(
        name: "CaixaBank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Spain",
        eliteTier: .platinum,
        gradientColors: ["#0072C6", "#005FA3", "#1A8CE6", "#004C8A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CaixaBank premium"
    )

    static let sabadell = CardTemplate(
        name: "Banco Sabadell",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Sabadell bank"
    )

    static let bankia = CardTemplate(
        name: "Bankia",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Bankia"
    )

    static let evoBanco = CardTemplate(
        name: "Evo Banco",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Evo digital"
    )

    static let openbank = CardTemplate(
        name: "Openbank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Santander digital"
    )

    static let n26Spain = CardTemplate(
        name: "N26 Spain",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#4A4A4A", "#3A3A3A", "#5A5A5A", "#2A2A2A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "N26 Spain"
    )

    static let revolutSpain = CardTemplate(
        name: "Revolut Spain",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Spain",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Revolut Spain"
    )

    // MARK: - Nordic Cards (Sweden, Norway, Denmark, Finland)

    static let nordeaVisaPlatinum = CardTemplate(
        name: "Nordea Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Sweden",
        eliteTier: .platinum,
        gradientColors: ["#00008F", "#000073", "#1A1AA3", "#00005C"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Nordea premium"
    )

    static let swedbankVisaPlatinum = CardTemplate(
        name: "Swedbank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Sweden",
        eliteTier: .platinum,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Swedbank premium"
    )

    static let sebVisaInfinite = CardTemplate(
        name: "SEB Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Sweden",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "SEB premium"
    )

    static let handelsbanken = CardTemplate(
        name: "Handelsbanken",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Sweden",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Handelsbanken"
    )

    static let danskeBankVisaPlatinum = CardTemplate(
        name: "Danske Bank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Denmark",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Danske Bank premium"
    )

    static let dnbNorway = CardTemplate(
        name: "DNB Norway",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Norway",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "DNB bank"
    )

    static let opBank = CardTemplate(
        name: "OP Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Finland",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "OP Finland"
    )

    static let danskeBankFinland = CardTemplate(
        name: "Danske Bank Finland",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Finland",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Danske Finland"
    )

    // MARK: - Poland Cards

    static let pkoBankPolski = CardTemplate(
        name: "PKO Bank Polski",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "PKO BP"
    )

    static let pekao = CardTemplate(
        name: "Bank Pekao",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Pekao bank"
    )

    static let mBank = CardTemplate(
        name: "mBank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "mBank digital"
    )

    static let ingPolska = CardTemplate(
        name: "ING Bank Śląski",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ING Poland"
    )

    static let santanderPolska = CardTemplate(
        name: "Santander Bank Polska",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#EC0000", "#C40000", "#FF1A1A", "#A30000"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Santander Poland"
    )

    static let millennium = CardTemplate(
        name: "Millennium Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Millennium"
    )

    static let revolutPoland = CardTemplate(
        name: "Revolut Poland",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Poland",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Revolut Poland"
    )

    // MARK: - Czech Republic Cards

    static let ceskaSporitelna = CardTemplate(
        name: "Česká spořitelna",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Czech Republic",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ČS bank"
    )

    static let komercniBanka = CardTemplate(
        name: "Komerční banka",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Czech Republic",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "KB bank"
    )

    static let monetaMoneyBank = CardTemplate(
        name: "Moneta Money Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Czech Republic",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Moneta"
    )

    static let airBank = CardTemplate(
        name: "Air Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Czech Republic",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Air Bank"
    )

    static let fioBanka = CardTemplate(
        name: "Fio banka",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Czech Republic",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Fio banka"
    )

    // MARK: - Austria Cards

    static let ersteBank = CardTemplate(
        name: "Erste Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Austria",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Erste Bank"
    )

    static let raiffeisenAustria = CardTemplate(
        name: "Raiffeisen Bank Austria",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Austria",
        eliteTier: .standard,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Austria"
    )

    static let bankAustria = CardTemplate(
        name: "Bank Austria",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Austria",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UniCredit Austria"
    )

    // MARK: - Portugal Cards

    static let millenniumBcp = CardTemplate(
        name: "Millennium BCP",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Portugal",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Millennium BCP"
    )

    static let santanderTotta = CardTemplate(
        name: "Santander Totta",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Portugal",
        eliteTier: .standard,
        gradientColors: ["#EC0000", "#C40000", "#FF1A1A", "#A30000"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Santander Portugal"
    )

    static let novobanco = CardTemplate(
        name: "Novo Banco",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Portugal",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Novo Banco"
    )

    static let cgd = CardTemplate(
        name: "Caixa Geral de Depósitos",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Portugal",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CGD bank"
    )

    // MARK: - Greece Cards

    static let nationalBankGreece = CardTemplate(
        name: "National Bank of Greece",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Greece",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "NBG"
    )

    static let piraeusBank = CardTemplate(
        name: "Piraeus Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Greece",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Piraeus"
    )

    static let eurobank = CardTemplate(
        name: "Eurobank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Greece",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Eurobank"
    )

    static let alphaBank = CardTemplate(
        name: "Alpha Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Greece",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Alpha Bank"
    )

    // MARK: - Romania Cards

    static let bcr = CardTemplate(
        name: "BCR",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Romania",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BCR Erste"
    )

    static let brd = CardTemplate(
        name: "BRD",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Romania",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BRD Société Générale"
    )

    static let bancaTransilvania = CardTemplate(
        name: "Banca Transilvania",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Romania",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "BT bank"
    )

    static let ingRomania = CardTemplate(
        name: "ING Romania",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Romania",
        eliteTier: .standard,
        gradientColors: ["#FF6200", "#E55800", "#FF7A33", "#CC4E00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ING Romania"
    )

    // MARK: - Hungary Cards

    static let otpBankHungary = CardTemplate(
        name: "OTP Bank Hungary",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Hungary",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "OTP Hungary"
    )

    static let khbBank = CardTemplate(
        name: "K&H Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Hungary",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "K&H bank"
    )

    static let ersteBankHungary = CardTemplate(
        name: "Erste Bank Hungary",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Hungary",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Erste Hungary"
    )

    static let raiffeisenHungary = CardTemplate(
        name: "Raiffeisen Hungary",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Hungary",
        eliteTier: .standard,
        gradientColors: ["#FFDD00", "#E5C700", "#FFE840", "#CCB100"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Raiffeisen Hungary"
    )

    // MARK: - Bulgaria Cards

    static let dskBank = CardTemplate(
        name: "DSK Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Bulgaria",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "DSK OTP"
    )

    static let unicreditBulgaria = CardTemplate(
        name: "UniCredit Bulgaria",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Bulgaria",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UniCredit Bulgaria"
    )

    static let fibank = CardTemplate(
        name: "Fibank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Bulgaria",
        eliteTier: .standard,
        gradientColors: ["#00A3E0", "#0082B3", "#1AB3F0", "#006186"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "First Investment Bank"
    )

    // MARK: - Croatia Cards

    static let zagrebackaBanka = CardTemplate(
        name: "Zagrebačka banka",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Croatia",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UniCredit Croatia"
    )

    static let pbz = CardTemplate(
        name: "PBZ",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Croatia",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Privredna banka Zagreb"
    )

    static let ersteBankCroatia = CardTemplate(
        name: "Erste Bank Croatia",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Croatia",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Erste Croatia"
    )

    static let otpBankCroatia = CardTemplate(
        name: "OTP Bank Croatia",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Croatia",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "OTP Croatia"
    )

    // MARK: - China Cards

    static let icbcVisaPlatinum = CardTemplate(
        name: "ICBC Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "China",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "ICBC premium"
    )

    static let icbcUnionPay = CardTemplate(
        name: "ICBC UnionPay",
        cardNetwork: .unionPay,
        cardType: .credit,
        country: "China",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "ICBC UnionPay"
    )

    static let ccbVisaInfinite = CardTemplate(
        name: "China Construction Bank Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "China",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CCB premium"
    )

    static let bocVisaPlatinum = CardTemplate(
        name: "Bank of China Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "China",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "BOC premium"
    )

    static let unionPayDiamond = CardTemplate(
        name: "UnionPay Diamond",
        cardNetwork: .unionPay,
        cardType: .credit,
        country: "China",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "China's premium card"
    )

    static let unionPayPlatinum = CardTemplate(
        name: "UnionPay Platinum",
        cardNetwork: .unionPay,
        cardType: .credit,
        country: "China",
        eliteTier: .platinum,
        gradientColors: ["#C41E3A", "#A81830", "#E04050", "#8E1226"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "China's popular card"
    )

    // MARK: - India Cards

    static let hdfcInfinia = CardTemplate(
        name: "HDFC Bank Infinia",
        cardNetwork: .visa,
        cardType: .credit,
        country: "India",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "HDFC premium"
    )

    static let hdfcRegalia = CardTemplate(
        name: "HDFC Bank Regalia",
        cardNetwork: .visa,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "HDFC Regalia"
    )

    static let iciciCoral = CardTemplate(
        name: "ICICI Bank Coral",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "India",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ICICI Coral"
    )

    static let axisMagnus = CardTemplate(
        name: "Axis Bank Magnus",
        cardNetwork: .visa,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Axis premium"
    )

    static let sbiPrime = CardTemplate(
        name: "SBI Card Prime",
        cardNetwork: .visa,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "SBI Prime"
    )

    static let kotakWhite = CardTemplate(
        name: "Kotak Mahindra White",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Kotak White"
    )

    static let scUltimate = CardTemplate(
        name: "Standard Chartered Ultimate",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "SC Ultimate"
    )

    static let ruPay = CardTemplate(
        name: "RuPay Platinum",
        cardNetwork: .rupay,
        cardType: .credit,
        country: "India",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "India's domestic network"
    )

    // MARK: - Japan Cards

    static let jcbTheClass = CardTemplate(
        name: "JCB The Class",
        cardNetwork: .jcb,
        cardType: .credit,
        country: "Japan",
        eliteTier: .theClass,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Japan's most exclusive"
    )

    static let jcbGold = CardTemplate(
        name: "JCB Gold",
        cardNetwork: .jcb,
        cardType: .credit,
        country: "Japan",
        eliteTier: .gold,
        gradientColors: ["#D4AF37", "#C5A028", "#E5C040", "#B8941F"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "JCB Gold"
    )

    static let jcbPlatinum = CardTemplate(
        name: "JCB Platinum",
        cardNetwork: .jcb,
        cardType: .credit,
        country: "Japan",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "JCB Platinum"
    )

    static let mufjInfinite = CardTemplate(
        name: "Mitsubishi UFJ Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Japan",
        eliteTier: .infinite,
        gradientColors: ["#E60012", "#CC0010", "#FF1A2A", "#B3000E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "MUFG premium"
    )

    static let rakutenCard = CardTemplate(
        name: "Rakuten Card",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Japan",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Rakuten points"
    )

    // MARK: - Singapore Cards

    static let dbsInsignia = CardTemplate(
        name: "DBS Insignia",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .insignia,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#C0A062",
        textColor: "#C0A062",
        description: "Singapore's most exclusive"
    )

    static let dbsAltitude = CardTemplate(
        name: "DBS Altitude",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "DBS travel"
    )

    static let ocbcElite = CardTemplate(
        name: "OCBC Elite World",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .worldElite,
        gradientColors: ["#E60028", "#CC0023", "#FF1A3D", "#B3001E"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "OCBC premium"
    )

    static let uobVisaInfinite = CardTemplate(
        name: "UOB Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UOB premium"
    )

    static let citibankSingapore = CardTemplate(
        name: "Citibank Singapore",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .platinum,
        gradientColors: ["#0078D2", "#005FA3", "#1A8CE6", "#004674"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Citi Singapore"
    )

    static let maybankVisaInfinite = CardTemplate(
        name: "Maybank Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Maybank premium"
    )

    static let cimbVisaInfinite = CardTemplate(
        name: "CIMB Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Singapore",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CIMB premium"
    )

    // MARK: - South Korea Cards

    static let shinhanBank = CardTemplate(
        name: "Shinhan Bank",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "South Korea",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Shinhan"
    )

    static let kbKookmin = CardTemplate(
        name: "KB Kookmin",
        cardNetwork: .visa,
        cardType: .credit,
        country: "South Korea",
        eliteTier: .standard,
        gradientColors: ["#FFCC00", "#E5B800", "#FFD633", "#CCA300"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "KB Kookmin"
    )

    static let samsungCard = CardTemplate(
        name: "Samsung Card",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "South Korea",
        eliteTier: .platinum,
        gradientColors: ["#1428A0", "#102080", "#2A40C0", "#0C1860"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Samsung"
    )

    static let hyundaiCard = CardTemplate(
        name: "Hyundai Card",
        cardNetwork: .visa,
        cardType: .credit,
        country: "South Korea",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Hyundai"
    )

    static let lotteCard = CardTemplate(
        name: "Lotte Card",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "South Korea",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Lotte"
    )

    // MARK: - Australia Cards

    static let westpacAltitudeBlack = CardTemplate(
        name: "Westpac Altitude Black",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Australia",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Westpac premium"
    )

    static let anzRewardsBlack = CardTemplate(
        name: "ANZ Rewards Black",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Australia",
        eliteTier: .black,
        gradientColors: ["#0072C6", "#005FA3", "#1A8CE6", "#004C8A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "ANZ premium"
    )

    static let commonwealthDiamond = CardTemplate(
        name: "Commonwealth Bank Diamond",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Australia",
        eliteTier: .platinum,
        gradientColors: ["#FFCC00", "#E5B800", "#FFD633", "#CCA300"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "CBA premium"
    )

    static let nabSignature = CardTemplate(
        name: "NAB Signature",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Australia",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "NAB premium"
    )

    static let macquarieBlack = CardTemplate(
        name: "Macquarie Black",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Australia",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Macquarie premium"
    )

    // MARK: - Brazil Cards

    static let bancoDoBrasilInfinite = CardTemplate(
        name: "Banco do Brasil Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Brazil",
        eliteTier: .infinite,
        gradientColors: ["#003087", "#002266", "#1A4DB3", "#001133"],
        patternType: .none,
        logoColor: "#FFD700",
        textColor: "#FFD700",
        description: "BB premium"
    )

    static let itauVisaInfinite = CardTemplate(
        name: "Itaú Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Brazil",
        eliteTier: .infinite,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Itaú premium"
    )

    static let bradescoVisaPlatinum = CardTemplate(
        name: "Bradesco Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Brazil",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Bradesco premium"
    )

    static let nubankUltravioleta = CardTemplate(
        name: "Nubank Ultravioleta",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Brazil",
        eliteTier: .platinum,
        gradientColors: ["#820AD1", "#6B08AC", "#9B2AE0", "#54068A"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Nubank premium"
    )

    static let c6Bank = CardTemplate(
        name: "C6 Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Brazil",
        eliteTier: .standard,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "C6 digital"
    )

    static let inter = CardTemplate(
        name: "Banco Inter",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Brazil",
        eliteTier: .standard,
        gradientColors: ["#FF6600", "#E55A00", "#FF7A1A", "#CC4D00"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Inter digital"
    )

    // MARK: - Canada Cards

    static let scotiabankPassport = CardTemplate(
        name: "Scotiabank Passport",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Canada",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Scotiabank travel"
    )

    static let tdAeroplan = CardTemplate(
        name: "TD Aeroplan Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Canada",
        eliteTier: .infinite,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "TD Air Canada"
    )

    static let rbcAvion = CardTemplate(
        name: "RBC Avion Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Canada",
        eliteTier: .infinite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "RBC premium"
    )

    static let cibcAventura = CardTemplate(
        name: "CIBC Aventura",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Canada",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "CIBC travel"
    )

    static let amexCanada = CardTemplate(
        name: "American Express Canada",
        cardNetwork: .amex,
        cardType: .credit,
        country: "Canada",
        eliteTier: .platinum,
        gradientColors: ["#E8E8E8", "#D0D0D0", "#F5F5F7", "#B8B8B8"],
        patternType: .none,
        logoColor: "#000000",
        textColor: "#000000",
        description: "Amex Canada"
    )

    static let desjardinsOdyssey = CardTemplate(
        name: "Desjardins Visa Odyssey",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Canada",
        eliteTier: .platinum,
        gradientColors: ["#00843D", "#006A31", "#1A9A53", "#005026"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Desjardins premium"
    )

    static let nationalBankWorldElite = CardTemplate(
        name: "National Bank World Elite",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Canada",
        eliteTier: .worldElite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "National Bank premium"
    )

    static let hsbcCanada = CardTemplate(
        name: "HSBC Canada",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Canada",
        eliteTier: .platinum,
        gradientColors: ["#DB0011", "#B8000E", "#F01A2A", "#95000B"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "HSBC Canada"
    )

    static let interac = CardTemplate(
        name: "Interac",
        cardNetwork: .interac,
        cardType: .debit,
        country: "Canada",
        eliteTier: .standard,
        gradientColors: ["#FF6B00", "#E56000", "#FF7A1A", "#CC5500"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Canadian debit"
    )

    // MARK: - South Africa Cards

    static let capitecBank = CardTemplate(
        name: "Capitec Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "South Africa",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Capitec"
    )

    static let fnbPrivateWealth = CardTemplate(
        name: "FNB Private Wealth",
        cardNetwork: .visa,
        cardType: .credit,
        country: "South Africa",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "FNB premium"
    )

    static let nedbankPlatinum = CardTemplate(
        name: "Nedbank Platinum",
        cardNetwork: .amex,
        cardType: .credit,
        country: "South Africa",
        eliteTier: .platinum,
        gradientColors: ["#00843D", "#006A31", "#1A9A53", "#005026"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Nedbank premium"
    )

    static let standardBankSignature = CardTemplate(
        name: "Standard Bank Signature",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "South Africa",
        eliteTier: .platinum,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Standard Bank premium"
    )

    static let absaPrivateBank = CardTemplate(
        name: "Absa Private Bank",
        cardNetwork: .visa,
        cardType: .credit,
        country: "South Africa",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Absa premium"
    )

    static let investecVisaInfinite = CardTemplate(
        name: "Investec Visa Infinite",
        cardNetwork: .visa,
        cardType: .credit,
        country: "South Africa",
        eliteTier: .infinite,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Investec private"
    )

    // MARK: - Nigeria Cards

    static let gtbankWorld = CardTemplate(
        name: "GTBank World",
        cardNetwork: .mastercard,
        cardType: .credit,
        country: "Nigeria",
        eliteTier: .worldElite,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "GTBank premium"
    )

    static let zenithBankPlatinum = CardTemplate(
        name: "Zenith Bank Visa Platinum",
        cardNetwork: .visa,
        cardType: .credit,
        country: "Nigeria",
        eliteTier: .platinum,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Zenith premium"
    )

    static let accessBank = CardTemplate(
        name: "Access Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Nigeria",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Access Bank"
    )

    static let uba = CardTemplate(
        name: "UBA",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Nigeria",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "UBA"
    )

    static let firstBank = CardTemplate(
        name: "First Bank of Nigeria",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Nigeria",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "First Bank"
    )

    static let ecobank = CardTemplate(
        name: "Ecobank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Nigeria",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Ecobank"
    )

    static let stanbicBank = CardTemplate(
        name: "Stanbic IBTC Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Nigeria",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Stanbic"
    )

    // MARK: - Kenya Cards

    static let equityBank = CardTemplate(
        name: "Equity Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Kenya",
        eliteTier: .standard,
        gradientColors: ["#E31837", "#C41230", "#FF1A3C", "#A00C28"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Equity"
    )

    static let kcbBank = CardTemplate(
        name: "KCB Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Kenya",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "KCB"
    )

    static let coOperativeBank = CardTemplate(
        name: "Co-operative Bank",
        cardNetwork: .visa,
        cardType: .debit,
        country: "Kenya",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Co-op Bank"
    )

    static let diamondBank = CardTemplate(
        name: "Diamond Trust Bank",
        cardNetwork: .mastercard,
        cardType: .debit,
        country: "Kenya",
        eliteTier: .standard,
        gradientColors: ["#0066B3", "#005294", "#1A7AC4", "#003E75"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "DTB"
    )

    // MARK: - Other Cards

    static let dinersCarteBlanche = CardTemplate(
        name: "Diners Club Carte Blanche",
        cardNetwork: .dinersClub,
        cardType: .credit,
        country: "International",
        eliteTier: .platinum,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Classic prestige card"
    )

    static let dinersBlack = CardTemplate(
        name: "Diners Club Black",
        cardNetwork: .dinersClub,
        cardType: .credit,
        country: "International",
        eliteTier: .black,
        gradientColors: ["#000000", "#1a1a1a", "#2c2c2e", "#0d0d0d"],
        patternType: .none,
        logoColor: "#FFFFFF",
        textColor: "#FFFFFF",
        description: "Diners premium"
    )

    static let dinersClub = CardTemplate(
        name: "Diners Club",
        cardNetwork: .dinersClub,
        cardType: .credit,
        country: "International",
        eliteTier: .standard,
        gradientColors: ["#1A1A2E", "#16213E", "#2A2A4E", "#0F3460"],
        patternType: .none,
        logoColor: "#E94560",
        textColor: "#FFFFFF",
        description: "Diners Club"
    )

    // MARK: - All Cards Array

    static let allCards: [CardTemplate] = [
        // USA
        amexCenturion, amexPlatinum, amexGold, amexGreen,
        amexBusinessPlatinum, amexBusinessGold, amexBusinessGreen,
        amexDeltaPlatinum, amexDeltaReserve, amexDeltaGold,
        amexHiltonAspire, amexHiltonSurpass, amexHilton,
        amexMarriottBrilliant, amexMarriottBevy, amexMarriott,
        amexBlueCashPreferred, amexBlueCashEveryday,
        amexEveryDay, amexEveryDayPreferred,
        chaseSapphireReserve, chaseSapphirePreferred,
        chaseFreedom, chaseFreedomStudent, chaseFreedomUnlimited,
        chaseUnited, chaseInkBusinessPreferred, chaseInkBusinessCash,
        chaseAmazonPrime, chaseIHG, chaseHyatt, chaseSouthwest, chaseSlate,
        jpMorganReserve,
        citiPrestige, citiAAdvantage, citiDoubleCash, citiCustomCash,
        citiSimplicity, citiCostco,
        boaPremium, boaCustomizedCash, boaTravelRewards,
        capitalOneVentureX, capitalOneSavor, capitalOneQuicksilver, capitalOnePlatinum,
        discoverIt,
        wellsFargoActiveCash, wellsFargoAutograph,
        usBankAltitudeReserve, usBankAltitudeGo,
        pncCashRewards, truistFuture,
        appleCard, appleCash, appleAccount,
        // UK
        amexUKPlatinum, amexUKGold, amexUKPreferred,
        couttsSilk, natwestBlack, natwestReward,
        hsbcPremier, barclaysAvios, barclaysPlatinum,
        lloydsWorldElite, santanderAllInOne, halifaxClarity,
        virginAtlanticReward, tsbPlatinum,
        monzoPlus, starlingBank, revolutMetal, revolutUltra,
        // UAE
        dubaiFirstRoyale, emiratesNBDInfinite, emiratesNBDPlatinum,
        adcbInfinite, emiratesIslamicInfinite, mashreqInfinite,
        fabInfinite, cbdInfinite, rakbankInfinite, noorBankWorld,
        // Russia
        sberbankInfinite, sberbankWorldElite, sberbankPlatinum,
        sberbankGold, sberbankClassic, sberbankMastercardWorld,
        sberbankMastercardPlatinum,
        tinkoffBlackEdition, tinkoffPlatinum, tinkoffBlack,
        tinkoffDrive, tinkoffS7, tinkoffPro, tinkoffJunior, tinkoffAllAirlines,
        alfa100, alfaCashback, alfaTravel, alfaAeroflot,
        vtbMulticardWorld, vtbClassic, vtbGold, vtbPlatinum, vtbMulticard,
        raiffeisenInfinite, raiffeisenGold, raiffeisenPlatinum, raiffeisenTravel,
        gazprombankInfinite, gazprombankUnionPay,
        rosbankPlatinum, rosbankWorld,
        otkritieInfinite, sovcombankHalva, mtsBankCashback, homeBank,
        tBankBlack, tBankPlatinum,
        mirPremium, mirClassic,
        // Ukraine
        privatBankUniversal, privatBankGold, privatBankPlatinum, privatBankInfinite,
        monoBankBlack, monoBankWhite, monoBankPlatinum, monoBankIron,
        aBank, senseBank, senseBankSuper, oschadBank, ukrsibBank,
        pumb, otpBank, raiffeisenUkraine, citiBankUkraine,
        forwardBank, iziBank, tascomBank, creditDnepr, bankLviv,
        concordBank,
        // Switzerland
        ubsVisaInfinite, ubsKeyClub,
        creditSuissePlatinum, creditSuisseBonviva,
        swissBankersTravelCash, postFinanceVisaPlatinum,
        zkbVisaPlatinum, raiffeisenSwissGold,
        juliusBaer, pictet, lombardOdier,
        // France
        bnpParibasInfinite, bnpParibasWorldElite,
        creditAgricoleInfinite,
        sgWorldElite, sgVisaInfinite,
        laBanquePostale, carteBleue,
        banquePopulaire, caisseEpargne, lcl,
        hsbcFrance, axaBanque, boursoramaBanque,
        helloBank, fortuneo, monabanq, ingDirectFrance,
        // Germany
        deutscheBankBlack, deutscheBankVisaPlatinum, comdirect,
        commerzbankVisaInfinite, sparkasseGold, volksbankenPremium,
        dkb, n26Metal, n26You, n26Standard,
        bunqPremium, wise, consorsbank, fidorBank,
        solarisBank, tomorrowBank,
        // Netherlands
        ingPlatinum, ingGold, rabobankPlatinum, abnAmroGold,
        triodosBank, knab,
        // Belgium
        bpostBank, kbcBank, belfius, argenta,
        // Italy
        unicreditInfinite, intesaSanpaoloPlatinum, monteDeiPaschi,
        mediobanca, finecoBank, mediolanum,
        // Spain
        santanderSpainInfinite, bbvaInfinite, caixaBankPlatinum,
        sabadell, bankia, evoBanco, openbank,
        n26Spain, revolutSpain,
        // Nordic
        nordeaVisaPlatinum, swedbankVisaPlatinum, sebVisaInfinite,
        handelsbanken, danskeBankVisaPlatinum, dnbNorway,
        opBank, danskeBankFinland,
        // Poland
        pkoBankPolski, pekao, mBank, ingPolska,
        santanderPolska, millennium, revolutPoland,
        // Czech
        ceskaSporitelna, komercniBanka, monetaMoneyBank,
        airBank, fioBanka,
        // Austria
        ersteBank, raiffeisenAustria, bankAustria,
        // Portugal
        millenniumBcp, santanderTotta, novobanco, cgd,
        // Greece
        nationalBankGreece, piraeusBank, eurobank, alphaBank,
        // Romania
        bcr, brd, bancaTransilvania, ingRomania,
        // Hungary
        otpBankHungary, khbBank, ersteBankHungary, raiffeisenHungary,
        // Bulgaria
        dskBank, unicreditBulgaria, fibank,
        // Croatia
        zagrebackaBanka, pbz, ersteBankCroatia, otpBankCroatia,
        // Asia
        icbcVisaPlatinum, icbcUnionPay, ccbVisaInfinite,
        bocVisaPlatinum,
        unionPayDiamond, unionPayPlatinum,
        hdfcInfinia, hdfcRegalia, iciciCoral,
        axisMagnus, sbiPrime, kotakWhite, scUltimate, ruPay,
        jcbTheClass, jcbGold, jcbPlatinum,
        mufjInfinite, rakutenCard,
        dbsInsignia, dbsAltitude, ocbcElite, ocbcPremier,
        uobVisaInfinite, citibankSingapore,
        maybankVisaInfinite, cimbVisaInfinite,
        shinhanBank, kbKookmin, samsungCard, hyundaiCard, lotteCard,
        westpacAltitudeBlack, anzRewardsBlack, commonwealthDiamond,
        nabSignature, macquarieBlack,
        bancoDoBrasilInfinite, itauVisaInfinite, bradescoVisaPlatinum,
        nubankUltravioleta, c6Bank, inter,
        scotiabankPassport, tdAeroplan, rbcAvion, cibcAventura,
        amexCanada, desjardinsOdyssey, nationalBankWorldElite, hsbcCanada,
        interac,
        capitecBank, fnbPrivateWealth, nedbankPlatinum,
        standardBankSignature, absaPrivateBank, investecVisaInfinite,
        gtbankWorld, zenithBankPlatinum, accessBank, uba,
        firstBank, ecobank, stanbicBank,
        equityBank, kcbBank, coOperativeBank, diamondBank,
        dinersCarteBlanche, dinersBlack, dinersClub
    ]

    static func cardsByCountry(_ country: String) -> [CardTemplate] {
        allCards.filter { $0.country == country }
    }

    static func cardsByNetwork(_ network: CardNetwork) -> [CardTemplate] {
        allCards.filter { $0.cardNetwork == network }
    }

    static func eliteCards() -> [CardTemplate] {
        allCards.filter { 
            $0.eliteTier == .centurion || 
            $0.eliteTier == .black || 
            $0.eliteTier == .reserve ||
            $0.eliteTier == .royal ||
            $0.eliteTier == .silk ||
            $0.eliteTier == .theClass ||
            $0.eliteTier == .insignia ||
            $0.eliteTier == .infinite ||
            $0.eliteTier == .worldElite
        }
    }
}
