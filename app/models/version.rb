class Version < ActiveRecord::Base
  belongs_to :document
  has_many :posts
  has_attached_file :attachment,
            styles: { medium: "300x300>", thumb: "100x100>" },
            url: "/assets/arts/:id/:style/:basename.:extension", # 画像保存先のURL先
	          path: "#{Rails.root}/public/assets/arts/:id/:style/:basename.:extension" # サーバ上の画像保存先パス
  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
