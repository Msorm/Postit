class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|

	t.boolean :vote
	t.integer :user_id
	t.references :voteable, polymorphic: true #This creates a voteable_type and voteable_id
	t.timestamps
	
    end
  end
end
