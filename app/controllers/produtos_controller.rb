class ProdutosController < ApplicationController
	def index
		@produtos_por_id = Produto.all.order(:id).limit 10
		@produtos_por_preco = Produto.all.order(:preco).limit 10
	end
	def new
		@produto = Produto.new
	end
	def busca
		nome = "%#{params[:nome]}%"
		@produtos = Produto.where "nome like ?", nome
	end
	def create
		valores = params.require(:produto).permit :nome, :preco, :descricao, :quantidade
		@produto = Produto.new valores
		if @produto.save
			@mensagem = "Produto Salvo com sucesso"
		redirect_to root_url
	else	
		render :new
	end
end

	def destroy 
		id = params[:id]
		Produto.destroy id
		redirect_to root_url
	end
end