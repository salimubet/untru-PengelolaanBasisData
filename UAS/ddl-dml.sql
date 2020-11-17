/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     14/05/2020 11:29:47                          */
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

/* Insert data petugas */
INSERT INTO petugas (ID_PETUGAS, NAMA_PETUGAS, PASSWORD, ALAMAT_PETUGAS, NO_TELP_PETUGAS) VALUES
("PT-001", "Moh. Faris", "peg001","Bangkalan",0819156291),
("PT-002", "Reza", "peg002","Bangkalan",08231456632),
("PT-003", "Rizky", "peg002","Bangkalan",08621826432),
("PT-004", "Fitri", "peg004","Surabaya",08525735746),
("PT-005", "Fatimah", "peg005","Surabaya",08413687717),
("PT-006", "Arya", "peg006","Surabaya",08413687717),
("PT-007", "Junaidi", "peg007","Bangkalan",0),
("PT-008", "Azizah", "peg008","Surabaya",0),
("PT-009", "Agus", "peg009","Surabaya",0),
("PT-010", "Khoirul", "peg010","Jombang",0),
("PT-011", "Rudi", "peg011","Jombang",0),
("PT-012", "Doddy", "peg012","Gresik",0),
("PT-013", "Budi", "peg013","Malang",0),
("PT-014", "Syaiful", "peg014","Jombang",0),
("PT-015", "Yusuf", "peg015","Jombang",0);

/* Insert data buku */
INSERT INTO buku (KODE_BUKU, ID_PETUGAS, JUDUL_BUKU, JUMLAH_BUKU, PENGARANG_BUKU, PENERBIT_BUKU) VALUES 
('S-001', 'PT-003', 'Manfaat Kulit Jeruk', 6, 'Dr. Hasan', 'Gramedia'),
('S-002', 'PT-013', 'Kimia Molekul', 2, 'Prof. Fadilah', 'Gramedia'),
('S-003', 'PT-007', 'Fisika Terapan', 5, 'Prof. Hanif', 'Gramedia'),
('T-001', 'PT-004', 'Listrik Dinamis', 2, 'Ir. Johan', 'Gramedia'),
('T-002', 'PT-002', 'Mesin Automata', 9, 'Khoiril dkk', 'Erlangga'),
('T-003', 'PT-010', 'Teori Mesin', 7, 'Khoiril dkk', 'Erlangga'),
('T-004', 'PT-013', 'Mesin dan Kehidupan', 5, 'Khoiril dkk', 'Erlangga'),
('T-005', 'PT-012', 'Pemrograman Mesin', 3, 'Khoiril dkk', 'Erlangga'),
('T-006', 'PT-001', 'Kiat Sukses Membuat Program', 7, 'Prof. Ayub', 'Gramedia'),
('T-007', 'PT-003', 'Coding untuk SMK', 8, 'Prof. Ayub', 'Erlangga'),
('T-008', 'PT-011', 'Dunia IT', 1, 'Prof. Ayub', 'Gramedia'),
('T-009', 'PT-002', 'AI Industri', 2, 'Prof. Ayub', 'Erlangga'),
('T-010', 'PT-008', 'Perangkat IT', 2, 'Prof. Ayub', 'Gramedia'),
('T-011', 'PT-004', 'Coding untuk Pemula', 7, 'Prof. Ayub', 'Gramedia'),
('B-001', 'PT-008', 'Filosofi Keraton', 2, 'Agus', 'Gramedia'),
('B-002', 'PT-006', 'Asal-Usul Kejawen', 2, 'Agus', 'Gramedia'),
('B-003', 'PT-002', 'Mengenal Kebudayaan Tengger', 1, 'Agus', 'Gramedia'),
('B-004', 'PT-005', 'Kebudayaan Bali', 3, 'Ketut', 'Gramedia'),
('K-001', 'PT-006', 'Efek Begadang', 9, 'dr. Irianto', 'Gramedia'),
('K-002', 'PT-013', 'Kesehatan Jantung', 7, 'dr. Irianto', 'Gramedia'),
('K-003', 'PT-001', 'Mencegah Stroke', 9, 'dr. Irianto', 'Gramedia'),
('K-004', 'PT-004', 'Limpa dan Fungsinya', 1, 'dr. Irianto', 'Gramedia'),
('K-005', 'PT-001', 'Efek Blue Light pada Mata', 6, 'dr. Andi', 'Gramedia'),
('K-006', 'PT-008', 'Menjaga Kesehatan Mata', 2, 'dr. Andi', 'Gramedia'),
('K-007', 'PT-002', 'Arti Perbedaan Warna Mata', 1, 'dr. Andi', 'Gramedia');

