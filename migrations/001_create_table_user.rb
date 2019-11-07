class CreateTableUsers < Sequel::Migration

  def up
    create_table :users do
      primary_key :id
      column :name, :text, :unique => true, :null =>false
      column :created_at, :timestamp, default: "now()"
      column :updated_at, :timestamp, default: "now()"
    end
  end

  def down
    drop_table :users
  end

end
