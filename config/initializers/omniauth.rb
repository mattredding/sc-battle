Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fVmohsS3LBUSZbG5ciweHA', 'eaQFzHQMQiJo91FpqAer4G5rkpGuggGRfQUPLfaNx5s'
  provider :soundcloud, 'DeDNYH72GVOkmSU6gBtIDA', 'TZmM0XbY5NCfNBwM1Qq5zV0KAP3SZDyex9WqXOsDGE'
end