/* Insert data Anggota */
INSERT INTO anggota (ID_ANGGOTA, ID_PETUGAS, NAMA_ANGGOTA, ALAMAT_ANGGOTA, NO_TELP_ANGGOTA) VALUES 
('A-001', 'PT-001', 'Ahmad', 'Bangkalan', 0),
('A-002', 'PT-001', 'Boby', 'Lamongan', 0),
('A-003', 'PT-001', 'Candra', 'Bangkalan', 0),
('A-004', 'PT-002', 'Deni', 'Lamongan', 0),
('A-005', 'PT-001', 'Yudi', 'Surabaya', 0),
('A-006', 'PT-001', 'Fajar', 'Bangkalan', 0),
('A-007', 'PT-003', 'Toni', 'Surabaya', 0),
('A-008', 'PT-002', 'Zacky', 'Bangkalan', 0),
('A-009', 'PT-004', 'Rudi', 'Lamongan', 0),
('A-010', 'PT-006', 'Budi', 'Lamongan', 0),
('A-011', 'PT-009', 'Mahmud', 'Bangkalan', 0),
('A-012', 'PT-011', 'Zainal', 'Lamongan', 0),
('A-013', 'PT-003', 'Saiful', 'Bangkalan', 0),
('A-014', 'PT-004', 'Daniel', 'Surabaya', 0),
('A-015', 'PT-002', 'Rudi', 'Lamongan', 0),
('A-016', 'PT-001', 'Ahmad', 'Surabaya', 0),
('A-017', 'PT-002', 'Nur', 'Bangkalan', 0),
('A-018', 'PT-004', 'Nurdin', 'Bangkalan', 0),
('A-019', 'PT-002', 'Dedi', 'Malang', 0),
('A-020', 'PT-007', 'Yuda', 'Surabaya', 0),
('A-021', 'PT-010', 'Fahrul', 'Bangkalan', 0),
('A-022', 'PT-013', 'Tomi', 'Surabaya', 0),
('A-023', 'PT-009', 'Zuhri', 'Lamongan', 0),
('A-024', 'PT-015', 'Rusman', 'Bangkalan', 0),
('A-025', 'PT-014', 'Husni', 'Lamongan', 0),
('A-026', 'PT-010', 'Maimun', 'Bangkalan', 0),
('A-027', 'PT-013', 'Zaini', 'Surabaya', 0),
('A-028', 'PT-007', 'Khoirul', 'Bangkalan', 0),
('A-029', 'PT-014', 'Dani', 'Surabaya', 0),
('A-030', 'PT-002', 'Romi', 'Lamongan', 0);

/* Insert data meminjam */
INSERT INTO meminjam (KODE_BUKU, ID_ANGGOTA, TGL_PINJAM, TGL_KEMBALI, PETUGAS) VALUES
 ('B-002', 'A-004', '2019-01-04', '2019-01-05', 'Reza'),
('T-001', 'A-005', '2019-01-04', '2019-01-05', 'Moh. Faris'),
('K-002', 'A-003', '2019-01-04', '2019-01-05', 'Reza'),
('T-007', 'A-002', '2019-01-04', '2019-01-05', 'Moh. Faris'),
('T-005', 'A-006', '2019-01-04', '2019-01-05', 'Reza'),
('S-001', 'A-008', '2019-01-05', '2019-01-07', 'Moh. Faris'),
('K-001', 'A-012', '2019-01-05', '2019-01-07', 'Reza'),
('T-001', 'A-007', '2019-01-05', '2019-01-07', 'Moh. Faris'),
('T-006', 'A-013', '2019-01-06', '2019-01-08', 'Reza'),
('B-002', 'A-021', '2019-01-06', '2019-01-08', 'Moh. Faris'),
('T-009', 'A-017', '2019-01-06', '2019-01-08', 'Reza'),
('T-005', 'A-015', '2019-01-06', '2019-01-08', 'Moh. Faris'),
('T-003', 'A-001', '2019-01-06', '2019-01-08', 'Reza'),
('S-002', 'A-009', '2019-01-06', '2019-01-08', 'Moh. Faris'),
('K-003', 'A-027', '2019-01-06', '2019-01-08', 'Reza'),
('T-007', 'A-025', '2019-01-06', '2019-01-08', 'Moh. Faris');

