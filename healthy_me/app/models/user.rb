class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :omniauthable

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def fit_client
    config = {}
    data = request.env["omniauth.auth"]
    config[:oauth] = {consumer_key: ENV["FITBIT_CLIENT_KEY"],
          consumer_secret: ENV["FITBIT_CLIENT_SECRET"],
          ssl: true,
          token: data.credentials.token,
          secret: data.credentials.secret}

    client = Fitgem::Client.new(config[:oauth])

    client.activities_on_date('today') #works!

    current_user.fitbit_token = data.credentials.token
    current_user.fitbit_secret = data.credentials.secret
   
    current_user.save!
    #redirect_to :users
  end 

end
