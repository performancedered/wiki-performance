-- Create table
create table TABLERO_LTE_INTERFERENCE
(
  FECHA        DATE not null,
  LNCEL_NAME   VARCHAR2(300) not null,
  LNBTS_NAME   VARCHAR2(10) not null,
  LNCEL_ID     NUMBER not null,
  LNBTS_ID     NUMBER not null,
  OSSRC        VARCHAR2(10 CHAR) not null,
  BANDA        VARCHAR2(60),
  PAIS         VARCHAR2(10),
  RSSIPUSCHAVG NUMBER,
  SINRPUSCHAVG NUMBER,
  INTERFERIDO  NUMBER,
  RANSHARING   VARCHAR2(5)
)
tablespace DEVELOPER
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Add comments to the columns 
comment on column TABLERO_LTE_INTERFERENCE.FECHA
  is 'Fecha ISABW';
comment on column TABLERO_LTE_INTERFERENCE.LNCEL_NAME
  is 'Nombre de celda';
comment on column TABLERO_LTE_INTERFERENCE.LNBTS_NAME
  is 'Nombre del Sitio';
comment on column TABLERO_LTE_INTERFERENCE.LNCEL_ID
  is 'id de celda';
comment on column TABLERO_LTE_INTERFERENCE.LNBTS_ID
  is 'id de sitio';
comment on column TABLERO_LTE_INTERFERENCE.OSSRC
  is 'Regional Cluster';
comment on column TABLERO_LTE_INTERFERENCE.BANDA
  is 'Banda de Frecuencia';
comment on column TABLERO_LTE_INTERFERENCE.PAIS
  is 'Pais';
comment on column TABLERO_LTE_INTERFERENCE.RSSIPUSCHAVG
  is 'Potencia de señal';
comment on column TABLERO_LTE_INTERFERENCE.SINRPUSCHAVG
  is 'Relacion Señal Ruido';
comment on column TABLERO_LTE_INTERFERENCE.INTERFERIDO
  is '1 - interferido / 0 - no interferido';
comment on column TABLERO_LTE_INTERFERENCE.RANSHARING
  is 'Propietario de la Portadora';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TABLERO_LTE_INTERFERENCE
  add constraint LTE_INTERFERENCE_PK primary key (FECHA, LNCEL_NAME)
  using index 
  tablespace DEVELOPER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Create/Recreate indexes 
create index CEL_ID on TABLERO_LTE_INTERFERENCE (LNCEL_ID, LNBTS_ID, OSSRC)
  tablespace DEVELOPER
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 4M
    next 4M
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
