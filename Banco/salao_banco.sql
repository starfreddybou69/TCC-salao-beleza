drop schema if exists SalaodeBeleza;
create schema SalaodeBeleza;
use SalaodeBeleza;

set lc_time_names = 'pt_BR';

create table banner (
    cd_imagem_banner int,
    nm_imagem_banner varchar(255),
    constraint pk_imagem primary key (cd_imagem_banner , nm_imagem_banner)
);

create table imagem (
    nm_imagem varchar(255),
    nm_pasta_imagem varchar(255),
    constraint pk_imagem primary	 key (nm_imagem , nm_pasta_imagem)
);

create table categoriaDeServico (
  cd_categoria_servico int, 
 nm_categoria_servico varchar(45),
 nm_imagem varchar(255),
	nm_pasta_imagem varchar(255),
constraint pk_categoriadeservico primary key(cd_categoria_servico),
constraint fk_categoriadeservico foreign key (nm_imagem, nm_pasta_imagem)
references imagem (nm_imagem, nm_pasta_imagem)
);

create table servico (
    cd_servico int,
    nm_servico varchar(45),
    ds_servico varchar(45),
    vl_servico double,
    hr_tempo_duracao time,
    cd_categoria_servico int,
    constraint pk_servico primary key (cd_servico),
    constraint fk_servico foreign key (cd_categoria_servico)
        references categoriadeservico (cd_categoria_servico)
);

create table servicoImagem (
    nm_imagem varchar(255),
    nm_pasta_imagem varchar(255),
    cd_servico int,
    ic_principal boolean,
    constraint pk_categoriaDeServico primary key (nm_imagem , nm_pasta_imagem , cd_servico),
    constraint fk_servicoImagemImagem foreign key (nm_imagem , nm_pasta_imagem)
        references imagem (nm_imagem , nm_pasta_imagem),
    constraint fk_servicoimagemservico foreign key (cd_servico)
        references servico (cd_servico)
);

create table cupomDesconto (
    cd_cupom_desconto int,
    vl_porcentagem_de_desconto int,
    constraint pk_cupomDesconto primary key (cd_cupom_desconto)
);

create table cupomServico (
    cd_cupom_desconto int,
    cd_servico int,
    constraint pk_cupomServico primary key (cd_cupom_desconto , cd_servico),
    constraint fk_cupomServico foreign key (cd_servico)
        references servico (cd_servico),
    constraint fk2_cupomServico foreign key (cd_cupom_desconto)
        references cupomDesconto (cd_cupom_desconto)
);

create table tipoDeProduto (
    cd_tipo_produto int,
    nm_tipo_produto varchar(45),
    constraint pk_tipoDeProduto primary key (cd_tipo_produto)
);

create table produto (
    cd_produto int,
    nm_produto varchar(45),
    vl_produto double,
    ds_produto varchar(255),
    cd_tipo_produto int,
    constraint pk_produto primary key (cd_produto),
    constraint fk_produto foreign key (cd_tipo_produto)
        references tipoDeProduto (cd_tipo_produto)
);

create table temporada (
    cd_temporada int,
    dt_inicio_temporada date,
    dt_termino_temporada date,
    constraint pk_temporada primary key (cd_temporada)
);

create table tipoPremio (
    cd_tipo_premio int,
    nm_tipo_premio varchar(45),
    constraint pk_tipoPremio primary key (cd_tipo_premio)
);

create table premio (
    cd_premio int,
    cd_temporada int,
    cd_tipo_Premio int,
    cd_cupom_desconto int,
    cd_servico int,
    cd_produto int,
    nm_premio varchar(45),
    qt_pontos_premio int,
    constraint pk_premio primary key (cd_premio , cd_temporada , cd_tipo_premio),
    constraint fk_premio foreign key (cd_temporada)
        references temporada (cd_temporada),
    constraint fk2_premio foreign key (cd_tipo_premio)
        references tipoPremio (cd_tipo_premio),
    constraint fk3_premio foreign key (cd_cupom_desconto , cd_servico)
        references cupomServico (cd_cupom_desconto , cd_servico),
    constraint fk4_premio foreign key (cd_produto)
        references produto (cd_produto)
);

create table cliente (
    nm_email_cliente varchar(45),
    nm_usuario_cliente varchar(45),
    nm_senha_cliente varchar(45),
    qt_pontos_cliente varchar(45),
    constraint pk_cliente primary key (nm_email_cliente)
);

create table premioCliente (
    cd_premio int,
    cd_temporada int,
    nm_email_cliente varchar(45),
    constraint pk_premioCliente primary key (cd_premio , cd_temporada , nm_email_cliente),
    constraint fk_premioCliente foreign key (cd_premio , cd_temporada)
        references premio (cd_premio , cd_temporada),
    constraint fk2_premioCliente foreign key (nm_email_cliente)
        references cliente (nm_email_cliente)
);

create table tipoDeFuncionario (
    cd_tipo_funcionario int,
    nm_tipo_funcionario varchar(45),
    constraint pk_tipoDeFuncionario primary key (cd_tipo_funcionario)
);

create table funcionario (
    cd_funcionario int,
    cd_tipo_funcionario int,
    nm_funcionario varchar(45),
    nm_email_funcionario varchar(45),
    nm_senha_funcionario varchar(45),
	nm_imagem varchar(255),
	nm_pasta_imagem varchar(255),
	constraint fk_funcionarioimagem foreign key (nm_imagem, nm_pasta_imagem)
	references imagem (nm_imagem, nm_pasta_imagem),
    constraint pk_funcionario primary key (cd_funcionario),
    constraint fk_funcionario foreign key (cd_tipo_funcionario)
        references tipoDeFuncionario (cd_tipo_funcionario)
);

create table funcionarioServico (
    cd_funcionario int,
    cd_servico int,
    constraint pk_funcionarioServico primary key (cd_funcionario , cd_servico),
    constraint fk_funcionarioServico foreign key (cd_funcionario)
        references funcionario (cd_funcionario),
    constraint fk2_funcionarioServico foreign key (cd_servico)
        references servico (cd_servico)
);

create table diaDeTrabalho (
    cd_dia_trabalho int,
    nm_dia_de_trabalho varchar(45),
    constraint pk_diaDeTrabalho primary key (cd_dia_trabalho)
);

create table funcionarioServicoDiaDeTrabalho (
    cd_dia_trabalho int,
    hr_funcionario_serviço_dia_de_trabalho time,
    cd_funcionario int,
    cd_servico int,
    constraint pk_funcionarioServicoDiaDeTrabalho primary key (cd_dia_trabalho , cd_funcionario , cd_servico , hr_funcionario_serviço_dia_de_trabalho),
    constraint fk_funcionarioServicoDiaDeTrabalho foreign key (cd_funcionario , cd_servico)
        references funcionarioServico (cd_funcionario , cd_servico),
    constraint fk2_funcionarioServicoDiaDeTrabalho foreign key (cd_dia_trabalho)
        references diaDeTrabalho (cd_dia_trabalho)
);

create table avaliacao (
			 cd_avaliacao int,
		cd_funcionario int,
		cd_servico int,
		nm_email_cliente varchar(45),
		vl_avaliacao int,
		ds_avaliacao varchar(450), 
		dt_avaliacao date,
		constraint pk_avaliação primary key (cd_avaliacao,cd_funcionario,cd_servico,nm_email_cliente),
		constraint fk_avaliacao foreign key (cd_funcionario, cd_servico)
		references funcionarioServico (cd_funcionario, cd_servico),
		constraint fk2_avaliacao foreign key (nm_email_cliente)
		references cliente (nm_email_cliente)
);

