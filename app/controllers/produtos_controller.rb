class ProdutosController < ApplicationController
	def index
		@produtos_por_nome = Produto.all.order(:nome).limit 20
		@produtos_por_preco = Produto.all.order(:preco).limit 20
	end

	def create
		valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
		produto = Produto.create valores
	end
end