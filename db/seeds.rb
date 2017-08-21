# Usage: rails db:seed or created alongside the database with rails db:setup

user = User.create! :email => 'test@test.com', :password => 'TestTest', :password_confirmation => 'testtest', :admin => true, :first_name => "Test", :last_name => "mcTest", :address => "100 Test Road", :suburb => "Test Suburb", :zip => "2000", :state => "State", :phone => "9999999999"