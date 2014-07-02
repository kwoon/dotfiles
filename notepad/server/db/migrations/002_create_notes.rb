Sequel.migration do
  up do
    create_table(:notes) do
      primary_key :id
      foreign_key :user_id, :users
      String :title, null: false
      String :body,  null: false, text: true
    end
  end

  down do
    drop_table(:notes)
  end
end
