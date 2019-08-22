1.upto(10) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/lady.jpg"),
                        product_id: n
                      )
end
11.upto(20) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/man.jpg"),
                        product_id: n
                      )
end
21.upto(30) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/kids.jpg"),
                        product_id: n
                      )
end
31.upto(40) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/interior.jpg"),
                        product_id: n
                      )
end
41.upto(50) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/book.jpg"),
                        product_id: n
                      )
end
51.upto(60) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/toy.jpg"),
                        product_id: n
                      )
end
61.upto(70) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/perfume.jpg"),
                        product_id: n
                      )
end
71.upto(80) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/bakery.jpg"),
                        product_id: n
                      )
end
81.upto(90) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/sports.jpg"),
                        product_id: n
                      )
end
91.upto(100) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/handmade-soap.jpg"),
                        product_id: n
                      )
end
111.upto(120) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/ticket.png"),
                        product_id: n
                      )
end
121.upto(130) do |n|
  ProductImage.create!(id: n,
                        image_url: open("#{Rails.root}/db/images/etc.jpg"),
                        product_id: n
                      )
end