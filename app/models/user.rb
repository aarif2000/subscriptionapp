class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # x :lockable, :timeoutable,  and :omniauthable
  devise :invitable, :database_authenticatable,
         :registerable,
          :trackable,
          :confirmable,
         :recoverable,
          :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2, :github]

         def self.from_omniauth(access_token)
          # data = access_token.info
          user = User.where(email: access_token.info.email).first
      
          unless user
              user = User.create(
                 email: access_token.info.email,
                 password: Devise.friendly_token[0,20]
              )
          end
          user.provider =access_token.provider 
          user.uid =access_token.uid 
          user.name =access_token.info.name
          user.image =access_token.info.image 
          user.save 
          user
          
      end

      def username 
        if name? 
            name 
        else 
        email.split(/@/).first 
        end
      end
      
end
