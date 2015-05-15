class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  before_create { generate_token(:auth_token) }
    validates :name, :email, presence: true # 保证必须有这些数据
    validates :name, :email, uniqueness: {case_sensitive: false} # 唯一并忽略大小写

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    def avatar
      gravatar_id = Digest::MD5.hexdigest(self.email.downcase) if self.email
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=512&d=retro"
    end
  end
