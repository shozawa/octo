class Document < ActiveRecord::Base
  has_one :board, as: :boardable, dependent: :destroy
end
