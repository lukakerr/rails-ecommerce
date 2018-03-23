# Usage: rails db:seed or created alongside the database with rails db:setup

User.delete_all
User.create! :email => "test@test.com", :password => "TestTest", :password_confirmation => "TestTest", :admin => true, :first_name => "Test", :last_name => "Test", :phone => "9999999999"

Banner.delete_all
Banner.create! :name => "Home Page Banner", :user_id => 1

Page.delete_all
Page.create! :name => "Contact Us", :content => "<h3 style='text-align: center;'>Get in touch below</h3>", :user_id => 1, :contact_form => true, :published => true, :position => 1

Category.delete_all
Category.create! :name => "Cushions", :user_id => 1

Product.delete_all
Product.create! :name => "Product 1", :description => "A great product", :price => 10.50, :old_price => 12.80, :on_sale => true, :sold_out => false, :featured => false, :quantity => 1, :category_id => 1, :user_id => 1

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"