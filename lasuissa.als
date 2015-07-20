module lasuissa

sig Cliente{
	pedido : set Pedido
}

abstract sig Comida{
}

abstract sig Bebida{
}

abstract sig Pedido{
	 comidas : set Comida,
	 bebidas : set Bebida
}

abstract sig Salgado extends Comida{
}

abstract sig Sanduiche extends Comida{
}

abstract sig Sobremesa extends Comida {
}

sig Agua extends Bebida{}
sig Refrigerante extends Bebida{}
sig Suco extends Bebida{}

sig Coxinha extends Salgado{}
sig Empada extends Salgado{}
sig Pastel extends Salgado{}

sig SanduicheFrango extends Sanduiche{}
sig SanduicheAtum extends Sanduiche{}

sig Pudim extends Sobremesa{}
sig Torta extends Sobremesa{}
sig Brigadeiro extends Sobremesa{}

sig PedidoConvencional extends Pedido{}
sig Pacote extends Pedido {}
fact Cliente{
all c:Cliente| #c.pedido = 1
all p:Pedido| p in Cliente.pedido

}
fact pedido{
all c: Comida| c in Pedido.comidas
all b: Bebida| b in Pedido.bebidas
}
fact Pacote{
all p:Pacote |some p.comidas 
all p:Pacote| some p.bebidas
}
pred show[]{}
run show 


