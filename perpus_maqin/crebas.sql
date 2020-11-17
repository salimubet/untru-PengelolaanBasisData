/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/03/2020 21:43:47                          */
/*==============================================================*/


drop table if exists ANGGOTA;

drop table if exists BUKU;

drop table if exists DETIL_MEMINJAM;

drop table if exists DETIL_MENGEMBALIKAN;

drop table if exists MEMINJAM;

drop table if exists MENGEMBALIKAN;

drop table if exists PETUGAS;

/*==============================================================*/
/* Table: ANGGOTA                                               */
/*==============================================================*/
create table ANGGOTA
(
   ID_ANGGOTA           char(12) not null,
   ID_PETUGAS           char(15),
   NAMA_ANGGOTA         varchar(40) not null,
   ALAMAT_ANGGOTA       varchar(100),
   NO_TELP_ANGGOTA      int,
   primary key (ID_ANGGOTA)
);

alter table ANGGOTA comment 'tabel ini berisi identitas anggota perpustakaan';

/*==============================================================*/
/* Table: BUKU                                                  */
/*==============================================================*/
create table BUKU
(
   KODE_BUKU            char(12) not null,
   ID_PETUGAS           char(15),
   JUDUL_BUKU           varchar(100) not null,
   JUMLAH_BUKU          int not null,
   PENGARANG_BUKU       varchar(100),
   PENERBIT_BUKU        varchar(100),
   primary key (KODE_BUKU)
);

/*==============================================================*/
/* Table: DETIL_MEMINJAM                                        */
/*==============================================================*/
create table DETIL_MEMINJAM
(
   NO_STRUK             char(12) not null,
   KODE_BUKU            char(12) not null,
   ID_ANGGOTA           char(12),
   JML_BUKU             int not null,
   primary key (NO_STRUK, KODE_BUKU)
);

/*==============================================================*/
/* Table: DETIL_MENGEMBALIKAN                                   */
/*==============================================================*/
create table DETIL_MENGEMBALIKAN
(
   NO_STRUK             char(12) not null,
   KODE_BUKU            char(12) not null,
   ID_ANGGOTA           char(12),
   DENDA                int,
   primary key (NO_STRUK, KODE_BUKU)
);

/*==============================================================*/
/* Table: MEMINJAM                                              */
/*==============================================================*/
create table MEMINJAM
(
   KODE_BUKU            char(12) not null,
   ID_ANGGOTA           char(12) not null,
   TGL_PINJAM           date not null,
   TGL_KEMBALI          date not null,
   PETUGAS              varchar(40) not null,
   primary key (KODE_BUKU, ID_ANGGOTA)
);

/*==============================================================*/
/* Table: MENGEMBALIKAN                                         */
/*==============================================================*/
create table MENGEMBALIKAN
(
   KODE_BUKU            char(12) not null,
   ID_ANGGOTA           char(12) not null,
   TGL_PINJAM           date not null,
   TGL_KEMBALI          date not null,
   PETUGAS              varchar(1024) not null,
   primary key (KODE_BUKU, ID_ANGGOTA)
);

/*==============================================================*/
/* Table: PETUGAS                                               */
/*==============================================================*/
create table PETUGAS
(
   ID_PETUGAS           char(15) not null,
   NAMA_PETUGAS         varchar(40) not null,
   PASSWORD             varchar(12) not null,
   ALAMAT_PETUGAS       varchar(100),
   NO_TELP_PETUGAS      int,
   primary key (ID_PETUGAS)
);

alter table ANGGOTA add constraint FK_DILAYANI foreign key (ID_PETUGAS)
      references PETUGAS (ID_PETUGAS) on delete restrict on update cascade;

alter table BUKU add constraint FK_DIDATA foreign key (ID_PETUGAS)
      references PETUGAS (ID_PETUGAS) on delete restrict on update cascade;

alter table DETIL_MEMINJAM add constraint FK_RELATIONSHIP_7 foreign key (KODE_BUKU, ID_ANGGOTA)
      references MEMINJAM (KODE_BUKU, ID_ANGGOTA) on delete restrict on update cascade;

alter table DETIL_MENGEMBALIKAN add constraint FK_DETIL_MENGEMBALIKAN foreign key (KODE_BUKU, ID_ANGGOTA)
      references MENGEMBALIKAN (KODE_BUKU, ID_ANGGOTA) on delete restrict on update cascade;

alter table MEMINJAM add constraint FK_MEMINJAM foreign key (KODE_BUKU)
      references BUKU (KODE_BUKU) on delete restrict on update cascade;

alter table MEMINJAM add constraint FK_MEMINJAM2 foreign key (ID_ANGGOTA)
      references ANGGOTA (ID_ANGGOTA) on delete restrict on update cascade;

alter table MENGEMBALIKAN add constraint FK_MENGEMBALIKAN foreign key (KODE_BUKU)
      references BUKU (KODE_BUKU) on delete restrict on update cascade;

alter table MENGEMBALIKAN add constraint FK_MENGEMBALIKAN2 foreign key (ID_ANGGOTA)
      references ANGGOTA (ID_ANGGOTA) on delete restrict on update cascade;

