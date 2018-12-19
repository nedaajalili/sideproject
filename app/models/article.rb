class Article < ApplicationRecord

  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :word
  attr_accessor :frequency
  validates :title, presence: true, length: { minimum: 5 }

  def self.params
    @params
  end

  def persisted?
    false
  end

  # def initialize
  #   @word = word
  #   @frequency = frequency
  # end

  def process
    self.word = word
  end
end
