# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :post do |f|
  f.title "MyString"
  f.body "MyText"
  f.association :author, :factory => :user
end

Factory.define :published_post, :parent => :post do |f|
  f.aasm_state 'published'
end

Factory.define :special_post, :parent => :post do |f|
  f.aasm_state 'published'
  f.created_at DateTime.new(2012, 1, 1, 1, 1, 1)
  f.association :author, :factory => :user_jonh
end

