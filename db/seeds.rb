6.times do 
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        age: rand(20..40),
        location: "New York, NY",
        bio: Faker::Lorem.paragraphs.join("\n")
    )
end

conditions = ["worn", "used", "like-new", "barely used", "never used", "some wear and tear", "missing one piece", "like trash"]

15.times do
    Item.create(
        name: Faker::House.furniture,
        description: Faker::Lorem.paragraph,
        condition: conditions.sample,
        category: "furniture",
        trade: true,
        user: User.all.sample
    )
end
questions = ["What is this?", "When was this bought?", "Is this worn?", "Are there scratches?", "Is this kid/pet safe?", "Was this refurbished?", "How old is this?", "Why are you giving this away?" ]

10.times do 
    QuestionAnswer.create(
        question: questions.sample,
        answer: "",
        item: Item.all.sample
    )
end

offers_users = []
3.times do 
    sample_user = (User.all - offers_users).sample
    w_items = sample_user.items
    o_items = Item.all - w_items
    w_items.each do |wanted|
        3.times do 
            Offer.create(
                date: Time.now.strftime("%d/%m/%Y"),
                status: false,
                wanted_item: wanted,
                offered_item: o_items.sample
            )
        end
    end
    offers_users << sample_user
end

reviewed_users = []

3.times do
    sample_reviewee = (User.all - reviewed_users).sample
    3.times do 
        Review.create(
            reviewee: sample_reviewee,
            reviewer: User.all.reject{|u| u == sample_reviewee}.sample,
            review: Faker::Lorem.paragraphs.join("\n")
        )
    end
    reviewed_users << sample_reviewee
end