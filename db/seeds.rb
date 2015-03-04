class Seed
  def self.category_seed
    category_list = ["job offered", "gig offered", "resume / job wanted", "housing offered","housing wanted","for sale by owner", "for sale by dealer","wanted by owner", "wanted by dealer", "service offered", "personal / romance", "community","event / class"]
    category_list.each do |category|
      Category.create(name: category)
    end
  end

  def self.post_seed
    20.times do
      post = Post.create(title: Faker::Lorem.sentence,
                  body: Faker::Lorem.paragraph,
                  location: Faker::Internet.url,
                  email: Faker::Internet.safe_email,
                  phone: Faker::PhoneNumber.phone_number,
                  category_id: (rand(13)+1))
      post.generate_edit_key
    end
  end
end

Seed.category_seed
Seed.post_seed