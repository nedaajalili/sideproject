class WelcomeController < ApplicationController
  def index
    if params[:word]
      @articles = Article.all
      @word = params[:word].downcase
      @articles.each do |article|
        text = article.text
        freq = word_frequency(text,@word)
        article.frequency = freq
        article.word = @word
      end
      @articles = @articles.sort_by {|art| art.frequency}.reverse
    end
  end

  def show
    @word = word_param
    @article = Article.find(params[:id])
  end

  private
  def word_frequency(text, word)
    frequency = Hash.new(0)
    text.each_line do |line|
      line.gsub(/[-0123456789!@#$%^&*()-=_+|;':",.<>?']/, '').gsub('  ', '').squeeze(' ').downcase.split(' ').each do |w|
        if word == w
          frequency[w] = frequency[w] + 1
        end
      end
    end
    frequency[word]
  end
end
