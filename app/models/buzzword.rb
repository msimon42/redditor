class Buzzword < ApplicationRecord
  def self.get_score(word_list)
    values = ActiveRecord::Base.connection.execute(
      """
        SELECT SUM(value) AS score FROM buzzwords
        WHERE #{convert_to_like(word_list)}

      """
    )

   return values.first['score'] || 0
  end

  private
    def self.convert_to_like(list)
      list.map{ |word| %Q[word = '#{word}'] }.join(' OR ')
    end
end
