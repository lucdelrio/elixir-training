import Config

config :ex_aws,
  json_codec: Jason,
  # access_key_id: {:system, "AWS_ACCESS_KEY_ID"},
  # secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY"}
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, {:awscli, "phinx", 30}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, {:awscli, "phinx", 30}, :instance_role]