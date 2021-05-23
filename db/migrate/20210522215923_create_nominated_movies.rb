class CreateNominatedMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :nominated_movies do |t|
      t.string :name

      t.timestamps
    end
  end
end
