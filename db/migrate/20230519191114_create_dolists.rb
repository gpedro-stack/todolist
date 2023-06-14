class CreateDolists < ActiveRecord::Migration[7.0]
  def change
    create_table :dolists do |t|
      t.string :day

      t.timestamps
    end
  end
end
