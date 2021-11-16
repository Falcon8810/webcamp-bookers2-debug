class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
    @book_comment_new = BookComment.new
    #９行目自分で考えた。
    #book_comments/create.js.erbの3行目の記述も必要ないが、
    #この９行目を追加することで実装が可能に
    #こういう発見がすごく大事だと思う

    if @book_comment.save
    else
      @user = @book.user
      render "books/show"
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
  end



end
