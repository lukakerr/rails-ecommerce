# Usage: rails db:seed or created alongside the database with rails db:setup
# Note: 
#   - images are created for categories, products etc. Place these in db/seed/images
#   - db/seed/images is under .gitignore so you will have to create this folder
#   - the filenames of images can be found below (search for .jpeg/jpg filenames)

OrderItem.delete_all
Order.delete_all
Picture.delete_all
Upload.delete_all
Checkout.delete_all

$image_id = 1

# Get an image file object by passing in the filename
def image(filename)
  if not File.file?(File.join(Rails.root, 'db', 'seed', 'images', filename))
    abort("Error: please ensure the file named #{filename} exists")
  end

  File.new(File.join(Rails.root, 'db', 'seed', 'images', filename))
end

# Seed an image by passing its file name, imageable type (e.g. Banner, Product) 
# and imageable id (the id of the object being the image belongs to)
def seed_image(filename, imageable_type, imageable_id)
  Picture.create!(
    :id => $image_id,
    :image => image(filename),
    :imageable_type => imageable_type,
    :imageable_id => imageable_id
  )
  $image_id += 1
end

# Users
User.delete_all
User.create!(
  :id => 1,
  :email => "test@test.com",
  :password => "TestTest",
  :password_confirmation => "TestTest",
  :admin => true,
  :first_name => "Test",
  :last_name => "Test",
  :phone => "9999999999"
)

# Create banner with banner images
Banner.delete_all
Banner.create!(
  :id => 1,
  :name => "Home Page Banner",
  :user_id => 1
)
seed_image("banner1.jpeg", "Banner", 1)
seed_image("banner2.jpeg", "Banner", 1)
seed_image("banner3.jpeg", "Banner", 1)

# Pages
Page.delete_all
Page.create!(
  :id => 1,
  :name => "Contact Us",
  :content => "<h3 style='text-align: center;'>Get in touch below</h3>",
  :user_id => 1,
  :contact_form => true,
  :published => true,
  :position => 1
)

# Categories
Category.delete_all
Category.create!(
  :id => 1,
  :name => "Cushions",
  :image => image("category1.jpeg"),
  :user_id => 1
)
Category.create!(
  :id => 2,
  :name => "Rugs",
  :image => image("category2.jpeg"),
  :user_id => 1
)
Category.create!(
  :id => 3,
  :name => "Tables",
  :image => image("category3.jpeg"),
  :user_id => 1
)
Category.create!(
  :id => 4,
  :name => "Chairs",
  :image => image("category4.jpeg"),
  :user_id => 1
)

# Products
Product.delete_all
Product.create!(
  :id => 1,
  :name => "Cushion One",
  :description => "A great cushion perfect for any home",
  :price => 10.50,
  :old_price => 12.80,
  :on_sale => true,
  :sold_out => false,
  :featured => false,
  :quantity => 28,
  :category_id => 1,
  :user_id => 1
)
seed_image("product1.jpg", "Product", 1)

# Order statuses
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"