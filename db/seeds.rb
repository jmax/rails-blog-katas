
30.times do

  Article.create(
    title: Faker::Lorem.sentence(7),
    body: Faker::Lorem.paragraphs(4).join("\n"),
    published_at: 10.days.ago
  )

end
