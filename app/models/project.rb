class Project < ActiveRecord::Base
  attr_accessible :name

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE ?",
                        "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
