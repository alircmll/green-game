class Tip < ApplicationRecord
  belongs_to :user
  has_many :votes
  include PgSearch::Model

  pg_search_scope :search,
                  against: [
                    :title,
                    :description
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }


private

  def self.perform_search(keyword)
    if keyword.present?
    then Tip.search(keyword)
    else Tip.all
    end
  end
end
