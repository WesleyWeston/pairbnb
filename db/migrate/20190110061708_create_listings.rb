class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :title , null: false
    	t.string :description
    	t.string :address, null: false
    	t.string :property_type, null: false
    	t.string :accomodation_type, null: false
        t.integer :price
    	t.integer :bedrooms, null: false
    	t.integer :occupant_limit, null: false
        t.boolean :verified, default: false
    	t.belongs_to :user, null: false
       
    end
  end
end
