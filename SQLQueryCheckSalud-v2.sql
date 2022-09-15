USE MASTER
GO
DROP DATABASE IF EXISTS CheckSalud_DB;
CREATE DATABASE CheckSalud_DB
ON 
   PRIMARY (NAME = CheckSalud_DB,
   FILENAME = 'C:\SSMS\semana 1\CheckSalud_DB.MDF',
   SIZE = 4,
   FILEGROWTH = 15%)
   LOG ON (NAME = CheckSalud_DB_log,
   FILENAME = 'C:\SSMS\semana 1\CheckSalud_DB_log.LDF',
   SIZE = 2,
   FILEGROWTH = 15%)
GO

USE [CheckSalud_DB]
GO


--CREAMOS LAS TABLAS ENTIDADES CON SUS ATRIBUTOS
if(object_id('Tb_Especialidad','U')) is not null
	drop table Tb_Especialidad 
go

CREATE TABLE [dbo].Tb_Especialidad
(
	codEspecialidad nchar (2) NOT NULL,
	descEspecialidad varchar (99)
PRIMARY KEY 
	(
		codEspecialidad ASC
	)
)
GO

if(object_id('Tb_Enfermedad','U')) is not null
	drop table Tb_Enfermedad 
go
CREATE TABLE [dbo].Tb_Enfermedad
(
	codEnfermedad varchar (5) NOT NULL,
	descEnfermedad varchar (99)
PRIMARY KEY 
	(
		codEnfermedad ASC
	)
)
GO



if(object_id('Tb_Ubicacion','U')) is not null
	drop table Tb_Ubicacion 
go
CREATE TABLE [dbo].Tb_Ubicacion
(
	Id_Ubigeo nchar(6) NOT NULL,
	IdDepa char(2) NULL,
	IdProv char(2) NULL,
	IdDist char(2) NULL,
	Departamento nvarchar(255) NULL,
	Provincia nvarchar(255) NULL,
	Distrito nvarchar(255) NULL,
PRIMARY KEY 
	(
		Id_Ubigeo ASC
	)
)
GO

if(object_id('Tb_Usuario','U')) is not null
	drop table Tb_Usuario 
go
CREATE TABLE [dbo].Tb_Usuario
(
	Login_Usuario nvarchar(20) NOT NULL,
	Pass_Usuario nvarchar(20) NULL,
	Niv_Usuario int NULL,
	Est_Usuario int NULL,
	Fec_Registro datetime NULL,
	Usu_Registro nvarchar(20) NULL,
PRIMARY KEY 
	(
		Login_Usuario ASC
	)
)
GO

if(object_id('Tb_Medico','U')) is not null
	drop table Tb_Medico 
go
CREATE TABLE [dbo].Tb_Medico
(
	[codMedico] Nchar(4) NOT NULL,
	[dniMedic] Nchar(8) NULL,
	[nomMedico] Varchar(20) NOT NULL,
	[apeMedico] Varchar(20) NOT NULL,
	[numColegiatura] Char(9) NOT NULL,
	[fechaNacimiento] Date NOT NULL,
	[emailMedico] Varchar(320) NULL,
	[fotoMedico] nvarchar NULL,
	[direcMedico] Varchar(99) NULL,
	[estado] Int NOT NULL,
	[codEspecialidad] Nchar(2) NULL,
	[Login_Usuario] Nvarchar(20) NULL,
	[Fec_Reg] Datetime NULL,
	[Usu_Registro] Nvarchar(20) NULL,
	[Fech_Ult_Mod] Date NULL,
	[Usu_Ult_Mod] Nvarchar(20) NULL,
	[Id_Ubigeo] Nchar(6) NOT NULL,
	[fec_ingreso] datetime
PRIMARY KEY 
	(
		codMedico ASC
	)
)
GO

if(object_id('Tb_DocumentoPac','U')) is not null
	drop table Tb_DocumentoPac 
go
CREATE TABLE [dbo].Tb_DocumentoPac
(
	codDocumento int IDENTITY(1,1) NOT NULL,
	img_sangre image,
	img_orina image,
	img_ekg image,
	img_spirometria image,
	img_psicologia image,
	img_rayosX image,
	img_audicion image,
	img_vista image,
	Login_Usuario nvarchar(20),
	codPaciente nvarchar (8)
PRIMARY KEY 
	(
		codDocumento ASC
	)
)
GO

if(object_id('Tb_Empresa','U')) is not null
	drop table Tb_Empresa 
go
CREATE TABLE [dbo].Tb_Empresa
(
	codEmpresa nvarchar (5) NOT NULL,
	Raz_soc_emp nvarchar (50) not null,
	Dir_emp nvarchar (50),
	Tel_emp  nvarchar (10),
	Ruc_emp nchar(11) not null,
	Rep_emp nvarchar (30),
	Id_Ubigeo nchar(6),
	fec_Ingreso datetime,
	estado int not null,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL
PRIMARY KEY 
	(
		codEmpresa ASC
	)
)
GO


if(object_id('Tb_Paciente','U')) is not null
	drop table Tb_Paciente 
go
CREATE TABLE [dbo].[Tb_Paciente]
(
	codPaciente nvarchar (8) NOT NULL,
	nomPaciente nvarchar (99) not null,
	apePaciente nvarchar (99) not null,
	fechaNacimiento date not null,
	dniPaciente nchar (8) not null,
	sexo int not null,
	direcPaciente varchar(20),
	tipoSangre char(3),
	fotoPaciente nvarchar null,
	emailPaciente varchar(320),
	fechaIngreso datetime,
	numTelefono nvarchar (9) not null,
	estado int not null,
	tipoCliente int,
	codEmpresa nvarchar (5),
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Id_Ubigeo nchar(6) NOT NULL,
PRIMARY KEY 
	(
		codPaciente ASC
	)
)
GO

if(object_id('Tb_Resultados','U')) is not null
	drop table Tb_Resultados 
go
CREATE TABLE [dbo].Tb_Resultados
(
	peso float,
	altura float,
	sangre nvarchar(99),
	orina nvarchar(99),
	ekg nvarchar(99),
	spirometria nvarchar(99),
	psicologia nvarchar(99),
	rayosX nvarchar(99),
	audicion nvarchar(99),
	vista nvarchar(99),
	codAnalisis char(5),
	codEvaluacion char(5),
	codEnfermedad varchar (5),
	recomendaciones nvarchar(99),
	codPaciente nvarchar (8),
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL	
PRIMARY KEY 
	(
		codAnalisis ASC,
		codEvaluacion ASC
	)
)
GO

if(object_id('Tb_Evaluacion','U')) is not null
	drop table Tb_Evaluacion 
go
CREATE TABLE [dbo].Tb_Evaluacion
(
	[codEvaluacion] Char(5) NOT NULL,
	[Fec_Eva] Date NULL,
	[estado] Int NULL,
	[codMedico] Nchar(4) NOT NULL,
	[codAuditor] Char(3) NOT NULL,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL
PRIMARY KEY 
	(
		codEvaluacion ASC
	)
)
GO

if(object_id('Tb_Analisis','U')) is not null
	drop table Tb_Analisis
go
CREATE TABLE [dbo].Tb_Analisis
(
	[codAnalisis] char(5) NOT NULL,
	[descAnalisis] Nvarchar(99) NULL,
	[costo] Money NULL,
	[estado] Int NOT NULL,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL
PRIMARY KEY 
	(
		codAnalisis ASC
	)
)
GO

if(object_id('Tb_Auditor','U')) is not null
	drop table Tb_Auditor
go
CREATE TABLE [dbo].Tb_Auditor
(
	[codAuditor] char(3) NOT NULL,
	[codMedico] Nchar(4) NULL,

	
PRIMARY KEY 
	(
		codAuditor ASC
	)
)
GO




-- DEFINICION DE LA INTEGRIDAD REFERENCIAL - LLAVES FORANEAS (FK)

Alter table Tb_Paciente add foreign key(codEmpresa) references Tb_Empresa (codEmpresa) 
go
Alter table Tb_Paciente add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go



Alter table Tb_Resultados add foreign key(codAnalisis) references Tb_Analisis (codAnalisis) 
go
Alter table Tb_Resultados add foreign key(codEvaluacion) references Tb_Evaluacion (codEvaluacion) 
go
Alter table Tb_Resultados add foreign key(codEnfermedad) references Tb_Enfermedad (codEnfermedad) 
go
Alter table Tb_Resultados add foreign key(codPaciente) references Tb_Paciente (codPaciente) 
go


Alter table Tb_DocumentoPac add foreign key(Login_Usuario) references Tb_Usuario (Login_Usuario) 
go
Alter table Tb_DocumentoPac add foreign key(codPaciente) references Tb_Paciente (codPaciente) 
go


Alter table Tb_Medico add foreign key(codEspecialidad) references Tb_Especialidad (codEspecialidad) 
go
Alter table Tb_Medico add foreign key(Login_Usuario) references Tb_Usuario (Login_Usuario) 
go
Alter table Tb_Medico add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go


Alter table Tb_Empresa add foreign key(Id_Ubigeo) references Tb_Ubicacion (Id_Ubigeo) 
go


Alter table Tb_Evaluacion add foreign key(codMedico) references Tb_Medico (codMedico) 
go
Alter table Tb_Evaluacion add foreign key(codAuditor) references Tb_Auditor (codAuditor) 
go


Alter table Tb_Auditor add foreign key(codMedico) references Tb_Medico (codMedico) 
go


	

