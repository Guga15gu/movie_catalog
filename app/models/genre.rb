class Genre < ApplicationRecord
  has_many :directors, :movies

end

end
