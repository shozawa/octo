class Post < ActiveRecord::Base
  belongs_to :version

  def ex_version
    pattern = %r((?:\A|\s)\[version=(\d+)\])
    self.content.scan(pattern).flatten.first.to_i
  end
end
