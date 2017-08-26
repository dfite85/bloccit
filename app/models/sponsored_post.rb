class SponsoredPost < ActiveRecord::Base
    belongs_to :topic
    has_many :post
end
