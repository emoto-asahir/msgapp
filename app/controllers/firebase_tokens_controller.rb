class FirebaseTokensController < ActionController::Base
    def self.get_custom_token(uid)
        auth_file = File.join(Rails.root, 'config','chat-d235b49900e9.json')
        auth_data = open(auth_file) do |data|
            JSON.load(data)
        end
        service_account_email = auth_data['client_email']
        private_key = OpenSSL::PKey::RSA.new auth_data['private_key']
        now_seconds = Time.now.to_i
        payload = {
      :iss => service_account_email,
      :sub => service_account_email,
      :aud => 'https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit',
      :iat => now_seconds,
      :exp => now_seconds + ( 60 * 60 ), # Maximum expiration time is one hour
      :uid => uid,
      :claims => {:premium_account => false}
        }
        JWT.encode(payload, private_key, 'RS256')
    end
    
    def show_token
        uid = params[:id]
        data = {"uid" => uid,"token" => FirebaseTokensController.get_custom_token(uid)}
        render :json => data
    end
    
end