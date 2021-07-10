class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.user_id = current_user.id
		if @book_comment.save
			render "show"
			# binding.pry
  		# redirect_to book_path(@book.id)
  		# render 'books/show'
		# else
		#   render 'books/show'
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
  		@book_comment = @book.book_comments.find(params[:id])
		if @book_comment.destroy
		# redirect_to request.referer
		  #render 'books/show'
		  render "show"
		end
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment,:book_id, :user_id)
	end
end
