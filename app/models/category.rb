class Category < ApplicationRecord
  has_many :challenges
  has_many :tips

  include PgSearch::Model
  scope :sorted, -> { order(name: :asc) }

  pg_search_scope :search,
                  against: [
                    :name
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
    then Category.search(keyword)
    else Category.all
    end.sorted
  end
end
