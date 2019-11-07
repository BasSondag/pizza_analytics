class CreateTablePizzas < Sequel::Migration

  def up
    create_table :pizzas do
      primary_key :id
      column :type, :text
      column :eaten_at, :text
      foreign_key :person_id, :users
      column :created_at, :timestamp, default: "now()"
      column :updated_at, :timestamp, default: "now()"
    end
  end

  def down
    drop_table :pizzas
  end

end
