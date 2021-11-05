class SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect_match'
        User.where(name: content)
      elsif method == 'partial_match'
        User.where('name LIKE ?', "%#{content}%" )
      elsif method == 'forword_match'
        User.where('name LIKE?', "#{content}%")
      elsif method == 'backword_match'
        User.where('name LIKE?', "%#{content}")
      else
        User.all
      end
    elsif model == 'book'
      if method == 'perfect_match'
        Book.where(title: content)
      elsif method == 'partial_match'
        Book.where('title LIKE ?', "%#{content}%" )
      elsif method == 'forword_match'
        Book.where('title LIKE?', "#{content}%")
      elsif method == 'backword_match'
        Book.where('title LIKE?', "%#{content}")
      else
        Book.all
      end
    end
  end
end
