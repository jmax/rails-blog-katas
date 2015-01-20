Article.delete_all
Comment.delete_all

30.times do

  article = Article.create(
    title: Faker::Lorem.sentence(7),
    body: Faker::Lorem.paragraphs(4).join("\n"),
    published_at: 10.days.ago
  )

  10.times do
    article.comments.create(
      author: Faker::Name.name,
      body: Faker::Lorem.paragraphs(4).join("\n")
    )
  end

end