/* Insert data detil_meminjam */
INSERT INTO detil_meminjam (NO_STRUK, `KODE_BUKU`, `ID_ANGGOTA`, JML_BUKU) VALUES 
('X-001', 'B-002', 'A-004',1),
('X-002', 'T-001', 'A-005',2),
('X-003', 'K-002', 'A-003',3),
('X-004', 'T-007', 'A-002',2),
('X-005', 'T-005', 'A-006',1),
('X-006', 'S-001', 'A-008',1),
('X-007', 'K-001', 'A-012',3),
('X-008', 'T-001', 'A-007',2),
('X-009', 'T-006', 'A-013',3),
('X-010', 'B-002', 'A-021',2),
('X-011', 'T-009', 'A-017',1),
('X-012', 'T-005', 'A-015',3),
('X-013', 'T-003', 'A-001',3),
('X-014', 'S-002', 'A-009',2),
('X-015', 'K-003', 'A-027',1),
('X-016', 'T-007', 'A-025',2);



/* Insert data Mengembalikan */
INSERT INTO mengembalikan (`KODE_BUKU`, `ID_ANGGOTA`, `TGL_PINJAM`, `TGL_KEMBALI`, PETUGAS) VALUES 
('B-002', 'A-004', '2019-01-04', '2019-01-05', 'Reza'),
('T-001', 'A-005', '2019-01-04', '2019-01-05', 'Moh. Faris'),
('K-002', 'A-003', '2019-01-04', '2019-01-05', 'Reza'),
('T-007', 'A-002', '2019-01-04', '2019-01-05', 'Rizky'),
('T-005', 'A-006', '2019-01-04', '2019-01-05', 'Junaidi'),
('S-001', 'A-008', '2019-01-05', '2019-01-15', 'Budi'),
('K-001', 'A-012', '2019-01-05', '2019-01-19', 'Maimun'),
('T-001', 'A-007', '2019-01-05', '2019-01-07', 'Azizah'),
('T-006', 'A-013', '2019-01-06', '2019-01-08', 'Azizah'),
('B-002', 'A-021', '2019-01-06', '2019-01-08', 'Doddy'),
('T-009', 'A-017', '2019-01-06', '2019-01-08', 'Budi'),
('T-005', 'A-015', '2019-01-06', '2019-01-08', 'Rizky'),
('T-003', 'A-001', '2019-01-06', '2019-02-28', 'Budi'),
('S-002', 'A-009', '2019-01-06', '2019-01-08', 'Maimun'),
('K-003', 'A-027', '2019-01-06', '2019-02-15', 'Doddy'),
('T-007', 'A-025', '2019-01-06', '2019-01-08', 'Azizah');

/* Insert data detil_mengembalikan DENDA=Rp 1000/hari, BATAS PINJAM 7 HARI*/

INSERT INTO detil_mengembalikan (NO_STRUK, `KODE_BUKU`, `ID_ANGGOTA`, DENDA) VALUES
('Y-001', 'B-002', 'A-004',0),
('Y-002', 'T-001', 'A-005',0),
('Y-003', 'K-002', 'A-003',0),
('Y-004', 'T-007', 'A-002',0),
('Y-005', 'T-005', 'A-006',0),
('Y-006', 'S-001', 'A-008',3000),
('Y-007', 'K-001', 'A-012',7000),
('Y-008', 'T-001', 'A-007',0),
('Y-009', 'T-006', 'A-013',0),
('Y-010', 'B-002', 'A-021',0),
('Y-011', 'T-009', 'A-017',0),
('Y-012', 'T-005', 'A-015',0),
('Y-013', 'T-003', 'A-001',46000),
('Y-014', 'S-002', 'A-009',0),
('Y-015', 'K-003', 'A-027',33000),
('Y-016', 'T-007', 'A-025',0);

