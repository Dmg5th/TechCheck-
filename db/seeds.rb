Language.destroy_all
Company.destroy_all

puts 'seeding database....'

Language.create(name: 'Ruby', description: 'Ruby is an interpreted, high-level, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.', logo_image: 'https://boxchronicles.com/wp-content/uploads/2015/01/ruby.png')

Language.create(name: 'Javascript', description: 'Javascript is a high lebel programming language. Invented by Brendan Eich of Netscape in 1995.', logo_image: 'http://synergyframeworks.com/wp-content/uploads/2017/05/javascript-logo.png')

Company.create(name: 'Apple', description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services. It is considered one of the Big Tech technology companies, alongside Amazon, Google, Microsoft, and Facebook.

The company's hardware products include the iPhone smartphone, the iPad tablet computer, the Mac personal computer, the iPod portable media player, the Apple Watch smartwatch, the Apple TV digital media player, the AirPods wireless earbuds and the HomePod smart speaker. Apple's software includes macOS, iOS, iPadOS, watchOS, and tvOS operating systems, the iTunes media player, the Safari web browser, the Shazam music identifier, and the iLife and iWork creativity and productivity suites, as well as professional applications like Final Cut Pro, Logic Pro, and Xcode. Its online services include the iTunes Store, the iOS App Store, Mac App Store, Apple Music, Apple TV+, iMessage, and iCloud. Other services include Apple Store, Genius Bar, AppleCare, Apple Pay, Apple Pay Cash, and Apple Card.

Apple was founded by Steve Jobs, Steve Wozniak, and Ronald Wayne in April 1976 to develop and sell Wozniak's Apple I personal computer, though Wayne sold his share back within 12 days. It was incorporated as Apple Computer, Inc., in January 1977, and sales of its computers, including the Apple II, grew quickly. Within a few years, Jobs and Wozniak had hired a staff of computer designers and had a production line. Apple went public in 1980 to instant financial success. Over the next few years, Apple shipped new computers featuring innovative graphical user interfaces, such as the original Macintosh in 1984, and Apple's marketing advertisements for its products received widespread critical acclaim. However, the high price of its products and limited application library caused problems, as did power struggles between executives. In 1985, Wozniak departed Apple amicably and remained an honorary employee, while Jobs and others resigned to found NeXT.", logo_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/931px-Apple_Computer_Logo_rainbow.svg.png', computer_languages: "Swift, Ruby, Java, Python, C++")

Company.create(name: 'Google', description: "Google, LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware. It is considered one of the Big Four technology companies, alongside Amazon, Apple, and Microsoft.

Google was founded in September 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University in California. Together they own about 14 percent of its shares and control 56 percent of the stockholder voting power through supervoting stock. Google.com is the most visited website in the world. Several other Google services also figure in the top 100 most visited websites, including YouTube and Blogger. Google was the most valuable brand in the world in 2017 (surpassed by Amazon), but has received significant criticism involving issues such as privacy concerns, tax avoidance, antitrust, censorship, and search neutrality.", logo_image: "https://blog.hubspot.com/hubfs/image8-2.jpg", computer_languages: "Java, C++, Python, Javascript, Go")

Company.create(name: "Spotify")

puts "done."