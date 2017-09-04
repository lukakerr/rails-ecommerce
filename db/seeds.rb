# Usage: rails db:seed or created alongside the database with rails db:setup

User.delete_all
User.create! :email => 'test@test.com', :password => 'TestTest', :password_confirmation => 'TestTest', :admin => true, :first_name => "Test", :last_name => "Test", :address => "100 Test Road", :suburb => "Test Suburb", :zip => "2000", :state => "State", :phone => "9999999999"

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"