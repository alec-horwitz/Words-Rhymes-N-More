class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :word_list
      t.string :action
      t.string :result
      t.string :repetitions

      t.timestamps
    end
  end
end
