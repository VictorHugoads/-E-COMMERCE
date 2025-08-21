-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45),
    CNPJ VARCHAR(45) UNIQUE
);

-- Tabela Terceiro - Vendedor
CREATE TABLE Terceiro (
    idTerceiro INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45),
    local VARCHAR(45)
);

-- Tabela Produtos por Vendedor
CREATE TABLE Produtos_por_Vendedor (
    idTerceiro INT,
    idProduto INT,
    quantidade VARCHAR(45),
    PRIMARY KEY (idTerceiro, idProduto),
    FOREIGN KEY (idTerceiro) REFERENCES Terceiro(idTerceiro),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Disponibilização de Produto
CREATE TABLE Disponibilizacao_de_Produto (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    local VARCHAR(45)
);

-- Tabela Estoque_has_Produto
CREATE TABLE Estoque_has_Produto (
    idEstoque INT,
    idProduto INT,
    quantidade INT,
    PRIMARY KEY (idEstoque, idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45),
    descricao VARCHAR(255),
    valor DECIMAL(10,2)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    statusPedido VARCHAR(45),
    descricao VARCHAR(255),
    idCliente INT,
    frete FLOAT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Relação de Produto p/ Pedido
CREATE TABLE Relacao_de_Produto_p_Pedido (
    idPedido INT,
    idProduto INT,
    quantidade VARCHAR(45),
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    identificacao VARCHAR(45),
    idPessoaJuridica INT,
    idPessoaFisica INT
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    meioPagamento VARCHAR(45),
    idPedido INT,
    idCliente INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Cartao
CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY AUTO_INCREMENT,
    dataPagamento VARCHAR(45),
    numeroCartao VARCHAR(45),
    valor DECIMAL(10,2),
    idPagamento INT,
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

-- Tabela Boleto
CREATE TABLE Boleto (
    idBoleto INT PRIMARY KEY AUTO_INCREMENT,
    dataPagamento VARCHAR(45),
    valor DECIMAL(10,2),
    numeroBoleto VARCHAR(45),
    pagamentoId INT,
    FOREIGN KEY (pagamentoId) REFERENCES Pagamento(idPagamento)
);

-- Tabela PJ_Pessoa_Juridica
CREATE TABLE PJ_Pessoa_Juridica (
    idPessoaJuridica INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    CNPJ VARCHAR(45),
    endereco VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela PF_Pessoa_Fisica
CREATE TABLE PF_Pessoa_Fisica (
    idPessoaFisica INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    CPF VARCHAR(45),
    endereco VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    dataGerado DATE,
    codigoRastreio VARCHAR(45) UNIQUE,
    dataEntrega DATE,
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
