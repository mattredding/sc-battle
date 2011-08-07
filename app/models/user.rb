class User < ActiveRecord::Base
  has_many :tracks
  has_and_belongs_to_many :battles

  def self.soundcloud_client(options={})
    options = {
      :client_id     => APP_CONFIG['SOUNDCLOUD_KEY'],
      :client_secret => APP_CONFIG['SOUNDCLOUD_SECRET'],
    }.merge(options)

    Soundcloud.new(options)
  end

  def soundcloud_client(options={})
    options= {
      :expires_at    => soundcloud_expires_at,
      :access_token  => soundcloud_access_token,
      :refresh_token => soundcloud_refresh_token
    }.merge(options)

    client = self.class.soundcloud_client(options)

    # define a callback for successful token exchanges
    # this will make sure that new access_tokens are persisted once an existing
    # access_token expired and a new one was retrieved from the soundcloud api
    client.on_exchange_token do
      self.update_attributes!({
        :soundcloud_access_token  => client.access_token,
        :soundcloud_refresh_token => client.refresh_token,
        :soundcloud_expires_at    => client.expires_at,
      })
    end

    client
  end
end