-- CONSTRAINTS TIPO CHECK, DEFAULT Y UNIQUE
alter table Tb_Empresa
    add constraint chk_RucEmpresa check
        (Ruc_emp like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
go
alter table Tb_Paciente
    add constraint chk_numTelefono check
        (numTelefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
go
alter table Tb_Paciente
    add constraint def_fechaingreso default
        getdate() for fechaIngreso
go
alter table Tb_Paciente
    add constraint chk_codPaciente check
        (codPaciente like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
go
alter table Tb_Empresa
    add constraint UQ_Ruc_emp
        unique (Ruc_emp)
go
--check constraint solo permite tipo cliente 1=gerente, 2=administrativo o 3=operacional
ALTER TABLE Tb_Paciente
	ADD CONSTRAINT chk_tipoCliente CHECK
		(tipoCliente in (1,2,3))
go
--check constraint solo permite 0=inactivo y 1=activo
ALTER TABLE Tb_Paciente
	ADD CONSTRAINT chk_estado CHECK
		(estado in (0,1))
go
alter table Tb_Resultados
    add constraint def_Fec_reg default
        getdate() for Fec_reg
go
alter table Tb_Paciente
    add constraint def_Fec_reg_p default
        getdate() for Fec_reg
go
alter table Tb_Medico
    add constraint chk_dniMedic check
        (dniMedic like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
go
-- Constraint tipo check de nivel de usuario: 1=admin, 2=publico
ALTER TABLE Tb_Usuario
	ADD CONSTRAINT chk_Niv_Usuario CHECK
		(Niv_Usuario in (1,2))
go
--Constraint tipo check de estado de usuario: 0=inactivo, 1=activo
ALTER TABLE Tb_Usuario
	ADD CONSTRAINT chk_Est_Usuario CHECK
		(Est_Usuario in (0,1))
go

-- 20 INSERTS POR CADA TABLA

insert into Tb_Ubicacion values ('140101', '14', '01', '01', 'Lima', 'Lima', 'Lima')
insert into Tb_Ubicacion values ('140102', '14', '01', '02', 'Lima', 'Lima', 'Ancon')
insert into Tb_Ubicacion values ('140103', '14', '01', '03', 'Lima', 'Lima', 'Ate')
insert into Tb_Ubicacion values ('140104', '14', '01', '04', 'Lima', 'Lima', 'Breña')
insert into Tb_Ubicacion values ('140105', '14', '01', '05', 'Lima', 'Lima', 'Carabayllo')
insert into Tb_Ubicacion values ('140106', '14', '01', '06', 'Lima', 'Lima', 'Comas')
insert into Tb_Ubicacion values ('140107', '14', '01', '07', 'Lima', 'Lima', 'Chaclacayo')
insert into Tb_Ubicacion values ('140108', '14', '01', '08', 'Lima', 'Lima', 'Chorrillos')
insert into Tb_Ubicacion values ('140109', '14', '01', '09', 'Lima', 'Lima', 'La Victoria')
insert into Tb_Ubicacion values ('140110', '14', '01', '10', 'Lima', 'Lima', 'La Molina')
insert into Tb_Ubicacion values ('140111', '14', '01', '11', 'Lima', 'Lima', 'Lince')
insert into Tb_Ubicacion values ('140112', '14', '01', '12', 'Lima', 'Lima', 'Lurigancho')
insert into Tb_Ubicacion values ('140113', '14', '01', '13', 'Lima', 'Lima', 'Lurin')
insert into Tb_Ubicacion values ('140114', '14', '01', '14', 'Lima', 'Lima', 'Magdalena del Mar')
insert into Tb_Ubicacion values ('140115', '14', '01', '15', 'Lima', 'Lima', 'Miraflore')
insert into Tb_Ubicacion values ('140116', '14', '01', '16', 'Lima', 'Lima', 'Pachacamac')
insert into Tb_Ubicacion values ('140117', '14', '01', '17', 'Lima', 'Lima', 'Pueblo Libre')
insert into Tb_Ubicacion values ('140118', '14', '01', '18', 'Lima', 'Lima', 'Pucusana')
insert into Tb_Ubicacion values ('140119', '14', '01', '19', 'Lima', 'Lima', 'Puente Piedra')
insert into Tb_Ubicacion values ('140120', '14', '01', '20', 'Lima', 'Lima', 'Punta Hermosa')


insert into Tb_Usuario values ('pcalderon2021', 'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('renzo2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('joseh2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('juanS2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('minaT2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('renaV2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('luisI2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('pedroP2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('chrisk2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('silvyp2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('pattyM2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('yurip2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('luisK2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('enriqueV2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('hikat2021',		'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('pieroQ2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('luciaV2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('kathyV2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('mengeS2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')
insert into Tb_Usuario values ('luciana2021',	'pepito123', 1, 1, '5/24/2021', 'pcalderon2021')


insert into Tb_Especialidad values ('01', 'Medico general')
insert into Tb_Especialidad values ('02', 'Medico internista')
insert into Tb_Especialidad values ('03', 'Pediatria')
insert into Tb_Especialidad values ('04', 'Reumatología')
insert into Tb_Especialidad values ('05', 'Oncología')
insert into Tb_Especialidad values ('06', 'Neumología')
insert into Tb_Especialidad values ('07', 'Hematología')
insert into Tb_Especialidad values ('08', 'Geriatría')
insert into Tb_Especialidad values ('09', 'Endocrinología')
insert into Tb_Especialidad values ('10', 'Cardiología')
insert into Tb_Especialidad values ('11', 'Ginecologia')
insert into Tb_Especialidad values ('12', 'Neurologia')
insert into Tb_Especialidad values ('13', 'Oftalmologia')
insert into Tb_Especialidad values ('14', 'Obstetricia')
insert into Tb_Especialidad values ('15', 'Psiquiatria')
insert into Tb_Especialidad values ('16', 'Radiologia')
insert into Tb_Especialidad values ('17', 'Traumatologia')
insert into Tb_Especialidad values ('18', 'Urologia')
insert into Tb_Especialidad values ('19', 'Dentista')
insert into Tb_Especialidad values ('20', 'Dermatologia')


insert into Tb_Medico values ('0001', '75473624', 'Renzo', 'Zaldivar Gomez', '629634416', 
							  '11/30/1975', 'renzogomez@hotmail.com', 
							  null, 'Av. las begonias 123', '01', '01', 'renzo2021', 
							  '2020-05-06 08:00:00', 'jleon', null, null, '140110', '2008-05-06 08:00:00')

insert into Tb_Medico values ('0002', '77022521', 'Jose', 'Huallipa Reyna', '629635526', 
							  '05/03/1985', 'jhuallipa@hotmail.com', 
							  null, 'Av. Aviacion 1450', '01', '02', 'joseh2021', 
							  '2020-04-06 09:00:00', 'jleon', null, null, '140105', '2009-05-06 08:00:00')

insert into Tb_Medico values ('0003', '82408363', 'Juan', 'Suarez Rosas', '397520472', 
							  '05/03/1985', 'jrosasa@gmail.com', 
							  null, 'Av. Pedro Venturo 2356', '01', '03', 'juanS2021', 
							  '2020-07-06 09:00:00', 'jleon', null, null, '140106', '2009-03-20 08:00:00')

insert into Tb_Medico values ('0004', '79745736', 'Mina', 'Tang Wu', '358778202', 
							  '05/04/1976', 'minatw@rotemail.com', 
							  null, 'Av. Carrion 234', '01', '09', 'minaT2021', 
							  '2020-05-08 08:00:00', 'jleon', null, null, '140104', '2010-10-15 08:00:00')

insert into Tb_Medico values ('0005', '84641137', 'Renato', 'Velasquez Flores', '990743468', 
							  '05/03/1985', 'renatoxVF@gmail.com', 
							  null, 'Av. Julio 235', '01', '02', 'renaV2021', 
							  '2020-02-06 08:00:00', 'jleon', null, null, '140105', '2010-06-21 08:00:00')
							  
insert into Tb_Medico values ('0006', '70682929', 'Luis', 'Ibarcena Montez', '171527286', 
							  '05/03/1985', 'luisIbaMon@opemail.com', 
							  null, 'Jr. Galeano 670', '01', '02', 'luisI2021', 
							  '2020-05-07 09:00:00', 'jleon', null, null, '140105', '2010-02-01 08:00:00')

insert into Tb_Medico values ('0007', '81844276', 'Pedro', 'Pebe Sanchez', '543519631', 
							  '05/03/1985', 'pedroPS@vorebaiml.com', 
							  null, 'Jr. Montez 345', '01', '11', 'pedroP2021', 
							  '2020-04-04 09:00:00', 'jleon', null, null, '140110', '2012-10-25 08:00:00')

insert into Tb_Medico values ('0008', '75645864', 'Christian', 'Kaiser Montoya', '402115037', 
							  '05/03/1985', 'chrisK05@oruemel.com', 
							  null, 'Av. Aviacion 4000', '01', '02', 'chrisk2021', 
							  '2020-04-03 08:00:00', 'jleon', null, null, '140106', '2014-06-10 08:00:00')

insert into Tb_Medico values ('0009', '72426329', 'Silvana', 'Perez Reyna', '124526889', 
							  '05/03/1985', 'silvyPere@gmail.com', 
							  null, 'Av.Arequipa 5400', '01', '05', 'silvyp2021', 
							  '2020-03-06 09:00:00', 'jleon', null, null, '140103', '2015-11-05 08:00:00')

insert into Tb_Medico values ('0010', '80851338', 'Patty', 'Mendiola Anco', '504855646', 
							  '05/03/1985', 'patty2307@deimel.com', 
							  null, 'Av.Javier Prado 3405', '01', '02', 'pattyM2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140111', '2016-09-06 08:00:00')

insert into Tb_Medico values ('0011', '80851338', 'Yuri', 'Perez Human', '504735646', 
							  '05/03/1975', 'yuripph@gmail.com', 
							  null, 'Av.Javier Prado 3405', '01', '02', 'yurip2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140110', '2016-05-06 08:00:00')

insert into Tb_Medico values ('0012', '81851548', 'Luis', 'Kaiser Flores', '324855646', 
							  '05/03/1982', 'luluisKF@otumel.com', 
							  null, 'Av.Rosales 112', '01', '03', 'luisK2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140104', '2017-05-04 08:00:00')

insert into Tb_Medico values ('0013', '81856738', 'Enrique', 'Velasquez Saba', '968555646', 
							  '05/03/1979', 'enriqueVS1@gmail.com', 
							  null, 'Av. Firmamento 338', '01', '02', 'enriqueV2021', 
							  '2020-07-07 10:00:00', 'jleon', null, null, '140104', '2017-07-23 08:00:00')

insert into Tb_Medico values ('0014', '77851448', 'Hikaru', 'Torres', '533055646', 
							  '05/03/1987', 'hikaruT@gmail.com', 
							  null, 'Av.Bolivia 457', '01', '01', 'hikat2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140115', '2018-03-22 08:00:00')

insert into Tb_Medico values ('0015', '80851338', 'Piero', 'Quiñones Sanchez', '749522476', 
							  '05/03/1990', 'piero4407@otptemel.com', 
							  null, 'Av.Benavides 1122', '01', '02', 'pieroQ2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140101', '2018-10-07 08:00:00')

insert into Tb_Medico values ('0016', '80851338', 'Lucia', 'Vidal Vasquez', '884851146', 
							  '05/03/1992', 'luchiVV@gmail.com', 
							  null, 'Av.Javier Prado 7455', '01', '01', 'luciaV2021', 
							  '2020-03-01 10:00:00', 'jleon', null, null, '140104', '2019-04-12 08:00:00')

insert into Tb_Medico values ('0017', '80851338', 'Katherine', 'Vargas Sopla', '523455646', 
							  '05/03/1980', 'patty2307@gmail.com', 
							  null, 'Calle Poseidon 3405', '01', '04', 'kathyV2021', 
							  '2020-09-08 10:00:00', 'jleon', null, null, '140106', '2020-01-17 08:00:00')

insert into Tb_Medico values ('0018', '80851338', 'Mengeche', 'Saba Rojas', '523455646', 
							  '05/03/1978', 'mengeSR@gmail.com', 
							  null, 'Calle Poseidon 3345', '01', '12', 'mengeS2021', 
							  '2020-11-11 10:00:00', 'jleon', null, null, '140105', '2021-01-26 08:00:00')

insert into Tb_Medico values ('0019', '77851338', 'Luciana', 'Ramirez Estela', '523466546', 
							  '05/03/1994', 'lucidaRE@pteo.com', 
							  null, 'Av SanBorja Sur 1400', '01', '10', 'luciana2021', 
							  '2020-11-11 10:00:00', 'jleon', null, null, '140105', '2021-02-06 08:00:00')

insert into Tb_Medico values ('0020', '77097848', 'Patricio', 'Calderon Gomez', '564266546', 
							  '09/07/1988', 'francPE@pteo.com', 
							  null, 'Av SanBorja Norte 1570', '01', '11', 'pcalderon2021', 
							  '2020-05-13 10:00:00', 'jleon', null, null, '140101', '2021-03-07 08:00:00')

insert into Tb_Auditor values ('001','0001')
insert into Tb_Auditor values ('002','0002')
insert into Tb_Auditor values ('003','0003')
insert into Tb_Auditor values ('004','0004')
insert into Tb_Auditor values ('005','0005')
insert into Tb_Auditor values ('006','0006')
insert into Tb_Auditor values ('007','0007')
insert into Tb_Auditor values ('008','0008')
insert into Tb_Auditor values ('009','0009')
insert into Tb_Auditor values ('010','0010')

insert into Tb_Enfermedad values ('R00.0', 'Taquicardia, no especificada')
insert into Tb_Enfermedad values ('R00.2', 'Palpitaciones')	
insert into Tb_Enfermedad values ('R01.0', 'Soplos cardíacos benignos o inocentes')
insert into Tb_Enfermedad values ('R06.0', 'Disnea')	
insert into Tb_Enfermedad values ('R07.0', 'Dolor de garganta')
insert into Tb_Enfermedad values ('R07.1', 'Dolor en el pecho al respirar')
insert into Tb_Enfermedad values ('R10.0', 'Abdomen agudo')	
insert into Tb_Enfermedad values ('R10.2', 'Dolor pélvico y perineal')
insert into Tb_Enfermedad values ('R16.0', 'Hepatomegalia, no clasificada en otra parte')	
insert into Tb_Enfermedad values ('R19.2', 'Peristalsis visible')	
insert into Tb_Enfermedad values ('H01.1', 'Dermatosis no infecciosa del párpado')
insert into Tb_Enfermedad values ('H02.2', 'Lagoftalmos')	
insert into Tb_Enfermedad values ('H04.5', 'Estenosis e insuficiencia de las vías lagrimales')
insert into Tb_Enfermedad values ('H10.5', 'Blefaroconjuntivitis')	
insert into Tb_Enfermedad values ('M01.1', 'Artritis tuberculosa (A18.0). (Excluye de la columna (M49.0).)')	
insert into Tb_Enfermedad values ('M02.0', 'Artropatías tras bypass intestinal')
insert into Tb_Enfermedad values ('M02.3', 'Artritis reactiva')	
insert into Tb_Enfermedad values ('M06.2', 'Bursitis reumatoide.')
insert into Tb_Enfermedad values ('M15.3', 'Artrosis secundaria múltiple. Poliartrosis post-traumática')	
insert into Tb_Enfermedad values ('M17.0', 'Gonartrosis primaria bilateral')	

insert into Tb_Empresa values ('00001', 'iHealth sac',			'Av. Salaverry 2409',		   '3682459', '20500397650', 'Liz Gutierrez',	  '140101', '2015-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00002', 'Ezentis',				'Av. Javier Prado 309',		   '3452738', '20500397651', 'Valeria Leon',	  '140102', '2016-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00003', 'Graña y Montero',		'Av. Julio 234',			   '2151500', '20500397652', 'Luis Díaz Olivero', '140103', '2017-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00004', 'Ceramica Chero',		'Av. Malas 356',			   '3682455', '20500397653', 'Pepito Gomez',	  '140104', '2014-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00005', 'Nestle Corporation',	'Av. Malas 569',			   '4484505', '20500397654', 'Fred Pebe',		  '140105', '2013-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00006', 'Minera RocaBomBom',	'Av. Aviacion 1356',		   '5382885', '20500397655', 'Juan Carrion',	  '140106', '2018-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00007', 'Plaza Novea',			'Av. Benavides 6436',		   '5543421', '20500397656', 'Norman Osborn',	  '140107', '2019-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00008', 'Wayne Enterprises',	'Av. Caminos del Inca 3516',   '1182445', '20500397657', 'Ricardo Minaya',	  '140108', '2019-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00009', 'Serrucheria Inter',	'Av. Higuereta 4556',		   '3782953', '20500397658', 'Nancy Vega',		  '140109', '2020-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00010', 'ICMT',					'Av. Brazil 3562',			   '2587775', '20500397659', 'Rebeca Flores',	  '140110', '2012-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00011', 'Ceramicas Nochero',	'Av. Argentina 4003',		   '3112335', '20500397643', 'Mauricio Jinete',	  '140111', '2018-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00012', 'Jeriko Channel',		'Av. Benavides 3563',		   '1682456', '20500397644', 'Sofia Gomez',		  '140112', '2020-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00013', 'Universidad Cideral',	'Av. Pedro Venturo 4316',	   '4793455', '20500397647', 'Valeria Ramirez',	  '140113', '2014-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00014', 'Betel',				'Av. Japon 1111',			   '4482355', '20500397631', 'Jordan Minaya',	  '140114', '2013-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00015', 'Hunter Asociation',	'Av. Galeano 2356',			   '5582400', '20500397633', 'Enrique Luyo',	  '140115', '2020-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00016', 'Queen Slays',			'Av. La Marina 4000',		   '4482055', '20500397632', 'Homero Griffit',	  '140116', '2020-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00017', '2+2',					'Av. Malas 3356',		       '3685455', '20500397660', 'Mori Calliope',	  '140117', '2020-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00018', 'Stand Up Bn14',		'Av. Salaverry 6356',		   '3888485', '20500397661', 'Ana Vierra',		  '140118', '2017-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00019', 'Sugoi Dekai',			'Av. Intihuatana 5600',		   '3642859', '20500397662', 'Christian Suarez',  '140119', '2018-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)
insert into Tb_Empresa values ('00020', 'Saga Falabella',		'Av. Julio 4000',			   '3183465', '20500397664', 'Jose Balaguer',	  '140120', '2021-05-06 08:00:00', 1, '2020-07-07 10:00:00', 'jleon', null, null)


insert into Tb_Analisis values ('00001', 'EXAMEN PREOCUPACIONAL', 350, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00002', 'EXAMEN PREOCUPACIONAL', 200, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00003', 'EXAMEN PREOCUPACIONAL', 133, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00004', 'EXAMEN PREOCUPACIONAL', 264, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00005', 'EXAMEN PREOCUPACIONAL', 436, 0, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00006', 'EXAMEN PREOCUPACIONAL', 225, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00007', 'EXAMEN PREOCUPACIONAL', 520, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00008', 'EXAMEN PREOCUPACIONAL', 464, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00009', 'EXAMEN PREOCUPACIONAL', 256, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00010', 'EXAMEN PREOCUPACIONAL', 168, 0, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00011', 'EXAMEN PREOCUPACIONAL', 213, 0, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00012', 'EXAMEN PREOCUPACIONAL', 595, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00013', 'EXAMEN PREOCUPACIONAL', 505, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00014', 'EXAMEN PREOCUPACIONAL', 375, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00015', 'EXAMEN PREOCUPACIONAL', 260, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00016', 'EXAMEN PREOCUPACIONAL', 559, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00017', 'EXAMEN PREOCUPACIONAL', 234, 0, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00018', 'EXAMEN PREOCUPACIONAL', 200, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00019', 'EXAMEN PREOCUPACIONAL', 416, 1, '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Analisis values ('00020', 'EXAMEN PREOCUPACIONAL', 499, 1, '2020-05-06 08:00:00', 'jleon', null, null)



insert into Tb_Evaluacion values ('00001', '5/24/2021', 1, '0011', '001', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00002', '6/23/2021', 1, '0012', '002', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00003', '3/14/2021', 1, '0013', '003', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00004', '7/24/2021', 1, '0014', '004', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00005', '8/23/2021', 1, '0015', '005', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00006', '5/14/2021', 1, '0016', '006', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00007', '7/24/2021', 1, '0017', '007', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00008', '6/14/2021', 1, '0018', '008', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00009', '5/24/2021', 1, '0019', '009', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00010', '4/23/2021', 1, '0020', '010', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00011', '3/24/2021', 1, '0011', '001', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00012', '2/28/2021', 1, '0012', '002', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00013', '1/04/2021', 1, '0013', '003', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00014', '1/24/2021', 1, '0014', '004', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00015', '3/15/2021', 1, '0015', '005', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00016', '7/24/2021', 1, '0016', '006', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00017', '4/05/2021', 1, '0017', '007', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00018', '5/14/2021', 1, '0018', '008', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00019', '4/07/2021', 1, '0019', '009', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00020', '8/24/2021', 1, '0020', '010', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Evaluacion values ('00021', '8/13/2021', 1, '0011', '001', '2020-05-06 08:00:00', 'jleon', null, null)



insert into Tb_Paciente values ('00000001', 'Enzo', 'Venturi',	'11/30/1975', '75888948', 0, 'Av. Javier Prado 301', 'O+', null, 
								'enzo@gmail.com', '2020-05-06 08:00:00', '939195311', 1, 1, '00001', '2020-05-06 08:00:00', 'jleon', null, null,
								'140101')
insert into Tb_Paciente values ('00000002', 'Andres', 'Villa Monroy',	'12/30/1974', '78762844', 0, 'Av. Javier Prado 302', 'O+', null, 
								'andyV@gmail.com', '2020-03-06 08:00:00', '973578906', 0, 2, '00002', '2020-05-06 08:00:00', 'jleon', null, null,
								'140102')
insert into Tb_Paciente values ('00000003', 'Daniel', 'Polo Castellano',	'06/30/1967', '79440449', 0, 'Av. Javier Prado 303', 'O+', null, 
								'daniC@gmail.com', '2020-05-07 08:00:00', '965050589', 1, 1, '00001', '2020-05-06 08:00:00', 'jleon', null, null,
								'140101')
insert into Tb_Paciente values ('00000004', 'Natalia', 'Garces Parra',	'04/30/1972', '77702518', 1, 'Av. Javier Prado 304', 'O+', null, 
								'natallyG@gmail.com', '2020-05-06 08:00:00', '950357366', 1, 3, '00003', '2020-05-06 08:00:00', 'jleon', null, null,
								'140103')
insert into Tb_Paciente values ('00000005', 'Oscar', 'Ochoa Rojas',	'03/30/1988', '79929096', 0, 'Av. Javier Prado 331', 'AB+', null, 
								'oscar1213@gmail.com', '2020-02-07 08:00:00', '941827795', 1, 2, '00004', '2020-05-06 08:00:00', 'jleon', null, null,
								'140104')
insert into Tb_Paciente values ('00000006', 'Juan', 'Diaz Mejia',	'03/30/1975', '78947873', 0, 'Av. Javier Prado 311', 'AB+', null, 
								'juanDM@gmail.com', '2020-05-06 08:00:00', '949383042', 1, 2, '00005', '2020-05-06 08:00:00', 'jleon', null, null,
								'140101')
insert into Tb_Paciente values ('00000007', 'Ivan', 'Camargo Vargas',	'06/30/1983', '78865759', 0, 'Av. Javier Prado 671', 'AB+', null, 
								'ivanCama@gmail.com', '2020-02-08 08:00:00', '953183515', 0, 1, '00006', '2020-05-06 08:00:00', 'jleon', null, null,
								'140102')
insert into Tb_Paciente values ('00000008', 'Leonardo', 'Zuñiga Lopez',	'05/30/1971', '76166076', 0, 'Av. Javier Prado 221', 'AB+', null, 
								'leoZL@gmail.com', '2020-02-08 08:00:00', '952134748', 1, 3, '00006', '2020-05-06 08:00:00', 'jleon', null, null,
								'140101')
insert into Tb_Paciente values ('00000009', 'Rafael', 'Vega Zambrano',	'03/30/1980', '76936256', 0, 'Av. Javier Prado 111', 'A-', null, 
								'rafafav@gmail.com', '2020-05-03 08:00:00', '974519399', 1, 2, '00007', '2020-05-06 08:00:00', 'jleon', null, null,
								'140101')
insert into Tb_Paciente values ('00000010', 'Mariana', 'Sanchez Sanchez',	'04/30/1980', '95240629', 1, 'Av. Velasco 321', 'A-', null, 
								'mariss@gmail.com', '2020-04-03 08:00:00', '974519399', 0, 3, '00008', '2020-05-06 08:00:00', 'jleon', null, null,
								'140103')
insert into Tb_Paciente values ('00000011', 'Catalina', 'Puerto Navia',	'03/25/1980', '88602807', 1, 'Av. Javier Prado 341', 'A-', null, 
								'catalipuna@gmail.com', '2020-06-03 08:00:00', '974500399', 1, 1, '00009', '2021-05-06 08:00:00', 'jleon', null, null,
								'140102')
insert into Tb_Paciente values ('00000012', 'Mario', 'Gomez',	'03/20/1980', '82186969', 0, 'Av. Javier Prado 534', 'A-', null, 
								'mariobrog@gmail.com', '2020-05-03 08:00:00', '974519499', 1, 1, '00011', '2020-06-06 08:00:00', 'jleon', null, null,
								'140103')
insert into Tb_Paciente values ('00000013', 'Sandra', 'Mendoza Aguilar',	'04/30/1980', '87183607', 1, 'Av. Javier Prado 667', 'A-', null, 
								'sandramend@gmail.com', '2020-08-03 08:00:00', '900519399', 1, 1, '00014', '2020-04-06 08:00:00', 'jleon', null, null,
								'140107')
insert into Tb_Paciente values ('00000014', 'Sebastian', 'Torres Frias',	'06/30/1978', '77616758', 0, 'Av. Javier Prado 111', 'A-', null, 
								'seabtorre@gmail.com', '2020-05-03 08:00:00', '975919399', 1, 3, '00003', '2020-03-06 08:00:00', 'jleon', null, null,
								'140108')
insert into Tb_Paciente values ('00000015', 'Karen', 'Coral Bumbrano',	'07/30/1980', '96825200', 1, 'Av. Javier Prado 511', 'A+', null, 
								'karencoral@gmail.com', '2020-05-03 08:00:00', '984519599', 0, 1, '00001', '2020-09-06 08:00:00', 'jleon', null, null,
								'140106')
insert into Tb_Paciente values ('00000016', 'Rafael', 'Gonzales Romero',	'03/30/1970', '98684736', 0, 'Av. Javier Prado 11', 'A+', null, 
								'gonrafa@gmail.com', '2020-05-01 08:00:00', '974519300', 1, 2, '00006', '2020-05-10 08:00:00', 'jleon', null, null,
								'140108')
insert into Tb_Paciente values ('00000017', 'Jenny', 'Quiñones Mendiola',	'10/30/1972', '77036263', 1, 'Av. Javier Prado 81', 'A+', null, 
								'henyqume@gmail.com', '2020-05-03 08:00:00', '984316309', 1, 1, '00011', '2020-01-12 08:00:00', 'jleon', null, null,
								'140106')
insert into Tb_Paciente values ('00000018', 'Lucia', 'Palomino Arias',	'03/30/1980', '98658212', 1, 'Av. Javier Prado 102', 'A+', null, 
								'palolucy@gmail.com', '2020-04-03 08:00:00', '984519399', 0, 2, '00010', '2020-05-11 08:00:00', 'jleon', null, null,
								'140108')
insert into Tb_Paciente values ('00000019', 'Oriana', 'Diaz Zubieta',	'03/30/1962', '85285472', 0, 'Av. Javier Prado 311', 'A+', null, 
								'diasori@gmail.com', '2019-04-03 08:00:00', '994519399', 1, 3, '00010', '2020-02-10 08:00:00', 'jleon', null, null,
								'140108')
insert into Tb_Paciente values ('00000020', 'Nicole', 'Vega Vidal',	'03/30/1980', '76956356', 0, 'Av. Javier Prado 103', 'A+', null, 
								'nicolvv@gmail.com', '2021-05-02 08:00:00', '999519399', 0, 1, '00011', '2020-03-04 08:00:00', 'jleon', null, null,
								'140111')



insert into Tb_Resultados values (70.8, 1.75, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00001', '00001', 'R00.0', 'Recomendaciones', 
									'00000001', '2020-05-06 08:00:00', 'jleon', null, null)
insert into Tb_Resultados values (71.8, 1.77, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00002', '00002', 'R00.0', 'Recomendaciones', 
									'00000002', '2020-05-05 09:00:00', 'jleon', null, null)
insert into Tb_Resultados values (72.8, 1.78, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00003', '00003', 'R00.0', 'Recomendaciones',  
									'00000003', '2020-04-06 10:00:00', 'jleon', null, null)
insert into Tb_Resultados values (69.8, 1.73, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00004', '00004', 'R00.0', 'Recomendaciones', 
									'00000004', '2020-05-07 11:00:00', 'jleon', null, null)
insert into Tb_Resultados values (70.8, 1.76, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00005', '00005', 'R00.0', 'Recomendaciones', 
									'00000005', '2020-03-08 14:00:00', 'jleon', null, null)
insert into Tb_Resultados values (71.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00006', '00006', 'R00.0', 'Recomendaciones', 
									'00000006', '2020-05-06 20:00:00', 'jleon', null, null)
insert into Tb_Resultados values (68.8, 1.67, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00007', '00007', 'R00.0', 'Recomendaciones', 
									'00000007', '2020-02-09 09:00:00', 'jleon', null, null)
insert into Tb_Resultados values (80.8, 1.80, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00008', '00008', 'R00.0', 'Recomendaciones', 
									'00000008', '2020-05-10 08:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00009', '00009', 'R00.0', 'Recomendaciones', 
									'00000009', '2020-01-11 09:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00010', '00010', 'R00.0', 'Recomendaciones', 
									'00000010', '2020-01-11 10:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00011', '00011', 'R00.0', 'Recomendaciones', 
									'00000011', '2020-01-11 11:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00012', '00012', 'R00.0', 'Recomendaciones', 
									'00000012', '2020-01-11 12:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00013', '00013', 'R00.0', 'Recomendaciones', 
									'00000013', '2020-01-11 10:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00014', '00014', 'R00.0', 'Recomendaciones', 
									'00000014', '2020-01-11 08:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00015', '00015', 'R00.0', 'Recomendaciones', 
									'00000015', '2020-01-11 11:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00016', '00016', 'R00.0', 'Recomendaciones', 
									'00000016', '2020-01-11 11:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00017', '00017', 'R00.0', 'Recomendaciones', 
									'00000017', '2020-01-11 09:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00018', '00018', 'R00.0', 'Recomendaciones', 
									'00000018', '2020-01-11 16:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00019', '00019', 'R00.0', 'Recomendaciones', 
									'00000019', '2020-01-11 16:00:00', 'jleon', null, null)
insert into Tb_Resultados values (78.8, 1.69, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00020', '00020', 'R00.0', 'Recomendaciones', 
									'00000020', '2020-01-11 19:00:00', 'jleon', null, null)
insert into Tb_Resultados values (70.8, 1.75, 'Resultados positivos', 'Resultados positivos', 'Resultados positivos',
									'Resultados positivos', 'Resultados positivos','Resultados positivos', 
									'Resultados positivos','Resultados positivos', '00001', '00021', 'R00.0', 'Recomendaciones', 
									'00000001', '2020-05-06 08:00:00', 'jleon', null, null)



insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000001')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000002')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000003')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000004')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000005')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000006')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000007')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000008')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000009')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000010')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000011')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000012')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000013')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000014')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000015')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000016')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000017')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000018')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000019')
insert into Tb_DocumentoPac values (null, null, null, null, null, null, null, null, 'pcalderon2021', '00000020')


select * from Tb_Paciente
go

select * from Tb_Resultados
go

select * from Tb_Usuario
go

select * from Tb_Empresa
go

select * from Tb_DocumentoPac
go

select * from Tb_Evaluacion
go


-- COMIENZO DE LAS 5 VISTAS--

-- VISTA PARA GERENCIA (JENNI)
CREATE OR ALTER VIEW vw_VistaEmpresaEvaluados AS
select E.codEmpresa, E.Raz_soc_emp, E.Ruc_emp, 
	   DATEDIFF(day, E.fec_Ingreso, GETDATE())/365 as Años_servicios,
			case E.estado
				when 1 then 'Activa'
				when 0 then 'Inactiva'
			end as Estado_actual,
	   E.Id_Ubigeo, U.Departamento, 
	   U.Provincia, U.Distrito,
	   count(P.codPaciente) as Trabajadores_Evaluados
from Tb_Empresa E left outer join Tb_Paciente P on P.codEmpresa = E.codEmpresa
				  inner join Tb_Ubicacion U on E.Id_Ubigeo = U.Id_Ubigeo
group by E.codEmpresa, E.Raz_soc_emp, E.Ruc_emp, 
	     DATEDIFF(day, E.fec_Ingreso, GETDATE())/365,
		 E.estado, E.Id_Ubigeo, U.Departamento, 
	     U.Provincia, U.Distrito
go



--VISTA PARA ADMINISTRATIVO (MAURICIO)
CREATE OR ALTER VIEW vw_VistaPacienteEstado AS
SELECT P.codPaciente, P.nomPaciente AS Nombre, P.apePaciente AS Apellido, 
		CASE P.sexo
			WHEN 0 THEN 'Hombre'
			WHEN 1 THEN 'Mujer'
		END AS Genero,
	   E.Raz_soc_emp AS Lugar_de_trabajo,
	   CONVERT(varchar, P.fechaNacimiento, 105) AS Fecha_Nacimiento, P.dniPaciente AS Dni, 
	   P.direcPaciente AS Dirección,
		CASE P.estado 
			WHEN 0 THEN 'Inactivo'
			WHEN 1 THEN 'Activo'
		END AS estado,
		CASE P.tipoCliente
			WHEN 1 THEN 'Gerente'
			WHEN 2 THEN 'Administrativo'
			WHEN 3 THEN 'Operacional'
		END AS Tipo_Cliente,
		COUNT(R.codEvaluacion) AS Cantidad_de_evaluaciones
FROM Tb_Paciente P INNER JOIN Tb_Empresa E ON P.codEmpresa = E.codEmpresa
				   LEFT OUTER JOIN Tb_Resultados R ON P.codPaciente = R.codPaciente 
GROUP BY P.codPaciente, P.nomPaciente, P.apePaciente, 
		 P.fechaNacimiento, P.dniPaciente, P.direcPaciente, P.estado, P.sexo, P.tipoCliente,
		 E.Raz_soc_emp
GO



--VISTA PARA PAPELEO/ADMINISTRATIVO/CONTABILIDAD (ENZO)
CREATE OR ALTER VIEW vw_VistaAnalisisEstado AS
SELECT A.codAnalisis, P.nomPaciente AS NombrePaciente, P.apePaciente AS ApellidoPaciente,
	   Em.Raz_soc_emp AS Lugar_de_trabajo, A.descAnalisis AS TipoAnalisis, 
	   A.costo AS CostoAnalisis, E.Fec_Eva AS FechaEvaluacion,
	   CASE A.estado 
			WHEN 0 THEN 'Pendiente'
			WHEN 1 THEN 'Finalizado'
	   END AS Estado
FROM Tb_Analisis A INNER JOIN Tb_Resultados R  ON A.codAnalisis  = R.CodAnalisis
                   INNER JOIN Tb_Paciente   P  ON R.codPaciente = P.codPaciente
				   INNER JOIN Tb_Evaluacion E  ON E.codEvaluacion = R.codEvaluacion
				   INNER JOIN Tb_Empresa    Em ON P.codEmpresa = Em.codEmpresa
GO



-- VISTA PARA PACIENTE/EMPRESA (INFORME MEDICO RESUMIDO) (PATRICIO)
CREATE OR ALTER VIEW vw_VistaInformeMedico AS
select R.codEvaluacion, P.nomPaciente AS Nombre_Paciente, P.apePaciente AS Apellido_Paciente,
	   CONVERT(varchar, P.fechaNacimiento, 105) AS Fecha_Nacimiento, DATEDIFF(day, P.fechaNacimiento, GETDATE())/365 AS Edad, P.dniPaciente,
	   Em.Raz_soc_emp AS Lugar_de_trabajo, An.descAnalisis AS Tipo_Examen,
	   E.Fec_Eva AS Fecha_Evaluacion, R.peso AS Peso_Paciente_Kg, R.altura AS Altura_Paciente_m, 
	   R.sangre, R.orina, R.ekg, R.spirometria, R.psicologia, R.rayosX, R.audicion, R.vista,
	   R.recomendaciones,
	   M.nomMedico AS Nombre_Medico_Evaluador,
	   M.apeMedico AS Apellidos_Medico_Evaluador, 
	   MA.nomMedico AS Nombre_Medico_Auditor, 
	   MA.apeMedico AS Apellido_Medico_Auditor
FROM Tb_Resultados R INNER JOIN Tb_Paciente P ON R.codPaciente = P.codPaciente
					 INNER JOIN Tb_Empresa Em ON P.codEmpresa = Em.codEmpresa
					 INNER JOIN Tb_Evaluacion E ON R.codEvaluacion = E.codEvaluacion
					 INNER JOIN Tb_Medico M ON E.codMedico = M.codMedico
					 INNER JOIN Tb_Auditor A ON E.codAuditor = A.codAuditor
					 INNER JOIN Tb_Medico MA ON A.codMedico = MA.codMedico
					 INNER JOIN Tb_Analisis An ON R.codAnalisis = An.codAnalisis
GO

SELECT * FROM Tb_Medico
go


-- VISTA PARA GERENCIA/RECURSOS HUMANOS/ADMINISTRACION
CREATE OR ALTER VIEW vw_VistaMedicoEstado AS
select M.codMedico, M.nomMedico AS Nombre, M.apeMedico AS Apellido,
	   Es.descEspecialidad AS Especialidad, 
			CASE M.estado
				WHEN 1 THEN 'Activo'
				WHEN 0 THEN 'Inactivo'
			END AS Estado,
       M.fechaNacimiento,  DATEDIFF(day, M.fechaNacimiento , GETDATE())/365 AS Edad, 
	   M.dniMedic, M.direcMedico, M.emailMedico,
	   DATEDIFF(day, M.fec_ingreso, GETDATE())/365 AS Años_de_trabajo,
	   COUNT(E.codEvaluacion) AS Cantidad_de_evaluaciones, 
	   COUNT(distinct R.codPaciente) AS Pacientes_Atendidos
from Tb_Medico M INNER JOIN Tb_Evaluacion E ON M.codMedico = E.codMedico
				 INNER JOIN Tb_Resultados R ON R.codEvaluacion = E.codEvaluacion
				 INNER JOIN Tb_Paciente P	ON P.codPaciente = R.codPaciente
				 INNER JOIN Tb_Especialidad Es ON M.codEspecialidad = Es.codEspecialidad
GROUP BY  M.codMedico, M.nomMedico, M.apeMedico, Es.descEspecialidad, M.estado, 
		  M.fechaNacimiento, M.dniMedic, M.fec_ingreso, M.direcMedico, M.emailMedico
go


--COMIENZO DE LOS 5 INDICES--

CREATE INDEX IDX_TB_DNI_PACIENTE ON Tb_Paciente (dniPaciente ASC);
GO

CREATE INDEX IDX_TB_RZN_EMPRESA ON Tb_Empresa (Raz_soc_emp ASC);
GO

CREATE INDEX IDX_TB_UBICACION ON Tb_Ubicacion (Departamento ASC);
GO

CREATE INDEX IDX_TB_CLG_MEDICO ON Tb_Medico (dniMedic ASC);
GO

CREATE INDEX IDX_TB_FEC_EVA ON Tb_Evaluacion (Fec_Eva DESC);
GO




------------------------------PROCEDIMIENTO ALMACENADOS ---------------------------
-----------------------------------------------------------------------------------
--1: Insertar una Evaluacion
CREATE OR ALTER PROCEDURE usp_InsertarEvaluacion
@vFecEva date,
@vEstado int,
@vCodMedico nchar(4),
@vCodAuditor char(3),
@vUsu_Registro nvarchar(20)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la insercion de un registro de una evaluacion
declare @vCont int
declare @vCodEva char(5)
set @vCont = (Select count(*) from Tb_Evaluacion)
-- Se obtiene el siguiente valor para el codigo de la evaluacion a insertar.
if @vCont = 0 
       set @vCodEva ='00001'
else
       set @vCodEva = (Select Right(Max(codEvaluacion) + 100001, 5) 
    From Tb_Evaluacion)
--Insertamos el nuevo resultado
INSERT INTO Tb_Evaluacion VALUES(@vCodEva, @vFecEva, @vEstado, @vCodMedico, @vCodAuditor,
								 GETDATE(), @vUsu_Registro, NULL, NULL)
GO

--PRUEBA
EXEC usp_InsertarEvaluacion '2020-10-10', 1, '0011', '001','pcalderon2021'
GO

-- COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO



--2: Actualizar una Evaluacion
Create or ALTER PROCEDURE usp_ActualizarEvaluacion
@vCodEva char(5),
@vFecEva date,
@vEstado int,
@vCodMedico nchar(4),
@vCodAuditor char(3),
@vUsu_Ult_Mod nvarchar(20)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la actualizacion de un registro de una Evaluacion
UPDATE Tb_Evaluacion set 
		Fec_Eva = @vFecEva,
		estado = @vEstado,
		codMedico = @vCodMedico,
		codAuditor = @vCodAuditor,
		Fec_Ult_Mod = GETDATE(),
		Usu_Ult_Mod = @vUsu_Ult_Mod
WHERE codEvaluacion = @vCodEva
GO

--PRUEBA
EXEC usp_ActualizarEvaluacion '00022', '2020-10-10', 0, '0011', '001', 'pcalderon2021'
GO
--COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO




--3: Eliminar una Evaluacion
CREATE OR ALTER PROCEDURE usp_EliminarEvaluacion
@vCod char(5)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la eliminacion de un registro de una Evaluacion
DELETE FROM Tb_Evaluacion WHERE codEvaluacion = @vCod
GO

--PRUEBA
EXEC usp_EliminarEvaluacion '00022'
GO

--COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO




--4: Consultar una Evaluacion
CREATE OR ALTER PROCEDURE usp_ConsultarEvaluacion
@vCod char(5)
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite la consulta de un registro de una evaluacion por su ID.
SELECT [Nombre_Paciente]
      ,[Apellido_Paciente]
	  ,[Fecha_Nacimiento]
	  ,[Edad]
	  ,[dniPaciente]
	  ,[Lugar_de_trabajo]
	  ,[Tipo_Examen]
	  ,[Fecha_Evaluacion]
	  ,[Peso_Paciente_Kg]
      ,[sangre]
      ,[orina]
      ,[ekg]
      ,[spirometria]
      ,[psicologia]
      ,[rayosX]
      ,[audicion]
      ,[vista]
      ,[recomendaciones]
      ,[Nombre_Medico_Evaluador]
      ,[Apellidos_Medico_Evaluador]
      ,[Nombre_Medico_Auditor]
      ,[Apellido_Medico_Auditor]
  FROM [dbo].[vw_VistaInformeMedico]
WHERE codEvaluacion = @vCod
GO

--Prueba 
EXEC usp_ConsultarEvaluacion '00021'
GO





--5: Listar Evaluaciones
CREATE OR ALTER PROCEDURE usp_ListarEvaluaciones
AS
--Autor: Patricio Calderon
--Empresa: CheckSalud
--Sistema: Modulo de Evaluaciones
--Fecha Creacion: 14/11/2021
--Fecha Modificacion: 14/11/2021
--SP que permite el listado general de evaluaciones
SELECT [Nombre_Paciente]
      ,[Apellido_Paciente]
	  ,[Fecha_Nacimiento]
	  ,[Edad]
	  ,[dniPaciente]
	  ,[Lugar_de_trabajo]
	  ,[Tipo_Examen]
	  ,[Fecha_Evaluacion]
	  ,[Peso_Paciente_Kg]
      ,[sangre]
      ,[orina]
      ,[ekg]
      ,[spirometria]
      ,[psicologia]
      ,[rayosX]
      ,[audicion]
      ,[vista]
      ,[recomendaciones]
      ,[Nombre_Medico_Evaluador]
      ,[Apellidos_Medico_Evaluador]
      ,[Nombre_Medico_Auditor]
      ,[Apellido_Medico_Auditor]
  FROM [dbo].[vw_VistaInformeMedico]
ORDER BY Fecha_Evaluacion
GO

--Prueba 
EXEC usp_ListarEvaluaciones
GO

--COMPROBAMOS
SELECT * FROM Tb_Evaluacion
GO



--1: Para  Insertar un solo Analisis 
CREATE OR ALTER PROCEDURE usp_InsertarAnalisis
@vDes varchar(99),
@vCos money,
@vEst integer = 1, -- Determinante
@vUsu_Reg nvarchar(20)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite la insercion un analisis
DECLARE @vCod  char(5)
DECLARE @vcont int
SET @vcont=(SELECT COUNT(*) FROM Tb_Analisis)
-- Se obtiene el siguiente valor para el codigo del análisis a 
-- insertar.
IF @vcont=0 
        SET @vcod ='00001'
ELSE
		set @vCod = (Select Right(Max(codAnalisis) + 100001, 5)
		FROM Tb_Analisis)
--Insertamos el nuevo análisis
INSERT INTO Tb_Analisis VALUES(@vcod,@vDes,@vCos,@vEst,GETDATE(),@vUsu_Reg,null,null)
GO

--Prueba
EXEC usp_InsertarAnalisis 'EXAMEN PREOCUPACIONAL','416.00',1,'ezvrtgs' 
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO


--2: Para Actualizar un solo Análisis 
CREATE OR ALTER PROCEDURE usp_ActualizarAnalisis
@vCod char(5),
@vDes varchar(99),
@vCos money,
@vEst integer = 1, -- Determinante 
@vUsu_Ult_Mod nvarchar(20)
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite actualizar un analisis
AS
	UPDATE  Tb_Analisis SET 
			descAnalisis = @vDes,
			costo        = @vCos,
			estado       = @vEst,
			Fec_Ult_Mod  = GETDATE(),
            Usu_Ult_Mod  = @vUsu_Ult_Mod
			WHERE 
			codAnalisis  = @vCod
GO

--Prueba
EXEC usp_ActualizarAnalisis '00001','EXAMEN PREOCUPACIONAL', '540.00', 0,'ezvrtgs'
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO

--3: Para   Eliminar un solo Análisis 
CREATE OR ALTER PROCEDURE   usp_EliminarAnalisis
@vCod char(5)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite eliminar  un analisis
DELETE FROM  Tb_Analisis
	   WHERE codAnalisis = @vCod
GO

--Prueba
EXEC usp_EliminarAnalisis '00024'
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO



--4: Para  Consultar un solo Análisis
--Cambie el parametro de codigo por estado
CREATE OR ALTER PROCEDURE  usp_ConsultarAnalisis
@vEstado varchar(99)
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite consultar un analisis
SELECT [codAnalisis]
      ,[NombrePaciente]
      ,[ApellidoPaciente]
      ,[Lugar_de_trabajo]
      ,[TipoAnalisis]
      ,[CostoAnalisis]
      ,[FechaEvaluacion]
      ,[Estado]
  FROM [dbo].[vw_VistaAnalisisEstado]
  WHERE Estado = @vEstado
GO

--Prueba
EXEC usp_ConsultarAnalisis 'Finalizado'
GO

--COMPROBAMOS
SELECT * FROM vw_VistaAnalisisEstado
GO



--5: Para Listar todos los Análisis 
CREATE OR ALTER PROCEDURE usp_ListarAnalisis
AS
--Autor: Enzo Venturi
--Empresa: CHECKSALUD
--Sistema: Modulo de analisis
--Fecha Creacion: 15/11/2021
--Fecha Modificacion: 15/11/2021
--SP que permite listar todos los analisis
SELECT [codAnalisis]
      ,[NombrePaciente]
      ,[ApellidoPaciente]
      ,[Lugar_de_trabajo]
      ,[TipoAnalisis]
      ,[CostoAnalisis]
      ,[FechaEvaluacion]
      ,[Estado]
  FROM [dbo].[vw_VistaAnalisisEstado]
  ORDER BY codAnalisis
GO

--Prueba
EXEC usp_ListarAnalisis
GO

--COMPROBAMOS
SELECT * FROM Tb_Analisis
GO



---1: insertar una empresa
CREATE OR ALTER PROCEDURE usp_InsertarEmpresa
@VRaz_soc_empl nvarchar(50),
@VDir_emp nvarchar(50),
@VTel_emp nvarchar(10),
@VRuc_emp nchar(11),
@VRep_emp nvarchar(30),
@VId_ubigeo nchar(6),
@Vestado int,
@vUsu_Reg nvarchar(20)
AS 
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite la insercion una empresa
declare @VcodEmpresa nvarchar(5)  
declare @vcont int
set @vcont=(Select count(*) from Tb_Empresa)
-- Se obtiene el siguiente valor para el codigo de empresa a 
-- insertar.
if @vcont= 0
	set @VcodEmpresa = '00001'
else
	set @VcodEmpresa=(select RIGHT(MAX(codEmpresa) + 100001, 5) from Tb_Empresa)
	--Insertamos la nueva empresa
	insert into Tb_Empresa values (@VcodEmpresa, @VRaz_soc_empl, @VDir_emp, @VTel_emp, @VRuc_emp, @VRep_emp, @VId_ubigeo, GETDATE(), @Vestado, GETDATE(), @vUsu_Reg, null, null)
GO
--Pruebaa
EXEC usp_InsertarEmpresa 'JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1 , 'jleon'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--2: Actualizar una empresa
CREATE OR ALTER PROCEDURE usp_ActualizarEmpresa
@VcodEmpresa nvarchar(5),
@VRaz_soc_emp nvarchar(50),
@VDir_emp nvarchar(50),
@VTel_emp nvarchar(10),
@VRuc_emp nchar(11),
@VRep_emp nvarchar(30),
@VId_ubigeo nchar(6),
@Vestado integer = 1,
@vUsu_Ult_Mod nvarchar(20)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite la actualizacion de una empresa

	UPDATE  Tb_Empresa SET 
			Raz_soc_emp = @VRaz_soc_emp,
			Dir_emp     = @VDir_emp,
			Tel_emp     = @VTel_emp,
			Ruc_emp     = @VRuc_emp,
			Rep_emp     = @VRep_emp,
			Id_Ubigeo   = @VId_ubigeo,
			estado      = @Vestado,
			Fec_Ult_Mod  = GETDATE(),
            Usu_Ult_Mod  = @vUsu_Ult_Mod
			WHERE 
			codEmpresa= @VcodEmpresa
GO

--Prueba
EXEC usp_ActualizarEmpresa '00021', 'PATRICIO S.A.C', 'Av. ricardo Este 234', '3887345', '20576397665', 'PEPI Bellido', '140102', 1 , 'jleon'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--3: Eliminar una empresa
CREATE OR ALTER PROCEDURE   usp_EliminarEmpresa
@VcodEmpresa nvarchar(5)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite eliminar una empresa
DELETE FROM  Tb_Empresa
	   WHERE codEmpresa=@VcodEmpresa
GO

--Prueba
EXEC usp_EliminarEmpresa '00021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--4: Consultar una empresa
CREATE OR ALTER PROCEDURE  usp_ConsultarEmpresa
@VcodEmpresa nvarchar(5)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite consultar una empresa
SELECT [codEmpresa]
      ,[Raz_soc_emp]
	  ,[Dir_emp]
	  ,[Tel_emp]
      ,[Ruc_emp]
      ,[Rep_emp]
      ,[Id_Ubigeo]
      ,[fec_Ingreso]
	  ,[estado]
	  ,[Fec_reg]
	  ,[Usu_Registro]
	  ,[Fec_Ult_Mod]
	  ,[Usu_Ult_Mod]
  FROM [dbo].[Tb_Empresa]
  WHERE codEmpresa=@VcodEmpresa
GO

--Prueba
EXEC usp_ConsultarEmpresa '00020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO


--5:  Listar empresas
CREATE OR ALTER PROCEDURE usp_ListarEmpresa
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de empresa
--Fecha Creacion: 14/11/2021
--SP que permite listar una empresa
SELECT [codEmpresa]
      ,[Raz_soc_emp]
      ,[Ruc_emp]
      ,[Años_servicios]
      ,[Estado_actual]
      ,[Id_Ubigeo]
      ,[Departamento]
      ,[Provincia]
      ,[Distrito]
      ,[Trabajadores_Evaluados]
  FROM [dbo].[vw_VistaEmpresaEvaluados]
  ORDER BY codEmpresa
GO

--Prueba
EXEC usp_ListarEmpresa
GO


--COMPROBAMOS
SELECT * FROM Tb_Empresa
GO



--1) Insertar un Paciente
CREATE OR ALTER PROCEDURE usp_InsertarPaciente
	@vNom nvarchar (99),
	@vApe nvarchar (99),
	@vFNac date,
	@vDni nchar (8),
	@vSexo int,
	@vDir varchar(20),
	@vSang char(3),
	@vFoto nvarchar null,
	@vEmail varchar(320),
	@vFIngr datetime,
	@vTelef nvarchar (9) ,
	@vEsta int = 1, -- Determinante
	@vTipo int,
	@vCEmpr nvarchar (5),
	@vUsu_Reg nvarchar (20) NULL,
	@vId_Ubigeo nchar(6)
AS 
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite el registro de un paciente
declare @vcod char(8)
declare @vcont int
set @vcont=(Select count(*) from Tb_Paciente)
if @vcont=0
	set @vcod='00000001'
else 
	set @vcod= (Select Right(Max(codPaciente) + 100000001,8) FROM Tb_Paciente)
insert into Tb_Paciente values (@vcod, @vNom, @vApe, @vFNac, @vDni, @vSexo, @vDir, 
								@vSang, @vFoto, @vEmail, @vFIngr , @vTelef, @vEsta, 
								@vTipo, @vCEmpr,GETDATE(), @vUsu_Reg, NULL, NULL, @vId_Ubigeo)
GO

--Prueba
EXEC usp_InsertarPaciente 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Javier Prado 221', 'A+', '', 
								'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO

--2) Actualizar un Paciente
CREATE PROCEDURE usp_ActualizarPaciente
	@vCod char(8),
	@vNom nvarchar (99),
	@vApe nvarchar (99),
	@vFNac date,
	@vDni nchar (8),
	@vSexo int,
	@vDir varchar(20),
	@vSang char(3),
	@vFoto nvarchar = null,
	@vEmail varchar(320),
	@vFIngr datetime,
	@vTelef nvarchar (9) ,
	@vEsta int = 1, -- Determinante
	@vTipo int,
	@vCEmpr nvarchar (5),
	@vUsu_Ult_Mod nvarchar (20),
	@vId_Ubigeo nchar(6)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite la actualización del registro de un paciente
	UPDATE  Tb_Paciente SET 
			nomPaciente = @vNom,
			apePaciente = @vApe,
			fechaNacimiento = @vFNac,
			dniPaciente = @vDni,
			sexo = @vSexo,
			direcPaciente = @vDir,
			tipoSangre = @vSang,
			fotoPaciente = @vFoto,
			emailPaciente = @vEmail,
			fechaIngreso = @vFIngr,
			numTelefono = @vTelef,
			estado       = @vEsta,
			tipoCliente = @vTipo,
			codEmpresa = @vCEmpr,
			Fec_Ult_Mod  = GETDATE(),
			Usu_Ult_Mod  = @vUsu_Ult_Mod,
			Id_Ubigeo = @vId_Ubigeo
			WHERE 
			codPaciente  = @vCod
GO

--Prueba
EXEC usp_ActualizarPaciente '00000021', 'Alberto', 'Vasquez Vidal','10/07/1998', '74909986', 0, 'Av. Javier Prado 222', 'O-', '', 
								  'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO


--3) Eliminar un Paciente
CREATE OR ALTER PROCEDURE   usp_EliminarPaciente
@vCod char(8)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite la eliminación del registro de un paciente
DELETE FROM  Tb_Paciente
	   WHERE codPaciente = @vCod
GO

--Prueba
EXEC usp_EliminarPaciente '00000021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO

--4) Consultar un Paciente
CREATE OR ALTER PROCEDURE  usp_ConsultarPaciente
@vCod char(8)
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite consultar el registro de un paciente
SELECT [codPaciente]
      ,[nomPaciente]
      ,[apePaciente]
      ,[fechaNacimiento]
      ,[dniPaciente]
      ,[sexo]
      ,[direcPaciente]
	  ,[tipoSangre]
      ,[fotoPaciente]
	  ,[emailPaciente]
	  ,[fechaIngreso]
	  ,[numTelefono]
	  ,[estado]
	  ,[tipoCliente]
	  ,[codEmpresa]
	  ,[Fec_reg]
	  ,[Usu_Registro]
	  ,[Fec_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
  FROM [dbo].[Tb_Paciente]
  WHERE codPaciente = @vCod
GO

--Prueba
EXEC usp_ConsultarPaciente '00000020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO


--5) Listar un Estado de Paciente
CREATE OR ALTER PROCEDURE usp_ListarPaciente
AS
--Autor: Mauricio Vasquez Vidal
--Empresa: ISIL
--Sistema: Modulo de Estado
--Fecha Creación: 14/11/2021
--Fecha Modificación: 14/11/2021
--SP que permite mostrar el registro de pacientes
SELECT [codPaciente]
      ,[Nombre]
      ,[Apellido]
      ,[Genero]
      ,[Lugar_de_trabajo]
      ,[Fecha_Nacimiento]
      ,[Dni]
	  ,[Dirección]
      ,[Estado]
	  ,[Tipo_Cliente]
	  ,[Cantidad_de_evaluaciones]
  FROM [dbo].[vw_VistaPacienteEstado]
  ORDER BY codPaciente
GO

--Prueba
EXEC usp_ListarPaciente
GO

--COMPROBAMOS
SELECT * FROM Tb_Paciente
GO



---1: insertar un medico
CREATE OR ALTER PROCEDURE usp_InsertarMedico
@dniMedic nchar(8),
@nomMedico varchar(20),
@apeMedico varchar(20),
@numColegiatura char(9),
@fechaNacimiento date,
@emailMedico varchar(320),
@fotoMedico nvarchar,
@direcMedico varchar(99),
@estado integer=1,
@codEspecialidad nchar(2),
@Login_Usuario nvarchar(20),
@Usu_Registro nvarchar(20),
@Fech_Ult_Mod date,
@Usu_Ult_Mod nvarchar(20),
@Id_Ubigeo nchar(6),
@fec_ingreso datetime
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite la insercion un medico
declare @VcodMedico nchar(4)  
declare @vcont int
set @vcont=(Select count(*) from Tb_Medico)
-- Se obtiene el siguiente valor para el codigo de medico a 
-- insertar.
if @vcont= 0
	set @VcodMedico = '0001'
else
	set @VcodMedico=(select RIGHT(MAX(codMedico) + 10001,4) from Tb_Medico)
	--Insertamos el nuevo Medico
insert into Tb_Medico values ( @VcodMedico, @dniMedic, @nomMedico, @apeMedico, @numColegiatura, @fechaNacimiento, @emailMedico, @fotoMedico, @direcMedico, @estado,
							   @codEspecialidad, @Login_Usuario, GETDATE(), @Usu_Registro, null, null, @Id_Ubigeo, @fec_ingreso)
GO

--PRUEBA
EXEC usp_InsertarMedico '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', '', 
						'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', null, null, '140101', '2021-01-26 08:00:00'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

--2: Actualizar un medico 
CREATE OR ALTER PROCEDURE usp_ActualizarMedico
@vCodMedico nchar(4),
@dniMedic nchar(8),
@nomMedico varchar(20),
@apeMedico varchar(20),
@numColegiatura char(9),
@fechaNacimiento date,
@emailMedico varchar(320),
@fotoMedico nvarchar,
@direcMedico varchar(99),
@estado integer,
@codEspecialidad nchar(2),
@Login_Usuario nvarchar(20),
@Usu_Ult_Mod nvarchar(20),
@Id_Ubigeo nchar(6)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite la actualizacion un medico
	UPDATE  Tb_Medico SET 
			dniMedic = @dniMedic, 
			nomMedico = @nomMedico,
			apeMedico = @apeMedico,
			numColegiatura = @numColegiatura,
			fechaNacimiento = @fechaNacimiento,
			emailMedico = @emailMedico,
			fotoMedico = @fotoMedico,
			direcMedico = @direcMedico,
			estado = @estado,
			codEspecialidad = @codEspecialidad,
			Login_Usuario = @Login_Usuario,
			Fech_Ult_Mod = GETDATE(),
			Usu_Ult_Mod = @Usu_Ult_Mod,
			Id_Ubigeo = @Id_Ubigeo
WHERE codMedico = @VcodMedico
GO

--PRUEBA
EXEC usp_ActualizarMedico '0021', '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', '', 
						  'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', '140101'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO



--3: Eliminar un medico
CREATE OR ALTER PROCEDURE usp_EliminarMedico
@VcodMedico nchar(4)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite eliminar una medico
DELETE FROM  Tb_Medico
	   WHERE codMedico=@VcodMedico
GO

--PRUEBA
EXEC usp_EliminarMedico '0021'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

--4: Consultar un medico
CREATE OR ALTER PROCEDURE usp_ConsultarMedico
@vCodMedico nchar(4)
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite consultar un medico
SELECT [codMedico]
      ,[dniMedic]
      ,[nomMedico]
      ,[apeMedico]
      ,[numColegiatura]
      ,[fechaNacimiento]
      ,[emailMedico]
      ,[fotoMedico]
      ,[direcMedico]
      ,[estado]
      ,[codEspecialidad]
      ,[Login_Usuario]
	  ,[Fec_Reg]
	  ,[Usu_Registro]
	  ,[Fech_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
	  ,[fec_ingreso]
  FROM [dbo].[Tb_Medico]
WHERE codMedico = @vCodMedico
GO

--PRUEBA
EXEC usp_ConsultarMedico '0020'
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO


--5:  Listar medicos
CREATE OR ALTER PROCEDURE  usp_ListarMedico
AS
--Autor: Jennifer Oropeza
--Empresa: CHECKSALUD
--Sistema: Modulo de medico
--Fecha Creacion: 24/11/2021
--SP que permite listar una empresa
SELECT [codMedico]
      ,[dniMedic]
      ,[nomMedico]
      ,[apeMedico]
      ,[numColegiatura]
      ,[fechaNacimiento]
      ,[emailMedico]
      ,[fotoMedico]
      ,[direcMedico]
      ,[estado]
      ,[codEspecialidad]
      ,[Login_Usuario]
	  ,[Fec_Reg]
	  ,[Usu_Registro]
	  ,[Fech_Ult_Mod]
	  ,[Usu_Ult_Mod]
	  ,[Id_Ubigeo]
	  ,[fec_ingreso]
  FROM [dbo].[Tb_Medico]
ORDER BY codMedico
GO

--Prueba
EXEC usp_ListarMedico
GO

--COMPROBAMOS
SELECT * FROM Tb_Medico
GO

-- SP que devuelve todos los departamentos de la tabla Ubicacion
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_Departamentos]
as
  SELECT DISTINCT IDDEPA,DEPARTAMENTO 
  FROM Tb_Ubicacion
  ORDER BY Departamento 
GO

-- SP que devuelve todas las provincias de un solo departamento especifico
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_ProvinciasDepartamento]
@IdDepartamento char(2)
as
SELECT  DISTINCT IDPROV,PROVINCIA
FROM Tb_Ubicacion
WHERE IDDEPA=@IdDepartamento
ORDER BY Provincia 
GO

-- SP que devuelve todos los distritos de una sola provincia y de un solo departamento especifico
CREATE or ALTER Procedure [dbo].[usp_Ubigeo_DistritosProvinciaDepartamento]
@IdDepartamento char(2),
@IdProvincia char(2)
as
SELECT  IDDIST,DISTRITO
FROM Tb_Ubicacion
WHERE IDDEPA=@IdDepartamento AND IDPROV=@IdProvincia
ORDER BY Distrito 
GO

CREATE or ALTER Procedure [dbo].[usp_Empresa_Razon_Social]
as
  SELECT DISTINCT codEmpresa, Raz_soc_emp 
  FROM Tb_Empresa
  ORDER BY Raz_soc_emp 
GO

create or alter procedure usp_ConsultarUsuario
@vLogin nvarchar(20)
as
select Login_Usuario, Pass_Usuario, Niv_Usuario, Est_Usuario, Fec_Registro, Usu_Registro
from Tb_Usuario where Login_Usuario = @vLogin
go

CREATE OR ALTER PROCEDURE usp_ListaEspecialidades
AS
SELECT * FROM Tb_Especialidad
GO
-----------------------------------------------------------------------------------
-------------------------FIN PROCEDIMIENTO ALMACENADOS ----------------------------
-----------------------------------------------------------------------------------

--------------------------------------------------------------------------------
------------PROCEDIMIENTO ALMACENADO ESCENARIO TRANSACCIONAL--------------------
--------------------------------------------------------------------------------


CREATE TYPE MiResultado AS TABLE
(
-- Tipo de dato empleado para el registro de un Resultado de una Evaluacion
-- Elaborado por: Patricio Calderon (5-12-21)
	peso  float,	
	altura float,
	sangre nvarchar(99),
	orina nvarchar(99),
	ekg nvarchar(99),
	spiro nvarchar(99),
	psico nvarchar(99),
	rayosX nvarchar(99),
	audi nvarchar(99),
	vista nvarchar(99),
	codAnal char(5),
	codEnfe char(5),
	recom nvarchar(99),
	codPac nvarchar(8),
	Usu_Registro nvarchar(20)
)
GO

CREATE OR ALTER PROCEDURE usp_RegistrarEvaluacion
@vFecEva date,
@vEstado int,
@vCodMed nchar(4),
@vCodAudi char(3),
@vUsu_registro nvarchar(20),
@vCodEva char(5) OUTPUT, 
@detalles MiResultado READONLY --parametro tipo tabla con los resultados de la Evaluacion
AS
--SP que permite el registro de una nueva Evaluacion
--Modulo: Evaluaciones
--Elaborado por: Patricio Calderon (5-12-21)
BEGIN TRY --Iniciamos bloque TRY en SQL
	BEGIN TRANSACTION --Iniciamos la transaccion
	SET NOCOUNT OFF
	--1ro se obtiene el Numero de OC
	declare @vcont int
	set @vcont=(Select count(*) from Tb_Evaluacion)
		if @vcont=0 
			set @vCodEva ='00001'
		else
		--Se genera el numero de orden de compra
			set @vCodEva = (Select Right(Max(codEvaluacion)+ 100001 ,5) 
	From Tb_Evaluacion)
	--2do se inserta en la cabecera
	INSERT INTO Tb_Evaluacion VALUES
	(@vCodEva, @vFecEva, @vEstado, @vCodMed, @vCodAudi, GETDATE(), @vUsu_registro, null, null)
	--3ro se inserta el detalle 
	INSERT INTO Tb_Resultados
		SELECT peso, altura, sangre, orina, ekg, spiro, psico, rayosX, audi, vista, codAnal,
				@vCodEva as codEvaluacion, codEnfe, recom, codPac, GETDATE(), Usu_Registro, null, null
		from @detalles
	--4to si todo esta OK, se confirma la transaccion
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	--5to si algun paso fracasa, el flujo ingresa al bloque CATCH y se cancela 
	--la transaccion
	PRINT @@error
	ROLLBACK TRANSACTION
END CATCH
GO

--TESTEANDO--
declare @mitabla MiResultado
insert into @mitabla 
values  (80, 1.75, 'Resultados Sangre', 'Resultados orina', 
		'Resultados ekg', 'Resultados spiro', 'Resultados psico', 
		'Resultados rayosX', 'Resultados audi', 'Resultados vista',
		'00001', 'R00.0', 'Recomendaciones', '00000001', 'pcalderon2021')
declare @numgenerado char(5)
Execute usp_RegistrarEvaluacion '2020-04-03',1, '0011', '001','pcalderon2021',
                              @numgenerado OUTPUT,@mitabla
Print 'es....' +  @numgenerado
Select * from Tb_Evaluacion where codEvaluacion = @numgenerado 
Select * from Tb_Resultados where codEvaluacion = @numgenerado 
go

SELECT * FROM Tb_Evaluacion


---------------------------------------------------------------------------------
------------FIN DEL PROCEDIMIENTO ALMACENADO ESCENARIO TRANSACCIONAL-------------
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
---------------------------------DISPARADORES------------------------------------
---------------------------------------------------------------------------------

--CREAMOS LA TABLA DE AUDITORIA DE ANALISIS 
CREATE TABLE Tb_Analisis_Aud
(
	[codAnalisis] char(5) NOT NULL,
	[descAnalisis] Nvarchar(99) NULL,
	[costo] Money NULL,
	[estado] Int NOT NULL,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Ins
on Tb_Analisis
for Insert
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'INSERTADO', GETDATE()
From inserted 
go


--Prueba
EXEC usp_InsertarAnalisis 'EXAMEN PREOCUPACIONAL','416.00',1,'ezvrtgs' 
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud, PARA ACTUALIZACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Upd
on Tb_Analisis
for update
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'NUEVO', GETDATE()
From inserted 
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod,'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarAnalisis '00022', 'EXAMEN PREOCUPACIONAL','200.00', 0, 'pcalderon2021' 
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Analisis 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Analisis_Aud, PARA ELIMINACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Analisis_Elim
on Tb_Analisis
for delete 
as
Insert into Tb_Analisis_Aud 
Select [codAnalisis],[descAnalisis],[costo],[estado], Fec_reg,Usu_Registro,Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarAnalisis '00022'
GO

--Vemos la tabla Tb_Analisis_Aud
Select * from Tb_Analisis_Aud order by codAnalisis, FechaAccion 
go





--CREAMOS LA TABLA DE AUDITORIA DEl PACIENTE 
CREATE TABLE Tb_Paciente_Aud
(
	codPaciente nvarchar (8) NOT NULL,
	nomPaciente nvarchar (99) not null,
	apePaciente nvarchar (99) not null,
	fechaNacimiento date not null,
	dniPaciente nchar (8) not null,
	sexo int not null,
	direcPaciente varchar(20),
	tipoSangre char(3),
	fotoPaciente nvarchar null,
	emailPaciente varchar(320),
	fechaIngreso datetime,
	numTelefono nvarchar (9) not null,
	estado int not null,
	tipoCliente int,
	codEmpresa nvarchar (5),
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Id_Ubigeo nchar(6) NOT NULL,	
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Ins
on Tb_Paciente 
for Insert
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'INSERTADO', GETDATE()
From inserted 
go

--Prueba
EXEC usp_InsertarPaciente 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Javier Prado 221', 'AB-', null, 
								'mauvasquez0907@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go

SELECT * FROM Tb_Paciente
GO


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud, PARA ACTUALIZACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Upd
on Tb_Paciente 
for update
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'NUEVO', GETDATE()
From inserted 
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarPaciente '00000021', 'Mauricio', 'Vasquez Vidal','09/07/1998', '74909986', 0, 'Av. Raul Ferrero 130', 'AB-', null, 
								'mauvasquez0985@gmail.com', '2019-03-18 08:00:00', '997894748', 1, 3, '00006', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Paciente 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Paciente_Aud, PARA ELIMINACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Paciente_Elim
on Tb_Paciente 
for delete 
as
Insert into Tb_Paciente_Aud 
Select 	codPaciente, nomPaciente, apePaciente, fechaNacimiento, dniPaciente, sexo, direcPaciente, tipoSangre, null, emailPaciente, fechaIngreso,
	    numTelefono, estado, tipoCliente, codEmpresa, Fec_reg, Usu_Registro, Fec_Ult_Mod, Usu_Ult_Mod, Id_Ubigeo,'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarPaciente '00000021'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Paciente_Aud order by codPaciente, FechaAccion 
go




--CREAMOS LA TABLA DE AUDITORIA DE EMPRESA 
CREATE TABLE Tb_Empresa_Aud
(
	codEmpresa nvarchar (5) NOT NULL,
	Raz_soc_emp nvarchar (50) not null,
	Dir_emp nvarchar (50),
	Tel_emp  nvarchar (10),
	Ruc_emp nchar(11) not null,
	Rep_emp nvarchar (30),
	Id_Ubigeo nchar(6),
	fec_Ingreso datetime,
	estado int not null,
	Fec_reg datetime NULL,
	Usu_Registro nvarchar (20) NULL,
	Fec_Ult_Mod datetime NULL,
	Usu_Ult_Mod nvarchar (20) NULL,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Ins
on Tb_Empresa
for Insert
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'INSERTADO', GETDATE()
From inserted 
go

--Pruebaa
EXEC usp_InsertarEmpresa 'JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1, 'jleon'
GO


--Vemos la tabla Tb_Empresa_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go



--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud, PARA ACTUALIZACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Upd
on Tb_Empresa
for update
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'NUEVO', GETDATE()
From inserted 
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarEmpresa '00021','JENNIFER S.A.C', 'Av. Javier Prado Este 234', '3872345', '20500397665', 'Martha Bellido', '140101', 1, 'jleon'
GO

--Vemos la tabla Tb_Empresa_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go

--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Empresa 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Empresa_Aud, PARA ELIMINACION
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Empresa_Elim
on Tb_Empresa
for delete 
as
Insert into Tb_Empresa_Aud 
Select codEmpresa, Raz_soc_emp, Dir_emp, Tel_emp, Ruc_emp,
	   Rep_emp, Id_Ubigeo, fec_Ingreso, estado, Fec_reg, Usu_Registro, Fec_Ult_Mod,
	   Usu_Ult_Mod, 'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarEmpresa '00021'
GO

--Vemos la tabla Tb_Medico_Aud
Select * from Tb_Empresa_Aud order by codEmpresa, FechaAccion 
go


--CREAMOS LA TABLA DE AUDITORIA DEl MEDICO 
CREATE TABLE Tb_Medico_Aud
(
	[codMedico] Nchar(4) NOT NULL,
	[dniMedic] Nchar(8) NULL,
	[nomMedico] Varchar(20) NOT NULL,
	[apeMedico] Varchar(20) NOT NULL,
	[numColegiatura] Char(9) NOT NULL,
	[fechaNacimiento] Date NOT NULL,
	[emailMedico] Varchar(320) NULL,
	[fotoMedico] nvarchar NULL,
	[direcMedico] Varchar(99) NULL,
	[estado] Int NOT NULL,
	[codEspecialidad] Nchar(2) NULL,
	[Login_Usuario] Nvarchar(20) NULL,
	[Fec_Reg] Datetime NULL,
	[Usu_Registro] Nvarchar(20) NULL,
	[Fech_Ult_Mod] Date NULL,
	[Usu_Ult_Mod] Nvarchar(20) NULL,
	[Id_Ubigeo] Nchar(6) NOT NULL,
	[fec_ingreso] datetime,
	Accion varchar(20) NULL,
	FechaAccion smalldatetime NULL
)
GO
--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Ins
on Tb_Medico
for Insert
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],NULL, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'INSERTADO', GETDATE()
From inserted 
go

--PRUEBA
EXEC usp_InsertarMedico '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', null, 
						'Costa Azul 296', 1, '12', 'mengeS2021', 'jleon', null, null, '140101', '2021-01-26 08:00:00'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud, PARA ACTUALIZACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Upd
on Tb_Medico
for update
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'NUEVO', GETDATE()
From inserted 
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'ANTERIOR', GETDATE()
From deleted 
go

--Prueba
EXEC usp_ActualizarMedico '0021', '80851339', 'Mengeche', 'Saba Rojas', '523455646', '05/03/1978', 'mengeSR@gmail.com', null, 
						  'mar Azul 296', 1, '12', 'mengeS2021', 'jleon', '140101'
GO

--Vemos la tabla Tb_Paciente_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


--TRIGGER PARA MANEJO DE AUDITORIA DE LA Tb_Medico 
--QUE DERIVA LA ACCION A LA TABLA  Tb_Medico_Aud, PARA ELIMINACION 
--ELABORADO POR (05/12/2021)
Create or alter trigger TR_Tb_Medico_Elim
on Tb_Medico
for delete 
as
Insert into Tb_Medico_Aud 
Select 	[codMedico], [dniMedic], [nomMedico], [apeMedico], [numColegiatura], [fechaNacimiento], [emailMedico],null, [direcMedico], [estado],
	    [codEspecialidad], [Login_Usuario], [Fec_Reg], [Usu_Registro], [Fech_Ult_Mod], [Usu_Ult_Mod], [Id_Ubigeo],[fec_ingreso],'ELIMINADO', GETDATE()
From deleted 
go

--Prueba
EXEC usp_EliminarMedico '0021'
GO

--Vemos la tabla Tb_Medico_Aud
Select * from Tb_Medico_Aud order by codMedico, FechaAccion 
go


---------------------------------------------------------------------------------
---------------------------FIN DE LOS DISPARADORES-------------------------------
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
-----------------COMIENZO DE LOS PROCEDIMIENTOS DE PAGINACION--------------------
---------------------------------------------------------------------------------


--1) Paginacion Analisis Estado
CREATE or ALTER PROCEDURE usp_AnalisisEstado_Paginacion
@codAnalisis varchar(5) = '',
@Lugar_de_trabajo varchar(50) = '',
@TipoAnalisis varchar(99) = '',
@NumPag int 
AS
-- SP FILTRADO POR CODIGO DE ANALISIS Y LUGAR DE TRABAJO
-- MODULO ANALISIS
-- ELABORADO POR : MAURICIO MANUEL VASQUEZ VIDAL - 05/12/2021
DECLARE @PAGESIZE INT
SET @PAGESIZE = 5 
IF @codAnalisis='' AND @Lugar_de_trabajo='' AND @TipoAnalisis=''
    BEGIN
	           SELECT top 5 codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo , TipoAnalisis, CostoAnalisis
               from vw_VistaAnalisisEstado
			   ORDER BY codAnalisis
    END
ELSE
   BEGIN
             IF @codAnalisis=''
			         SET @codAnalisis='%'
			 IF @Lugar_de_trabajo=''
			         SET @Lugar_de_trabajo='%'
			 IF @TipoAnalisis=''
					SET @TipoAnalisis='%'
              
               SELECT top 5 codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo ,TipoAnalisis, CostoAnalisis
               from 
		 (SELECT codAnalisis, NombrePaciente, ApellidoPaciente, Lugar_de_trabajo ,TipoAnalisis, CostoAnalisis,
				ROW_NUMBER() OVER (ORDER BY codAnalisis) AS NumOrden 
				from vw_VistaAnalisisEstado
				where 
				     codAnalisis like '%' + @codAnalisis + '%'
				 and Lugar_de_trabajo like '%' + @Lugar_de_trabajo + '%'
				 and TipoAnalisis like '%' + @TipoAnalisis + '%'
				
			) AS CONSULTAPAGINADAANALISIS 
			WHERE NumOrden BETWEEN @PageSize * @NUMPAG + 1 AND @PageSize * (@NUMPAG + 1)
	            ORDER BY codAnalisis 
END
GO

EXEC usp_AnalisisEstado_Paginacion '','','EXAMEN PREOCUPACIONAL', 1
GO


--2) Paginacion de Medico Estado

CREATE or ALTER PROCEDURE usp_MedicoEstado_Paginacion
@codMedico varchar(5)='',
@dniMedic varchar(50)='',
@Especialidad varchar(99)='',
@NumPag int =1
AS
-- SP FILTRADO POR CODIGO DE MEDICO Y DNI DEL MEDICO
-- MODULO MEDICO
-- ELABORADO POR : MAURICIO MANUEL VASQUEZ VIDAL - 05/12/2021
DECLARE @NUMREG INT
DECLARE @PAGESIZE INT
SET @PAGESIZE=5 
IF @codMedico='' AND @dniMedic='' AND @Especialidad=''
    BEGIN
	           SELECT top 5 codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico
               from vw_VistaMedicoEstado
			   ORDER BY codMedico
    END
ELSE
   BEGIN
             IF @codMedico=''
			         SET @codMedico='%'

			 IF @dniMedic=''
			         SET @dniMedic='%'
			 IF @Especialidad=''
					 SET @Especialidad='%'
              
               SELECT top 5  codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico
               from 			  
		 ( SELECT codMedico, Nombre, Apellido, Especialidad,estado,fechaNacimiento,dniMedic,direcMedico ,emailMedico,
				ROW_NUMBER() OVER (ORDER BY codMedico DESC) AS NumOrden 
				from vw_VistaMedicoEstado
				where 
				     codMedico like '%' + @codMedico + '%'
				 and dniMedic like '%' + @dniMedic + '%'
				 and Especialidad like '%' + @Especialidad + '%'
			) AS CONSULTAPAGINADAMEDICO 
			WHERE NumOrden BETWEEN @PageSize * @NUMPAG + 1 AND @PageSize * (@NUMPAG + 1)
	            ORDER BY codMedico
END

GO
EXEC usp_MedicoEstado_Paginacion '','','', 1
GO


---------------------------------------------------------------------------------
----------------------FIN DE LOS PROCEDIMIENTOS DE PAGINACION--------------------
---------------------------------------------------------------------------------





