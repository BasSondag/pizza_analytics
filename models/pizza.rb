class Pizza < Sequel::Model(DB)
  many_to_one :user, key: :person_id
end
