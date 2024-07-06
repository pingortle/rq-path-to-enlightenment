# TODO: Figure out how to skip pwned password check and password length check
module Seeds
  class User < User
    def self.seed!(email:, password:)
      user = find_or_create_by!(email: email) do
        _1.password = generate_password
      end

      user.update_attribute(:password, password)
    end

    def self.generate_password
      SecureRandom.alphanumeric(12)
    end
  end
end

Seeds::User.seed!(email: "admin@example.com", password: "password")
