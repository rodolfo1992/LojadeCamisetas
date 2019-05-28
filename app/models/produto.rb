class Produto < ApplicationRecord
	validates :quantidade, presence: true
	validates :preco, presence: true
	validates :nome, presence: true
end
