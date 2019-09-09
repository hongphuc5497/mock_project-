10.times do |n|
  Location.create(province: Faker::Address.country)
  Category.create(category_name: Faker::Name.name)
  Tag.create(tag_name: Faker::Name.name)

  number  = 0
  number  += n
  
  Blog.create(location_id: number, impressions_count: Faker::Number.number(digits: 2))
  BlogDetail.create(blog_id: number , title: "Blog_#{number}", content: Faker::Lorem.paragraph(sentence_count: 10))
  Hashtag.create(blog_id: number, tag_id: number)
  RelativeCategory.create(blog_id: number, category_id: number)
end