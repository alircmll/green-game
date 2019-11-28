class Challenge < ApplicationRecord
  belongs_to :category
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
    then Challenge.search(keyword)
    else Challenge.all
    end
  end
end