create table agendamento (
	cd_agendamento varchar(45),
	dt_agendamento date,
	ic_presenca_funcionario_agendamento bool,
	ic_presenca_cliente_agendamento bool,
	nm_email_cliente varchar(45),
	cd_funcionario int,
	cd_servico int,
	hr_funcionario_serviço_dia_de_trabalho time,
	cd_dia_trabalho int,
	cd_cupom_desconto int,
	constraint pk_agendamento primary key(cd_agendamento),
	constraint fk_agendamento foreign key (nm_email_cliente)
	references cliente (nm_email_cliente),
	constraint fk2_agendamento foreign key (cd_dia_trabalho, cd_funcionario, cd_servico,hr_funcionario_serviço_dia_de_trabalho)
	references funcionarioServicoDiaDeTrabalho(cd_dia_trabalho, cd_funcionario, cd_servico,hr_funcionario_serviço_dia_de_trabalho),
	constraint fk3_agendamento foreign key (cd_cupom_desconto)
	references cupomDesconto(cd_cupom_desconto)
);

create table produtoAgendamento (
    cd_produto int,
    cd_agendamento varchar(45),
    constraint pk_produtoAgendamento primary key (cd_produto , cd_agendamento),
    constraint fk_produtoAgendamento foreign key (cd_produto)
        references produto (cd_produto),
    constraint fk2_produtoAgendamento foreign key (cd_agendamento)
        references agendamento (cd_agendamento)
);

create table tipoDeOcorrencia (
    cd_tipo_ocorrencia int,
    nm_ocorrencia varchar(45),
    constraint pk_tipoDeOcorrencia primary key (cd_tipo_ocorrencia)
);

create table Ocorrencia (
    cd_agendamento int,
    cd_tipo_ocorrencia int,
    ds_ocorrencia varchar(255),
    constraint pk_Ocorrencia primary key (cd_tipo_ocorrencia , cd_agendamento),
    constraint fk_Ocorrencia foreign key (cd_tipo_ocorrencia)
        references tipoDeOcorrencia (cd_tipo_ocorrencia)
);

/*inserts img*/
insert into imagem values('corte.png', 'Categorias');
insert into imagem values('cilios.png', 'Categorias');
insert into imagem values('unha.png', 'Categorias');
insert into imagem values('labio.png', 'Categorias');
insert into imagem values('sombrancelha.png', 'Categorias');
insert into imagem values('progressiva-semformol.jpg', 'Servicos');
insert into imagem values('teste.jpg', 'Servicos');
insert into imagem values('cilios1.jpg','Servicos');
insert into imagem values('cilios2.jpg','Servicos');

insert into imagem values('stefany.jpg','Funcionarios');
insert into imagem values('leticia.jpg','Funcionarios');

/* inserts alterar os dados depois*/
insert into categoriaDeServico values(1,'Cabelo','corte.png', 'Categorias');
insert into categoriaDeServico values(2,'Cílios','cilios.png', 'Categorias');
insert into categoriaDeServico values(3,'Unhas','unha.png', 'Categorias');
insert into categoriaDeServico values(4,'Lábios','labio.png', 'Categorias');
insert into categoriaDeServico values(5,'Sobrancelhas','sombrancelha.png', 'Categorias');

-- mudar no banco no caso da categoria

insert into servico values(1,'Progressiva sem Formol','Método de alisamento sem formol', 150.00, "04:30:00", 1);
insert into servico values(2,'Progressiva com Formol','Método de alisamento com formol', 150.00,"03:00:00", 1);
insert into servico values(3,'Botox','Método de alisamento sem formol', 60.00, "04:00:00", 3);
insert into servico values(4,'Lavar e Escovar','Lavagem e Alisamento', 60.00, "1:30:00", 1);
insert into servico values(5,'Hidratação/Nutrição/Reconstrução + Escova','Hidratação Profunda e Alisamento',50.00,"1:00:00", 1);
insert into servico values(6,'Pacote de Tratamento','4 Sessões de Tratamento', 230.00,"1:30:00", 1);
insert into servico values(7,'Mechas','Coloração', 320.00,"08:00:00", 1);
insert into servico values(8,'Morena Iluminada','Coloração', 300.00,"08:00:00", 1);
insert into servico values(9,'Coloração','Tintura', 90.00,"02:00:00", 1);
insert into servico values(10,'Manutenção de Mega Hair','Manutenção', 300.00,"03:00:00",1);
insert into servico values(11,'Escova com BabyLiss','Penteado', 100.00,"02:00:00", 1);
insert into servico values(12,'Micropigmentação Labial','Pigmentação na Boca', 300.00,"03:00:00", 4);
insert into servico values(13,'Extensão de Cílios','Aplicação de Cílios Manual', 180.00,"08:00:00", 5);
insert into servico values(14,'Manutenção de Cílios','Manutenção',120.00,"08:00:00", 5);
insert into servico values(15,'Micropigmentação de Sobrancelhas','Micropigmentação', 300.00,"08:00:00",5);
insert into servico values(16,'Micropigmentação Labial','Micropigmentação', 300.00, "08:00:00",4);

insert into servicoimagem values ('progressiva-semformol.jpg', 'Servicos', 1, true);
insert into servicoimagem values ('teste.jpg', 'Servicos', 1, false);
insert into servicoimagem values ('cilios1.jpg', 'Servicos', 2, true);
insert into servicoimagem values ('cilios2.jpg', 'Servicos', 3, true);
insert into servicoimagem values ('teste.jpg', 'Servicos', 3, false);

-- cupons rever 
insert into cupomDesconto values(1,10);
insert into cupomDesconto values(2,5);
insert into cupomDesconto values(3,20);
insert into cupomDesconto values(4,16);

insert into cupomDesconto values(5,45);

insert into cupomServico values(1,2);
insert into cupomServico values(2,1);
insert into cupomServico values(3,4);
insert into cupomServico values(4,3);

insert into cupomServico values(5,1);

insert into tipodeProduto values(1,'uso em quantidades');
insert into tipodeProduto values(2,'uso unico');

insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(1,'Progressiva sem Formol', 120.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(2,'Progresiva com Formol', 50.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(3,'Botox', 35.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(4,'Shampoo', 20.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(5, 'Máscara de Hidratação Wella', 140.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(6, 'Máscara de Hidratação Senscience', 160.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(7, 'Máscara de Hidratação Joico', 240.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(8, 'Máscara de Nutrição Wella', 90.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(9, 'Máscara Reconstrução Wella', 120.00, 1) ;
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(10,'Máscara Nutrição Plancton', 45.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(11,'Pó Descolorante', 120.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(12,'Água Oxigenada', 30.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(13,'Protetor Térmico', 45.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(14, 'Óleo Reparador de Pontas', 25.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(15, 'Spray Fixador', 30.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(16, 'Spray Finalizador Extra Brilho', 30.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(17, 'Removedor de Mega Hair', 20.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(18, 'Óleo Removedor de Cola de Mega Hair', 15.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(19, 'Fita Adesiva para Manutenção de Mega Hair', 50.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(20, 'Pigmento da Micro', 230.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(21, 'Pinça Descartável', 0.50, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(22, 'Agulha', 18.00, 2);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(23, 'Lenço Umedecido', 9.00, 1);
insert into produto (cd_produto, nm_produto, vl_produto, cd_tipo_produto) values(24, 'Produto Dermocosmeticos', 9.00, 1);

insert into temporada values(1,'2023-08-10','2023-08-30');
insert into temporada values(2,'2023-09-10','2023-09-30');

insert into tipoPremio values(1,'cupom');
insert into tipoPremio values(2,'produto trocavel');

insert into premio values(1,1,2,null,null,1,'shampo anti caspa',40);
insert into premio values(2,1,1,1,2,null,'cupom de desconto para cabelo',30);
insert into premio values(3,1,2,null,null,2,'shampo anti caspa',20);
insert into premio values(4,1,1,3,4,null,'cupom de desconto para unhas',10);
insert into premio values(1,2,2,null,null,4,'shampo anti caspa',40);
insert into premio values(2,2,1,2,1,null,'cupom de desconto para cabelo',30);
insert into premio values(3,2,2,null,null,2,'shampo anti caspa',20);
insert into premio values(4,2,1,4,3,null,'cupom de desconto para unhas',10);

insert into premio values(5,2,1,5,1,null,'cupom de desconto para unhas',10);

insert into cliente values('saradasilvaspagnuolo2705@gmail.com','Sara',md5('banana'),0);
insert into cliente values('gilmaraspagnuolo@hotmail.com','Gilmara',md5('maça'),10);
insert into cliente values('matheusalmeida@gmail.com','Matheus',md5('caju'),40);
insert into cliente values('danielalmeida@gmail.com','Daniel',md5('morango'),20);
insert into cliente values('sophiacosta@gmail.com','Sophia',md5('uva'),5);

insert into premioCliente values(1,1,'saradasilvaspagnuolo2705@gmail.com');
insert into premioCliente values(5,2,'saradasilvaspagnuolo2705@gmail.com');
insert into premioCliente values(2,2,'gilmaraspagnuolo@hotmail.com');
insert into premioCliente values(3,1,'matheusalmeida@gmail.com');
insert into premioCliente values(4,2,'danielalmeida@gmail.com');
-- insert into premioCliente values(5,1,'sophiacosta@gmail.com');

insert into tipodeFuncionario values(1,'Funcionario');
insert into tipodeFuncionario values(2,'Gerente');

insert into funcionario values(1,1,'Stefany Amorim','emailA@gmail.com',md5('senhaA'), 'stefany.jpg', 'Funcionarios');
insert into funcionario values(2,2,'Leticia Amorim','emailB',md5('senhaB'), 'leticia.jpg', 'Funcionarios');
insert into funcionario values(3,1,'Luara Matias Silva','emailC',md5('senhaC'), null, null);
insert into funcionario values(4,1,'Ana Clara','emailD',md5('senhaD'), null, null);
insert into funcionario values(5,1,'Ana Clara','emailD',md5('senhaD'), null, null);


insert into funcionarioServico values(1,1);
insert into funcionarioServico values(1,2);
insert into funcionarioServico values(2,2);
insert into funcionarioServico values(2,3);
insert into funcionarioServico values(3,3);
insert into funcionarioServico values(3,4);
insert into funcionarioServico values(4,4);
insert into funcionarioServico values(4,1);

insert into diaDeTrabalho values(1,'Segunda');
insert into diaDeTrabalho values(2,'Terça');
insert into diaDeTrabalho values(3,'Quarta');
insert into diaDeTrabalho values(4,'Quinta');
insert into diaDeTrabalho values(5,'Sexta');
insert into diaDeTrabalho values(6,'Sábado');
insert into diaDeTrabalho values(7,'Domingo');


-- insert into funcionarioServicoDiaDeTrabalho values(1,'08:00', 1,2);
-- insert into funcionarioServicoDiaDeTrabalho values(1,'10:00', 1,2);
insert into funcionarioServicoDiaDeTrabalho values(1,'13:00', 1,1);
insert into funcionarioServicoDiaDeTrabalho values(1,'14:00', 1,1);
insert into funcionarioServicoDiaDeTrabalho values(1,'13:50', 4,1);
insert into funcionarioServicoDiaDeTrabalho values(1,'15:00', 4,1);
insert into funcionarioServicoDiaDeTrabalho values(1,'16:00', 4,1);

-- insert into agendamento values(1,"2023-9-25",null,null,'saradasilvaspagnuolo2705@gmail.com',1,1,'1:00:00',1, null);
-- insert into agendamento values(2,"2023-9-26",null,null,'gilmaraspagnuolo@hotmail.com',1,1,'1:00:00',1,null);
-- insert into agendamento values(3,"2023-9-13",null,null,'matheusalmeida@gmail.com',1,1,'1:00:00',1,null);
-- insert into agendamento values(4,"2023-9-13",null,null,'emailD',1,1,'1:00:00',1);
-- insert into agendamento values(5,"2023-9-13",null,null,'emailA',1,1,'1:00:00',1);

-- insert into agendamento values(1,"2023-10-16",null,null,'saradasilvaspagnuolo2705@gmail.com',1,1,'1:00',1, null);
-- insert into agendamento values(2,"2023-10-16",null,null,'saradasilvaspagnuolo2705@gmail.com',1,1,'2:00',1, null);

insert into avaliacao values(1,1,2,'saradasilvaspagnuolo2705@gmail.com',1,'eu não gostei muito do atendimento, pois não gosto atendeu as minhas expectativas', "2023-10-23");
insert into avaliacao values(2,1,2,'gilmaraspagnuolo@hotmail.com',2,'eu não gostei muito do atendimento, pois não gosto atendeu as minhas expectativas', "2023-10-25" );
insert into avaliacao values(3,2,2,'matheusalmeida@gmail.com',3,'Gostei muitíssimo do atendimento; bem prestativo. Adorei o resultado do serviço, vou retornar em próximas vezes, obrigada. Gostaria apenas de fazer uma reclamação a respeito da cabeleireira se atrasar um pouco para me atender, gostaria de ter sido avisada pelo próprio aplicativo que a cabeleireira demoraria um pouco para chegar, dessa forma eu não precisaria deixar meus compromissos de lado para chegar lá',"2023-10-23");
-- insert into avaliacao values(4,3,3,'emailD',5,'Gostei muito do atendimento, lugar bonito agradavel e bem relaxante',"2023-10-23");
-- insert into avaliacao values(5,4,4,'emailA',1,'Odiei o atendimento, pessimo atendente e pessimo lugar',"2023-10-23");

-- insert into produtoAgendamento values(1, 2);
-- insert into produtoAgendamento values(2, 3);
-- insert into produtoAgendamento values(3, 1);

insert into TipoDeOcorrencia values(1, 'não veio no horario');
insert into TipoDeOcorrencia values(2, 'faltou');
insert into TipoDeOcorrencia values(3, 'não veio no horario');
insert into TipoDeOcorrencia values(4, 'não veio no horario');
-- insert into TipoDeOcorrencia values(5, 'não veio no horario');
-- insert into TipoDeOcorrencia values(6, 'faltou');
-- insert into TipoDeOcorrencia values(, 'não veio no horario');
-- insert into TipoDeOcorrencia values(4, 'não veio no horario');


insert into Ocorrencia values(1, 1, 'nao veio na hora certa');
insert into Ocorrencia values(2, 2, 'faltou');
insert into Ocorrencia values(3, 3, 'nao veio na hora certa');
insert into Ocorrencia values(4, 4, 'nao veio na hora certa');

/*insert into funcionarioServicoDiaDeTrabalho values(2, "13:40:00", 'cpfB', 2, 1); ver o problema*/
Delimiter $$

/*procedures*/
/* inicio telas do cliente*/

-- tela index falta banner (terminada)
drop procedure if exists ListarCategorias$$ 
create procedure ListarCategorias()
begin
Select * from categoriadeservico order by nm_categoria_servico;
end$$


drop procedure if exists AvaliacoesPopulares$$
create procedure AvaliacoesPopulares()
begin
declare Qtavaliacao int default 3;
select  c.nm_usuario_cliente, av.vl_avaliacao,av.ds_avaliacao, date_format(av.dt_avaliacao, '%d/%m/%Y') from Avaliacao av inner join Cliente c
on (av.nm_email_cliente = c.nm_email_cliente) where vl_avaliacao >= 3 limit 3; 
end$$


-- trabalhar nela analisar sua necessidade
drop function if exists TipoDeUsuario$$
create function TipoDeUSuario(vEmail varchar(45), vSenha varchar(45)) returns int
begin
	declare tipoUsuario int default 0;
	if  exists (select * from Cliente where nm_email_cliente = vEmail and nm_senha_cliente = md5(vSenha)) then
		set tipoUsuario = 3;
		return tipoUsuario;
	elseif exists (select f.*, tf.* from Funcionario f inner join tipoDeFuncionario tf on (f.cd_tipo_funcionario = tf.cd_tipo_funcionario) 
	where f.nm_email_funcionario = vEmail and f.nm_senha_funcionario = md5(vSenha)) then
	    select tf.cd_tipo_funcionario from Funcionario f inner join tipoDeFuncionario tf on (f.cd_tipo_funcionario = tf.cd_tipo_funcionario) 
		where f.nm_email_funcionario = vEmail and f.nm_senha_funcionario = md5(vSenha) into tipoUsuario; 
        return tipoUsuario; 
	else
		set tipoUsuario = 4;
		return tipoUsuario;  
	end if;
end$$


drop procedure if exists LogarUsuario$$
create procedure LogarUsuario(vEmail varchar(45), vSenha varchar(45))
begin
  if  TipoDeUSuario(vEmail,vSenha) = 3 then
     select nm_email_cliente, nm_usuario_cliente, TipoDeUSuario(vEmail,vSenha) from Cliente where nm_email_cliente = vEmail and nm_senha_cliente = md5(vSenha);
  else
     if  TipoDeUSuario(vEmail,vSenha) = 1 then
	   select f.nm_email_funcionario,f.nm_funcionario ,tf.cd_tipo_funcionario from Funcionario f inner join tipoDeFuncionario tf on (f.cd_tipo_funcionario = tf.cd_tipo_funcionario) 
		where f.nm_email_funcionario = vEmail and f.nm_senha_funcionario = md5(vSenha);
     else
        if  TipoDeUSuario(vEmail,vSenha) = 2 then
        select f.nm_email_funcionario,f.nm_funcionario ,tf.cd_tipo_funcionario from Funcionario f inner join tipoDeFuncionario tf on (f.cd_tipo_funcionario = tf.cd_tipo_funcionario) 
		where f.nm_email_funcionario = vEmail and f.nm_senha_funcionario = md5(vSenha);
	else
      Signal sqlstate '45000' set message_text = 'Usuario não encontrado';
        end if;
	end if;
 end if;
end$$


-- tela cadastro (olhar sobre armazenar dados aleatorios no banco)
drop procedure if exists CadastrarCliente$$ 
create procedure CadastrarCliente(vEmailCliente varchar(45),vNomeCliente varchar(45), vSenhaCliente varchar(45))
begin
insert into Cliente values(vEmailCliente,vNomeCliente,md5(vSenhaCliente), 0);
end$$


-- tela conta_cliente
drop procedure if exists ExibirDadosMinimosDoUsuario$$
create procedure ExibirDadosMinimosDoUsuario(vEmail varchar(45))
begin
select nm_usuario_cliente, nm_email_cliente from Cliente where nm_email_cliente = vEmail;
end$$


-- tela de alterar senha 
drop procedure if exists AlterarSenha$$
create procedure AlterarSenha(vEmail varchar(45),vSenhaAntiga varchar(45), vSenhaNova varchar(45))
begin
if  exists (select * from Cliente where nm_email_cliente = vEmail and nm_senha_cliente = md5(vSenhaAntiga)) then
	update Cliente
	set nm_senha_cliente = md5(vSenhaNova)
	where nm_email_cliente = vEmail;
else
	Signal sqlstate '45000' set message_text = 'Verificar pessoa ou senha deu incorreto';
end if;
end$$


-- tela servico. 
drop procedure if exists ListarServicosDaCategoria$$
create procedure ListarServicosDaCategoria(vCdCategoriaServico int)
begin
Select s.cd_servico, s.nm_servico, s.vl_servico, round(time_to_sec(s.hr_tempo_duracao) / 60) ,si.nm_imagem, si.nm_pasta_imagem 
from servico as s inner join servicoimagem as si on  (si.cd_servico = s.cd_servico)
where  s.cd_categoria_servico = vCdCategoriaServico and si.ic_principal = true;
end$$


-- tela servico expandido filtro para negativa(3-5) e positivo 2 e 1
drop procedure if exists ServicoSelecionadoInformacoesDoServico$$
create procedure ServicoSelecionadoInformacoesDoServico(vCodigoServico int)
begin
Select s.cd_servico, s.nm_servico, s.vl_servico, round(time_to_sec(s.hr_tempo_duracao) / 60), 
	s.ds_servico, group_concat(si.nm_imagem), group_concat(si.nm_pasta_imagem) 
	from servico as s inner join servicoimagem as si on (si.cd_servico = s.cd_servico)
where s.cd_servico = vCodigoServico;
end$$


-- feita pelo matheus
drop procedure if exists ServicoSelecionadoInformacoesDoServicoEAvaliacaoMedia$$
create procedure ServicoSelecionadoInformacoesDoServicoEAvaliacaoMedia(vCodigoServico int)
begin

Select s.cd_servico, s.nm_servico, s.vl_servico, round(time_to_sec(s.hr_tempo_duracao) / 60), s.ds_servico,
(SELECT GROUP_CONCAT(si.nm_imagem) FROM servicoimagem AS si WHERE si.cd_servico = s.cd_servico),
(SELECT GROUP_CONCAT(si.nm_pasta_imagem) FROM servicoimagem AS si WHERE si.cd_servico = s.cd_servico),
round(avg(a.vl_avaliacao)), count(distinct a.cd_avaliacao)
	from servico as s inner join servicoimagem as si on (si.cd_servico = s.cd_servico)
	left join avaliacao as a on (s.cd_servico = a.cd_servico)
where s.cd_servico = vCodigoServico;
end$$


drop procedure if exists ServicoSelecionadoTodasAsAvaliacao$$
create procedure ServicoSelecionadoTodasAsAvaliacao(vCodigoServico int)
begin
Select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
where a.cd_servico = vCodigoServico;
end$$


drop procedure if exists FiltroDeAvaliacoes$$ 
create procedure FiltroDeAvaliacoes(vCodigoServico int, vPositivo bool)
begin
 if (vPositivo) = true then
	select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
 on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
 inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
 where a.cd_servico = vCodigoServico and a.vl_avaliacao >= 3;
else
	select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
 on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
 inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
 where a.cd_servico = vCodigoServico and a.vl_avaliacao < 3;
  end if;
end$$

/*drop procedure if exists ListarDadosMinimosParaAgendar$$
create procedure ListarDadosMinimosParaAgendar (vCodigoServico int)
begin
	Select f.cd_funcionario, f.nm_funcionario, f.nm_imagem, f.nm_pasta_imagem,
	(SELECT group_concat(time_format(ft.hr_funcionario_serviço_dia_de_trabalho, '%h:%i')) 	
	FROM funcionarioServicoDiaDeTrabalho as ft
	where f.cd_funcionario = ft.cd_funcionario order by group_concat(time_format(ft.hr_funcionario_serviço_dia_de_trabalho, '%h:%i')) ASC)
	From funcionario as f
	inner join funcionarioServico as fs on (f.cd_funcionario = fs.cd_funcionario)
	where fs.cd_servico = vCodigoServico
	group by f.nm_funcionario;
end$$*/

-- junção das duas procedures acima
drop procedure if exists ServicoSelecionadoTodasAsAvaliacaoEFiltro$$
create procedure ServicoSelecionadoTodasAsAvaliacaoEFiltro(vCodigoServico int, vFiltro int)
begin
 if (vFiltro) = 1 then 
	select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, a.ds_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
 on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
 inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
 where a.cd_servico = vCodigoServico and a.vl_avaliacao >= 3;
elseif (vFiltro) = 2 then 
	select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, a.ds_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
 on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
 inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
 where a.cd_servico = vCodigoServico and a.vl_avaliacao < 3;
else
	Select distinct(a.cd_avaliacao), date_format(a.dt_avaliacao, '%d/%m/%Y'), c.nm_usuario_cliente, a.vl_avaliacao, a.ds_avaliacao, f.nm_funcionario from Avaliacao a inner join Cliente c 
on (a.nm_email_cliente = c.nm_email_cliente) inner join funcionarioServico fs on (a.cd_funcionario = fs.cd_funcionario) 
inner join funcionario f on (fs.cd_funcionario = f.cd_funcionario)
where a.cd_servico = vCodigoServico;
  end if;
end$$


-- tela de agendamento_servico
drop procedure if exists DadosMinimosDoServicoSelecionado$$
create procedure DadosMinimosDoServicoSelecionado(vCodigoServico int)
begin
Select s.cd_servico, s.nm_servico, s.vl_servico, ROUND(TIME_TO_SEC(s.hr_tempo_duracao) / 60), s.ds_servico, si.nm_imagem, si.nm_pasta_imagem, (
    Select GROUP_CONCAT(f.nm_funcionario)
    from funcionarioServico AS fs
    inner join funcionario AS f ON fs.cd_funcionario = f.cd_funcionario
    where fs.cd_servico = s.cd_servico),
(Select GROUP_CONCAT(f.cd_funcionario)
    from funcionarioServico AS fs
    inner join funcionario AS f ON fs.cd_funcionario = f.cd_funcionario
    where fs.cd_servico = s.cd_servico)
from servico AS s
inner join servicoimagem AS si ON si.cd_servico = s.cd_servico
where s.cd_servico = vCodigoServico AND si.ic_principal = true;
end$$


drop procedure if exists FiltroDeFuncionariosDoServico$$ 
create procedure FiltroDeFuncionariosDoServico(vCodigoServico int, vCodFunc int, vDataSelec date, vTempoSelec varchar(45)) 
begin
declare tempo time default null;
declare nomedata varchar(45) default '';

set tempo = convert(vTempoSelec, time);
set nomedata = date_format(vDataSelec,'%W');

if  vCodFunc = 0 && vTempoSelec = '0:0' then
select fsd.cd_funcionario,f.nm_funcionario, group_concat(distinct(fsd.hr_funcionario_serviço_dia_de_trabalho)), d.cd_dia_trabalho from funcionarioServicoDiaDeTrabalho fsd inner join funcionarioServico fs on (fsd.cd_servico = fs.cd_servico) inner join Funcionario f 
on (fsd.cd_funcionario = f.cd_funcionario) inner join diaDeTrabalho d on (fsd.cd_dia_trabalho = d.cd_dia_trabalho) where fsd.cd_servico = vCodigoServico and d.nm_dia_de_trabalho = nomedata;
else
 if  vCodFunc = 0 then
  select fsd.cd_funcionario, f.nm_funcionario, group_concat(distinct(fsd.hr_funcionario_serviço_dia_de_trabalho)), d.cd_dia_trabalho from funcionarioServicoDiaDeTrabalho fsd inner join funcionarioServico fs on (fsd.cd_servico = fs.cd_servico) inner join Funcionario f 
  on (fsd.cd_funcionario = f.cd_funcionario) inner join diaDeTrabalho d on (fsd.cd_dia_trabalho = d.cd_dia_trabalho) where fsd.cd_servico = vCodigoServico and d.nm_dia_de_trabalho = nomedata
  and fsd.hr_funcionario_serviço_dia_de_trabalho = tempo;
 else
  if vTempoSelec = '0:0' then
   select distinct(fsd.cd_funcionario),f.nm_funcionario, group_concat(distinct(fsd.hr_funcionario_serviço_dia_de_trabalho)), d.cd_dia_trabalho from funcionarioServicoDiaDeTrabalho fsd inner join funcionarioServico fs on (fsd.cd_servico = fs.cd_servico) inner join Funcionario f 
   on (fsd.cd_funcionario = f.cd_funcionario) inner join diaDeTrabalho d on (fsd.cd_dia_trabalho = d.cd_dia_trabalho) where fsd.cd_servico = vCodigoServico and d.nm_dia_de_trabalho = nomedata
   and f.cd_funcionario = vCodFunc;
  else
   select distinct(fsd.cd_funcionario), f.nm_funcionario, group_concat(distinct(fsd.hr_funcionario_Serviço_dia_de_trabalho)), d.cd_dia_trabalho from funcionarioServicoDiaDeTrabalho fsd inner join funcionarioServico fs on (fsd.cd_servico = fs.cd_servico) inner join Funcionario f 
   on (fsd.cd_funcionario = f.cd_funcionario) inner join diaDeTrabalho d on (fsd.cd_dia_trabalho = d.cd_dia_trabalho) where fsd.cd_servico = vCodigoServico and d.nm_dia_de_trabalho = nomedata
   and f.cd_funcionario = vCodFunc and fsd.hr_funcionario_Serviço_dia_de_trabalho = tempo;
  end if;
 end if;
end if;
end$$

drop function if exists DataMaisProximaSemAgendamentoFuncionario$$
create function DataMaisProximaSemAgendamentoFuncionario (vCodigoFuncionario int, vCodigoDiaDeTrabalho int, vCodigoServico int, vDataSelec date) returns date
begin
	declare dataProxima date default vDataSelec;
	declare agendado int default 2;
	
	REPEAT
	
	if (agendado = 2) then
		set agendado = 0;
	else
		Set vDataSelec = DATE_ADD(vDataSelec, INTERVAL 1 WEEK);
	end if;
	
	if exists (Select 1 from funcionarioServicoDiaDeTrabalho where cd_funcionario = vCodigoFuncionario and cd_dia_trabalho = vCodigoServico and cd_servico = vCodigoServico)
	then
		SELECT
			(
		SELECT 
			IF(
				GROUP_CONCAT(
					DISTINCT 
					CASE 
						WHEN EXISTS (
							SELECT 1
							FROM AGENDAMENTO AS a
							WHERE a.cd_funcionario = vCodigoFuncionario
							AND a.cd_dia_trabalho = vCodigoDiaDeTrabalho
							AND a.cd_servico = vCodigoServico
							AND a.hr_funcionario_serviço_dia_de_trabalho = ft.hr_funcionario_serviço_dia_de_trabalho
							AND a.dt_agendamento = vDataSelec
						) THEN 1
						ELSE 0
					END
					ORDER BY ft.hr_funcionario_serviço_dia_de_trabalho ASC
				) = 1,
				1,
				0
			) AS agendamento_existe
		)
		into agendado
		from funcionario as f
		inner join funcionarioServico as fs on (f.cd_funcionario = fs.cd_funcionario)
		left join funcionarioServicoDiaDeTrabalho as ft on (f.cd_funcionario = ft.cd_funcionario)
		where fs.cd_servico = vCodigoServico and f.cd_funcionario = vCodigoFuncionario;
	else 
		set agendado = 0;
	end if;

	UNTIL agendado = 0 END REPEAT;

	return date_format(vDataSelec,'%Y-%m-%d');
end$$

drop procedure if exists ListarDadosMinimosParaAgendar$$
create procedure ListarDadosMinimosParaAgendar(vCodigoServico int, vCodigoFuncionario int, vCodigoDiaDeTrabalho int, vDataSelec date)
begin
	IF vDataSelec < curdate() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A data selecionada é anterior à data atual.';
	ELSEIF vDataSelec > DATE_ADD(vDataSelec, INTERVAL 1 YEAR) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A data selecionada é maior que a data limite.';
    END IF;
	

	if vCodigoFuncionario is null then
		SELECT f.cd_funcionario, f.nm_funcionario, f.nm_imagem, f.nm_pasta_imagem,
		(
			SELECT GROUP_CONCAT(
				TIME_FORMAT(ftt.hr_funcionario_serviço_dia_de_trabalho, '%h:%i') 
				ORDER BY ftt.hr_funcionario_serviço_dia_de_trabalho ASC
			) AS horario
			FROM funcionarioServicoDiaDeTrabalho AS ftt 
			WHERE ftt.cd_funcionario = f.cd_funcionario 
			AND ftt.cd_dia_trabalho = vCodigoDiaDeTrabalho
			AND ftt.cd_servico = vCodigoServico
		) AS horarios,
		(
			SELECT GROUP_CONCAT(distinct d.nm_dia_de_trabalho) 
			FROM diaDeTrabalho as d 
			INNER JOIN funcionarioServicoDiaDeTrabalho as ftt 
			WHERE d.cd_dia_trabalho = ftt.cd_dia_trabalho and ftt.cd_funcionario = f.cd_funcionario and ftt.cd_servico = vCodigoServico
			Order by d.cd_dia_trabalho
		) AS dias_de_trabalho,
		(
			SELECT GROUP_CONCAT(
				CASE 
					WHEN EXISTS (
					SELECT 1
					FROM AGENDAMENTO AS a
					WHERE a.cd_funcionario = f.cd_funcionario
					AND a.cd_dia_trabalho = vCodigoDiaDeTrabalho
					AND a.cd_servico = vCodigoServico
					AND a.hr_funcionario_serviço_dia_de_trabalho = ft.hr_funcionario_serviço_dia_de_trabalho
					AND a.dt_agendamento = vDataSelec
				) THEN '1'
				ELSE '0'
			END
			ORDER BY ft.hr_funcionario_serviço_dia_de_trabalho ASC
		)
	) AS agendamento_existe,
		DataMaisProximaSemAgendamentoFuncionario(vCodigoServico, f.cd_funcionario, vCodigoDiaDeTrabalho,vDataSelec)
		FROM funcionario AS f
		INNER JOIN funcionarioServico AS fs ON (f.cd_funcionario = fs.cd_funcionario and fs.cd_servico = vCodigoServico)
		LEFT JOIN funcionarioServicoDiaDeTrabalho AS ft ON (f.cd_funcionario = ft.cd_funcionario)
		WHERE 
			(
				EXISTS (
					SELECT 1
					FROM funcionarioServicoDiaDeTrabalho AS ftt 
					WHERE ftt.cd_funcionario = f.cd_funcionario 
					AND ftt.cd_dia_trabalho = vCodigoDiaDeTrabalho
					AND ftt.cd_servico = vCodigoServico
				)
				OR
				NOT EXISTS (
					SELECT 1
					FROM funcionarioServicoDiaDeTrabalho AS ftt 
					WHERE ftt.cd_dia_trabalho = vCodigoDiaDeTrabalho
					AND ftt.cd_servico = vCodigoServico
				)
			)
		AND fs.cd_servico = vCodigoServico
		GROUP BY f.cd_funcionario
		ORDER BY f.nm_funcionario;

	else 
		Select f.cd_funcionario, f.nm_funcionario, f.nm_imagem, f.nm_pasta_imagem,
		(Select group_concat(time_format(ftt.hr_funcionario_serviço_dia_de_trabalho, '%h:%i') order by ftt.hr_funcionario_serviço_dia_de_trabalho asc) as horario
		From funcionarioServicoDiaDeTrabalho as ftt 
		where ftt.cd_funcionario = f.cd_funcionario and ftt.cd_dia_trabalho = vCodigoDiaDeTrabalho and ftt.cd_servico = vCodigoServico),
		group_concat(distinct d.nm_dia_de_trabalho),
		(
		SELECT GROUP_CONCAT(
			CASE 
				WHEN EXISTS (
					SELECT 1
					FROM AGENDAMENTO AS a
					WHERE a.cd_funcionario = f.cd_funcionario
					AND a.cd_dia_trabalho = vCodigoDiaDeTrabalho
					AND a.cd_servico = vCodigoServico
					AND a.hr_funcionario_serviço_dia_de_trabalho = ft.hr_funcionario_serviço_dia_de_trabalho
					AND a.dt_agendamento = vDataSelec
				) THEN '1'
				ELSE '0'
			END
			ORDER BY ft.hr_funcionario_serviço_dia_de_trabalho ASC
		)
	) AS agendamento_existe,
	DataMaisProximaSemAgendamentoFuncionario(vCodigoServico, f.cd_funcionario, vCodigoDiaDeTrabalho,vDataSelec)
		From funcionario as f
		inner join funcionarioServico as fs on (f.cd_funcionario = fs.cd_funcionario and fs.cd_servico = vCodigoServico)
		left join funcionarioServicoDiaDeTrabalho as ft on (f.cd_funcionario = ft.cd_funcionario)
		left join diaDeTrabalho as d on (ft.cd_dia_trabalho = d.cd_dia_trabalho and ft.cd_servico = vCodigoServico)
		where 
		fs.cd_servico = vCodigoServico
		and f.cd_funcionario = vCodigoFuncionario
		group by f.cd_funcionario;
	end if;
end$$

Drop Function if exists GerarCodigoAleatorioAgendamento$$
Create Function GerarCodigoAleatorioAgendamento () returns varchar(7)
begin
	declare caracteres varchar(62) default 'A0B1C2D3E4F5G6H7I8J9K0L1M2N3O4P5Q6R7S8T9U0V1W2X3Y4Z56789';
	declare codigo varchar(10) default '';
	declare tamanho int default 7;
	DECLARE codigo_existente BOOL;

	REPEAT
		SET codigo = '';

		WHILE (tamanho > 0) do
			set codigo = concat(codigo, SUBSTRING(caracteres, FLOOR( 1 + rand() * 56),1));
			set tamanho = tamanho - 1;
		end while;

		Select exists (select * from agendamento where cd_agendamento = codigo) into codigo_existente;
	Until not codigo_existente END REPEAT;

	return codigo;
end$$

-- listar os cupons que o cliente possui
drop procedure if exists listarCuponsDoCliente$$
create procedure listarCuponsDoCliente(vEmail varchar(45), vCodServico int)
begin
	select distinct p.cd_cupom_desconto, c.vl_porcentagem_de_desconto from premio p inner join cupomServico cs on(p.cd_cupom_desconto = cs.cd_cupom_desconto)
	inner join cupomDesconto c on(cs.cd_cupom_desconto = c.cd_cupom_desconto) inner join premioCliente pc on(p.cd_premio = pc.cd_premio) 
	inner join temporada on (p.cd_temporada = (Select (cd_temporada) From temporada order by ABS(TIMESTAMPDIFF(second, dt_termino_temporada, curdate())), cd_temporada LIMIT 1))
	where pc.nm_email_cliente = vEmail and cs.cd_servico = vCodServico and not exists (select cd_cupom_desconto from agendamento where nm_email_cliente = vEmail and cd_servico = vCodServico);
end$$

-- verificar se o cupom escolhido é correto
drop function if exists verificarCupom$$
create function verificarCupom(vEmail varchar(45), vCodServico int, vCodCupom int) returns bool
begin
	declare cupomEncontrado int;
	
	select distinct count(p.cd_cupom_desconto) into cupomEncontrado from premio p inner join cupomServico cs on(p.cd_cupom_desconto = cs.cd_cupom_desconto)
	inner join cupomDesconto c on(cs.cd_cupom_desconto = c.cd_cupom_desconto) inner join premioCliente pc on(p.cd_premio = pc.cd_premio) 
	inner join temporada on (p.cd_temporada = (Select (cd_temporada) From temporada order by ABS(TIMESTAMPDIFF(second, dt_termino_temporada, curdate())), cd_temporada LIMIT 1))
	where pc.nm_email_cliente = vEmail and cs.cd_servico = vCodServico and p.cd_cupom_desconto = vCodCupom;

	if cupomEncontrado > 0 then
		return true;
	else
		return false;
	end if;
end$$

-- Efetuar agendamento
drop procedure if exists EfetuarAgendamento$$
create procedure EfetuarAgendamento(vCodServico int, vHoraSelec time, vEmailCliente varchar(45), vDataSelec date, vCodigoFuncionario int, vCodDiaTrabalho int, vCodCupom int)
begin
	declare horarios_time time default null;
	declare duracao_time time default null;
	declare duracao_time_servico_atual time default null;
	declare ic_agendamento_realizado bool default null;
	declare codigo_agendamento varchar(7) default GerarCodigoAleatorioAgendamento();

	declare parar int default 0;	

	declare horario cursor
	for  
		select a.hr_funcionario_serviço_dia_de_trabalho, s.hr_tempo_duracao, a.ic_presenca_cliente_agendamento
		from agendamento as a inner join servico as s on (a.cd_servico = s.cd_servico) 
		where a.nm_email_cliente = vEmailCliente and a.dt_agendamento = vDataSelec; 

	declare continue handler for not found
	set parar = 1;

	select hr_tempo_duracao into duracao_time_servico_atual
	from servico where cd_servico = vCodServico;

	Open horario;

	todos:loop
		fetch horario into horarios_time, duracao_time, ic_agendamento_realizado;

		if (parar = 1) then
			leave todos;
		end if;

		if (ic_agendamento_realizado is null) then
			if (vHoraSelec >= horarios_time && vHoraSelec <= ADDTIME(horarios_time, duracao_time)) then
				Signal sqlstate '45000' set message_text = 'O Cliente já possui um agendamento que se inicia durante o período desse serviço.';
			elseif (ADDTIME (vHoraSelec, duracao_time_servico_atual) >= horarios_time && ADDTIME (vHoraSelec, duracao_time_servico_atual) <= ADDTIME(horarios_time, duracao_time)) then
				Signal sqlstate '45000' set message_text = 'O Cliente já possui um agendamento que o fim está durante o período desse serviço.';
			elseif (vHoraSelec <= horarios_time && ADDTIME (vHoraSelec, duracao_time_servico_atual) >= ADDTIME(horarios_time, duracao_time)) then
				Signal sqlstate '45000' set message_text = 'O Cliente já possui um agendamento que seu período sobrepõe-se inteiramente ao desse serviço.';
			end if;
		end if;
	
	end loop todos;

	Close horario;

	if (vCodCupom is not null)then
		if (verificarCupom(vEmailCliente,vCodServico,vCodCupom)) then
			Insert into agendamento values (codigo_agendamento, vDataSelec, null, null, vEmailCliente, vCodigoFuncionario, vCodServico, vHoraSelec, vCodDiaTrabalho, vCodCupom);
		else
			Signal sqlstate '45000' set message_text = 'O cupom selecionado não existe.';
		end if;
	else
		Insert into agendamento values (codigo_agendamento, vDataSelec, null, null, vEmailCliente, vCodigoFuncionario, vCodServico, vHoraSelec, vCodDiaTrabalho, null);
	end if;
end$$

-- Gera o cód. da avaliação automaticamente
Drop function if exists gerarCodigoAvaliacao$$
Create function gerarCodigoAvaliacao() returns int
begin
	Declare cdAvaliacao int default 0;
	Select max(cd_avaliacao) + 1 into cdAvaliacao from avaliacao;

	return cdAvaliacao;
end$$


-- Avaliação do cliente ao serviço
Drop procedure if exists AvaliarServico$$
Create procedure AvaliarServico(vCdAvaliacao int, vCpffuncionario varchar(11), vCdServico int, vCdTipoFuncionario int, 
vNomeEmailCliente varchar(45), vQtdEstrelas int, vDescricao varchar(45), vData date)
begin
	Insert into avaliacao values (vCdAvaliacao, vCpffuncionario, vCdServico, vCdTipoFuncionario, vNomeEmailCliente, vQtdEstrelas, vDescricao, vData);
end$$


-- tela recompensas 
drop procedure if exists ListarTodosOsPremios$$
create procedure ListarTodosOsPremios()
begin
  select p.cd_premio, p.nm_premio, p.qt_pontos_premio, date_format(t.dt_termino_temporada,'%d/%m/%Y'), t.cd_temporada from Premio p  
 inner join Temporada t on(t.cd_temporada = p.cd_temporada) where curdate() < t.dt_termino_temporada;
end$$


drop procedure if exists ListarPremiosExpessificos$$
create procedure ListarPremiosExpessificos(vProduto bool)
begin
 if vProduto = true then
  select p.cd_premio, p.nm_premio, p.qt_pontos_premio, date_format(t.dt_termino_temporada,'%d/%m/%Y'), t.cd_temporada from Premio p  
 inner join Temporada t on(t.cd_temporada = p.cd_temporada) where curdate() < t.dt_termino_temporada and p.cd_tipo_Premio = 2;
else
select p.cd_premio, p.nm_premio, p.qt_pontos_premio, date_format(t.dt_termino_temporada,'%d/%m/%Y'), t.cd_temporada from Premio p  
inner join Temporada t on(t.cd_temporada = p.cd_temporada) where curdate() < t.dt_termino_temporada and p.cd_tipo_Premio = 1;
end if;
end$$


drop procedure if exists RegistrarRecolhimentoDePremio$$
create procedure RegistrarRecolhimentoDePremio(vCodPremio int, vCodTemporada int, vEmailCliente varchar(45))
begin
 insert into  premioCliente values(vCodPremio,vCodTemporada,VEmailCliente);
end$$


-- tela de alterar_senha
drop procedure if exists alterarSenhaDoCliente$$
create procedure alterarSenhaDoCliente(vSenhaAntiga varchar(45),vSenhaNova varchar(45), vEmailCliente varchar(45))
begin
if exists(select * from Cliente where nm_email_cliente = vEmailCliente and nm_senha_cliente = vSenhaAntiga) then
 update Cliente set
nm_senha_cliente = vSenhaNova where
nm_email_cliente = vEmailCliente;
else
 Signal sqlstate '45000' set message_text = 'Nao existe um cliente com essa senha';
end if;
end$$

-- tela conta_cliente futuralmente alterar para ter um verificador de usuario
drop procedure if exists alterarDadosDoCliente$$
create procedure alterarDadosDoCliente(vNovoNomeCliente varchar(45), vNovoEmailCliente varchar(45), vEmailAntigoCliente varchar(45))
begin
	update Cliente set
	nm_usuario_cliente = vNovoNomeCliente,
	nm_email_cliente = vNovoEmailCliente
	where nm_email_cliente = vEmailAntigoCliente;
end$$

-- tela agendamentos
drop procedure if exists ListarAgendamentosCliente$$
create procedure ListarAgendamentosCliente(vEmailCliente varchar(45))
begin
select s.nm_servico, a.cd_funcionario, a.cd_agendamento, date_format(a.dt_agendamento,'%d/%m/%Y'), a.hr_funcionario_Serviço_dia_de_trabalho from Agendamento a inner join Servico s on(s.cd_servico = a.cd_servico) 
where nm_email_cliente = vEmailCliente order by a.dt_agendamento;
end$$

-- tela agendamento_mais_detalhes ver com o grupo
drop procedure if exists MaisDetalhesDoAgendamento$$
create procedure MaisDetalhesDoAgendamento(vcpfFuncionario varchar(45),vEmailCliente varchar(45), vCodAgendamento int)
begin
select s.nm_servico, f.nm_funcionario, a.cd_agendamento, date_format(a.dt_agendamento,'%d/%m/%Y'), a.hr_funcionario_Serviço_dia_de_trabalho from Agendamento a inner join Servico s on(s.cd_servico = a.cd_servico)
inner join Funcionario f on (f.cd_funcionario = a.cd_funcionario) where nm_email_cliente = vEmailCliente and a.cd_funcionario = vcpfFuncionario and a.cd_agendamento = vCodAgendamento;
end$$

-- tela recompensas_conta adcionar descriçao dos premios
drop procedure if exists listarPremiosResgatados$$
create procedure listarPremiosResgatados(vEmailCliente varchar(45))
begin
select distinct(pc.cd_premio), p.nm_premio from premioCliente pc inner join premio p on(p.cd_premio = pc.cd_premio) where nm_email_cliente = vEmailCliente;
end$$

drop procedure if exists listarPremiosResgatadosFiltrados$$
create procedure listarPremiosResgatadosFiltrados(vEmailCliente varchar(45), vProduto bool)
begin
if vProduto = true then
 select distinct(pc.cd_premio), p.nm_premio from  premioCliente pc inner join Premio p on(p.cd_premio = pc.cd_premio) where nm_email_cliente = vEmailCliente
and p.cd_tipo_Premio = 2;
else
select distinct(pc.cd_premio), p.nm_premio from  premioCliente pc inner join Premio p on(p.cd_premio = pc.cd_premio) where nm_email_cliente = vEmailCliente
and p.cd_tipo_Premio = 1;
end if;
end$$

-- tela redefinir senha
drop procedure if exists redefinirSenha$$
create procedure redefinirSenha(vEmailCliente varchar(45), vNovaSenhaCliente varchar(45))
begin
update Cliente set
nm_senha_cliente = vSenhaNova where
nm_email_cliente = vEmailCliente;
end$$


/* fim telas do cliente*/

/*inicio procedures da dona*/
drop procedure if exists listarProdutosEstoque$$
create procedure listarProdutos(vCodigoP int)
begin
select cd_produto, nm_produto from Produto order by cd_produto;
end$$

drop procedure if exists cadastrarProdutoEstoque$$
create procedure cadastrarProduto(vCodigo int, vNome varchar(45), vDescricao varchar(255))
begin
insert into produto values (vCodigo, vNome, vDescricao);
end$$

drop procedure if exists deletarProdutoEstoque$$
create procedure deletarProduto(vCodigoProduto int)
begin
delete from produto where cd_produto = vCodigoProduto ;
end$$

/*buscar pelo nome*/
drop procedure if exists buscarProdutoEstoque$$
create procedure buscarProdutoEstoque(vNome varchar(45))
begin
select nm_produto from produto where nm_produto = vNome;
end$$

/*buscar pelo cod*/
drop procedure if exists buscarProdutoEstoqueCod$$
create procedure buscarProdutoEstoqueCod(vCodigo int)
begin
select cd_produto from produto where cd_produto = vCodigo;
end$$


drop procedure if exists dadosGeraisProduto$$
create procedure dadosGeraisProduto()
begin
select * from produto order by cd_produto;
end$$

drop procedure if exists buscarFuncionario$$
create procedure listarFuncionario(vCod int)
begin
select cd_funcionario, nm_funcionario, nm_email_funcionario from funcionario where nm_funcionario = vCod order by nm_funcionario;
end$$

drop procedure if exists listarTodosFuncionarios$$
create procedure listarTodosFuncionarios()
begin
select * from funcionario order by cd_funcionario;
end$$

drop procedure if exists deletarFuncionario$$
create procedure deletarFuncionario(vCod int)
begin
delete from funcionario where cd_funcionario = vCod;
end$$

drop procedure if exists dadosGeraisFuncionario$$
create procedure dadosGeraisFuncionario(vCod varchar(11))
begin
select nm_funcionario, dt_nascimento_funcionario, cd_funcionario, nm_telefone_funcionario, nm_email_funcionario
from funcionario where cd_funcionario = vCod order by cd_funcionario;
end$$

drop procedure if exists cadastrarFuncionario$$
create procedure cadastrarFuncionario(vNomeFunc varchar(45), vCod int, vEmailFunc varchar(45), vTipoFuncio int)
begin
insert into funcionario (nm_funcionario, cd_funcionario, nm_email_funcionario, cd_tipo_funcionario) 
values (vNomeFunc, vCpf, vEmailFunc, vTipoFuncio);
end$$

drop procedure if exists criarCupomDesconto$$
create procedure criarCupomDesconto(vCodigo int)
begin
insert into cupom_desconto(cd_cupom_desconto) values (vCodigo);
end$$

drop procedure if exists cadastrarCategoria$$
create procedure cadastrarCategoria(vCodigo int, vNome varchar(45))
begin
insert into categoriaservico (cd_categoria_servico, nm_categoria_servico) values (vCodigo, vNome);
end$$

drop procedure if exists adicionarServico$$
create procedure adicionarServiço(vCodigoCategoria int, vNomeCategoria varchar(45))
begin
insert into categoriadeservico(cd_categoria_servico, nm_categoria_servico) values (vCodigoCategoria, vNomeCategoria);
end$$

drop procedure if exists dadosServicoPopUp$$
create procedure dadosServicoPopUp(vCodigo int)
begin
select nm_servico, cd_categoria_servico, ds_servico, vl_servico, hr_tempo_duracao from servico where cd_servico = vCodigo;
end$$

drop procedure if exists dadosAgendamento$$
create procedure dadosDescricaoAgendamento(vCodigo int)
begin
select cd_agendamento, dt_agendamento, nm_email_cliente, cd_funcionario, hr_funcionario_serviço_dia_de_trabalho, ic_presenca_funcionario_agendamento from agendamento where cd_agendamento = vCodigo;
end$$

/*nova procedure*/
drop procedure if exists listarAgendamentosCliente$$
create procedure listarAgendamentosCliente()
begin
select * from agendamento;
end$$
/*fim procedures dona*/


Delimiter ;
call ListarCategorias();
call AvaliacoesPopulares();
call CadastrarCliente('daniel.rendeiro@etec.sp.gov.br', 'Daniel','banana');
call LogarUsuario('emailA', 'banana');
call ExibirDadosMinimosDoUsuario('daniel.rendeiro@etec.sp.gov.br');
call alterarSenha('emailA','banana','senhaNova');
call dadosServicoPopUp(1);
call listarTodosFuncionarios();
call FiltroDeFuncionariosDoServico(1,0,"2023-10-2", '3:0');
call FiltroDeFuncionariosDoServico(1,0,"2023-10-2", '0:0');
call FiltroDeFuncionariosDoServico(1,4,"2023-10-2", '3:0');

call ListarTodosOsPremios();

call ListarPremiosExpessificos(true);

call listarAgendamentosCliente();

call  MaisDetalhesDoAgendamento(1,'emailB',1);

call listarPremiosResgatados('emailA');

call listarPremiosResgatadosFiltrados('emailB', true);

/*procedures funcionario*/

