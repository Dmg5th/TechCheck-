Language.destroy_all

puts 'seeding database....'

Language.create(name: 'Ruby', description: 'Ruby is an interpreted, high-level, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan.', logo_image: 'https://boxchronicles.com/wp-content/uploads/2015/01/ruby.png', companies: 'Airbnb.
Crunchbase. Ask.fm. Bloomberg. Dribbble.com. GitHub. Fiverr. Yellow Pages.')

Language.create(name: 'Javascript', description: 'Javascript is a high lebel programming language. Invented by Brendan Eich of Netscape in 1995.', logo_image: 'http://synergyframeworks.com/wp-content/uploads/2017/05/javascript-logo.png', companies: 'Microsoft. PayPal. Netflix. Uber. Groupon. Facebook. Google.')

puts "done."