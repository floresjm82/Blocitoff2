
RSpec.describe User, type: :model do

  let(:user) {User.create!(name: "Test User", email: "user@test.com", password: "helloworld")}

# Validating name
  	it {should validate_presence_of(:name)}
  	it {should validate_length_of(:name).is_at_least(1)}

# Validating email
	it {should validate_presence_of(:email)}
	it {should validate_length_of(:email).is_at_least(3)}
	it {should allow_value("user@test.com").for(:email)}
	it {should_not allow_value("usertest.com").for(:email)}

# Validating password
	it {should validate_presence_of(:password)}
	it {should have_secure_password}
	it {should validate_length_of(:password).is_at_least(8)}

	describe "attributes" do
		it "should respond to name"
			expect(user).to respond_to(:name)
		end

		it "should respond to email" do
			expect(user).to respond_to(:email)
		end
	end

# Tests for an Invalid User

	describe "invalid user" do

	  let(:user_with_invalid_name) {User.new(name: "", email: "user@test.com")}
	  let(:user_with_invalid_email) {User.new(name: "Test User", email: "")}
	  let(:user_with_invalid_email_format {User.new(name: "Test User", email: "invalidformat.com")})

	  it "should be an invalid user to due to blank name" do
	  	expect(user_with_invalid_name).to_not be_valid
	  end

	  it "should be an invalid user due to blank email" do
	  	expect(user_with_invalid_email).to_not be_valid
	  end

	  it "should be an invalid user due to incorrectly formatted email address" do
	  	expect(user_with_invalid_email_format).to_not be_valid
	  end
	end
	
end

