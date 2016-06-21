class BasicLtiKey < ActiveRecord::Base
    self.table_name = "exp_blti_keys"

    validates :oauth_consumer_key, length: { minimum: 10, maximum: 255, message: "must be between 4 and 255 characters long" }
    validates :secret, length: { minimum: 4, maximum: 10, message: "must be between 4 and 10 characters long" }
    validates :name, length: { minimum: 6, maximum: 255, message: "must be between 6 and 255 characters long"  }
    validates :context_id, length: { minimum: 6, maximum: 255, message: "must be between 6 and 255 characters long" }
    validates :url_segment, uniqueness: true
    validates :url_segment, format: {with: /([A-Za-z0-9\/_\-.])\w+/,
               message: "only allows letters, numbers, underscores '_', hyphens '-' and forward slashes '/'"}
end
