class Book < ApplicationRecord
  belongs_to :user
	validates :title,presence:true
	validates :body,presence:true,length:{maximum:200}

  def self.looks(search, content)
    if search == "perfect_match"
      @book = Book.where(title: content) #完全一致検索 where(カラム名: "検索したい文字列")
    elsif search == "forward_match"
      @book = Book.where('title LIKE ?', content+'%')
    elsif search == "backward_match"
      Book.where('title LIKE ?', '%'+content)
    elsif search == "partial_match"
      Book.where('title LIKE ?', '%'+content+'%')
    else
      @book = Book.all
    end

  end
end
