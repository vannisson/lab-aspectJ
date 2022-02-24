package aspectos;

import contas.Conta;

public aspect Mensagens {

	before(double valor, Conta c) : pcCreditar(valor,c){
		System.out.println("Saldo Anterior: " + c.getSaldo());
	}

	after(double valor, Conta c) : pcCreditar(valor, c){
		System.out.println("Saldo Atual: " + c.getSaldo());
	}

	pointcut pcCreditar(double valor, Conta c): call(public * creditar(..)) && target(c)
	&& args (valor);

}
