class User < Sequel::Model(DB)
  one_to_many :pizzas, key: :person_id
end
