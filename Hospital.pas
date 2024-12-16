program ManajemenRumahSakit;

uses crt, sysutils;

// Mendefinisikan tipe data untuk pasien, janji temu, resep obat, rawat inap, dan operasi
type
    TPeserta = record
        ID: Integer;
        Nama: String[50];
        Umur: Integer;
        JenisKelamin: String[10];
        Alamat: String[100];
    end;

    TJanjiTemu = record
        IDPasien: Integer;
        NamaDokter: String[50];
        TanggalJanji: TDateTime;
    end;

    TResepObat = record
        IDPasien: Integer;
        NamaObat: String[50];
        Dosis: String[20];
        Durasi: Integer;
    end;

    TJadwalRawatInap = record
        IDPasien: Integer;
        NomorKamar: Integer;
        TanggalMasuk: TDateTime;
        TanggalKeluar: TDateTime;
    end;

    TJadwalOperasi = record
        IDPasien: Integer;
        JenisOperasi: String[50];
        TanggalOperasi: TDateTime;
    end;

// Variabel untuk menyimpan data pasien, janji temu, resep obat, rawat inap, dan operasi
var
    Pasien: array[1..100] of TPeserta;
    JanjiTemu: array[1..100] of TJanjiTemu;
    ResepObat: array[1..100] of TResepObat;
    JadwalRawatInap: array[1..100] of TJadwalRawatInap;
    JadwalOperasi: array[1..100] of TJadwalOperasi;
    JumlahPasien, JumlahJanjiTemu, JumlahResepObat, JumlahRawatInap, JumlahOperasi: Integer;

// Prosedur untuk menampilkan garis pemisah
procedure Garis;
begin
    Writeln('============================================================');
end;

// Prosedur untuk menampilkan daftar pasien
procedure TampilkanPasien;
var
    i: Integer;
begin
    Garis;
    Writeln('                     Daftar Pasien');
    Garis;
    for i := 1 to JumlahPasien do
        with Pasien[i] do
            Writeln('ID: ', ID, ' | Nama: ', Nama, ' | Umur: ', Umur, ' | Jenis Kelamin: ', JenisKelamin, ' | Alamat: ', Alamat);
    if JumlahPasien = 0 then
        Writeln('Belum ada data pasien.');
    Garis;
    Writeln('Tekan Enter untuk kembali ke menu...');
    Readln;
end;

// Prosedur untuk menampilkan daftar janji temu
procedure TampilkanJanjiTemu;
var
    i: Integer;
begin
    Garis;
    Writeln('                  Daftar Janji Temu');
    Garis;
    for i := 1 to JumlahJanjiTemu do
        with JanjiTemu[i] do
            Writeln('ID Pasien: ', IDPasien, ' | Dokter: ', NamaDokter, ' | Tanggal: ', DateToStr(TanggalJanji));
    if JumlahJanjiTemu = 0 then
        Writeln('Belum ada data janji temu.');
    Garis;
    Writeln('Tekan Enter untuk kembali ke menu...');
    Readln;
end;

// Prosedur untuk menampilkan daftar resep obat
procedure TampilkanResepObat;
var
    i: Integer;
begin
    Garis;
    Writeln('                  Daftar Resep Obat');
    Garis;
    for i := 1 to JumlahResepObat do
        with ResepObat[i] do
            Writeln('ID Pasien: ', IDPasien, ' | Obat: ', NamaObat, ' | Dosis: ', Dosis, ' | Durasi: ', Durasi, ' hari');
    if JumlahResepObat = 0 then
        Writeln('Belum ada data resep obat.');
    Garis;
    Writeln('Tekan Enter untuk kembali ke menu...');
    Readln;
end;

// Prosedur untuk menampilkan daftar rawat inap
procedure TampilkanRawatInap;
var
    i: Integer;
begin
    Garis;
    Writeln('               Daftar Jadwal Rawat Inap');
    Garis;
    for i := 1 to JumlahRawatInap do
        with JadwalRawatInap[i] do
            Writeln('ID Pasien: ', IDPasien, ' | Kamar: ', NomorKamar, ' | Masuk: ', DateToStr(TanggalMasuk), ' | Keluar: ', DateToStr(TanggalKeluar));
    if JumlahRawatInap = 0 then
        Writeln('Belum ada data rawat inap.');
    Garis;
    Writeln('Tekan Enter untuk kembali ke menu...');
    Readln;
end;

// Prosedur untuk menampilkan daftar operasi
procedure TampilkanOperasi;
var
    i: Integer;
begin
    Garis;
    Writeln('                 Daftar Jadwal Operasi');
    Garis;
    for i := 1 to JumlahOperasi do
        with JadwalOperasi[i] do
            Writeln('ID Pasien: ', IDPasien, ' | Operasi: ', JenisOperasi, ' | Tanggal: ', DateToStr(TanggalOperasi));
    if JumlahOperasi = 0 then
        Writeln('Belum ada data operasi.');
    Garis;
    Writeln('Tekan Enter untuk kembali ke menu...');
    Readln;
end;

// Prosedur untuk mendaftar pasien baru
procedure DaftarkanPasien;
var
    PasienBaru: TPeserta;
begin
    ClrScr;
    Garis;
    Writeln('               Formulir Pendaftaran Pasien');
    Garis;
    Inc(JumlahPasien);
    PasienBaru.ID := JumlahPasien;
    Write('Masukkan nama pasien      : ');
    Readln(PasienBaru.Nama);
    Write('Masukkan umur pasien      : ');
    Readln(PasienBaru.Umur);
    Write('Masukkan jenis kelamin    : ');
    Readln(PasienBaru.JenisKelamin);
    Write('Masukkan alamat pasien    : ');
    Readln(PasienBaru.Alamat);
    Pasien[JumlahPasien] := PasienBaru;
    Writeln('Pasien berhasil didaftarkan dengan ID: ', PasienBaru.ID);
    Garis;
    Readln;
end;

// Prosedur untuk membuat janji temu untuk pasien
procedure BuatJanjiTemu;  
var
    JanjiBaru: TJanjiTemu;
    TanggalStr: String;
begin
    ClrScr;
    Garis;
    Writeln('                  Buat Janji Temu');
    Garis;
    Inc(JumlahJanjiTemu);
    Write('Masukkan ID pasien          : ');
    Readln(JanjiBaru.IDPasien);
    Write('Masukkan nama dokter        : ');
    Readln(JanjiBaru.NamaDokter);
    Write('Masukkan tanggal janji (tahun-bulan-tanggal): ');
    Readln(TanggalStr);
    JanjiBaru.TanggalJanji := StrToDate(TanggalStr);
    JanjiTemu[JumlahJanjiTemu] := JanjiBaru;
    Writeln('Janji temu berhasil dibuat untuk pasien ID: ', JanjiBaru.IDPasien);
    Garis;
    Readln;
end;

// Prosedur untuk membuat resep obat untuk pasien
procedure BuatResepObat;
var
    ResepBaru: TResepObat;
begin
    ClrScr;
    Garis;
    Writeln('                  Buat Resep Obat');
    Garis;
    Inc(JumlahResepObat);
    Write('Masukkan ID pasien          : ');
    Readln(ResepBaru.IDPasien);
    Write('Masukkan nama obat          : ');
    Readln(ResepBaru.NamaObat);
    Write('Masukkan dosis (misal: 2x sehari) : ');
    Readln(ResepBaru.Dosis);
    Write('Masukkan durasi (hari)      : ');
    Readln(ResepBaru.Durasi);
    ResepObat[JumlahResepObat] := ResepBaru;
    Writeln('Resep obat berhasil dibuat untuk pasien ID: ', ResepBaru.IDPasien);
    Garis;
    Readln;
end;

// Prosedur untuk menjadwalkan rawat inap bagi pasien
procedure JadwalkanRawatInap;
var
    RawatInapBaru: TJadwalRawatInap;
    TanggalMasukStr, TanggalKeluarStr: String;
begin
    ClrScr;
    Garis;
    Writeln('               Jadwal Rawat Inap');
    Garis;
    Inc(JumlahRawatInap);
    Write('Masukkan ID pasien          : ');
    Readln(RawatInapBaru.IDPasien);
    Write('Masukkan nomor kamar        : ');
    Readln(RawatInapBaru.NomorKamar);
    Write('Masukkan tanggal masuk (tahun-bulan-tanggal): ');
    Readln(TanggalMasukStr);
    Write('Masukkan tanggal keluar (tahun-bulan-tanggal): ');
    Readln(TanggalKeluarStr);
    RawatInapBaru.TanggalMasuk := StrToDate(TanggalMasukStr);
    RawatInapBaru.TanggalKeluar := StrToDate(TanggalKeluarStr);
    JadwalRawatInap[JumlahRawatInap] := RawatInapBaru;
    Writeln('Rawat inap berhasil dijadwalkan untuk pasien ID: ', RawatInapBaru.IDPasien);
    Garis;
    Readln;
end;

// Prosedur untuk menjadwalkan operasi bagi pasien
procedure JadwalkanOperasi;
var
    OperasiBaru: TJadwalOperasi;
    TanggalStr: String;
begin
    ClrScr;
    Garis;
    Writeln('                  Jadwal Operasi');
    Garis;
    Inc(JumlahOperasi);
    Write('Masukkan ID pasien          : ');
    Readln(OperasiBaru.IDPasien);
    Write('Masukkan jenis operasi      : ');
    Readln(OperasiBaru.JenisOperasi);
    Write('Masukkan tanggal operasi (tahun-bulan-tanggal): ');
    Readln(TanggalStr);
    OperasiBaru.TanggalOperasi := StrToDate(TanggalStr);
    JadwalOperasi[JumlahOperasi] := OperasiBaru;
    Writeln('Operasi berhasil dijadwalkan untuk pasien ID: ', OperasiBaru.IDPasien);
    Garis;
    Readln;
end;

// Prosedur utama yang berfungsi sebagai menu utama sistem manajemen rumah sakit
procedure MenuUtama;
var
    pilihan: Integer;
begin
    repeat
        ClrScr;
        Garis;
        Writeln('                 Sistem Manajemen Rumah Sakit');
        Garis;
        Writeln('1. Daftarkan Pasien');
        Writeln('2. Lihat Daftar Pasien');
        Writeln('3. Buat Janji Temu');
        Writeln('4. Lihat Daftar Janji Temu');
        Writeln('5. Buat Resep Obat');
        Writeln('6. Lihat Daftar Resep Obat');
        Writeln('7. Jadwalkan Rawat Inap');
        Writeln('8. Lihat Daftar Rawat Inap');
        Writeln('9. Jadwalkan Operasi');
        Writeln('10. Lihat Daftar Operasi');
        Writeln('11. Keluar');
        Garis;
        Write('Masukkan pilihan Anda: ');
        Readln(pilihan);
        case pilihan of
            1: DaftarkanPasien;
            2: TampilkanPasien;
            3: BuatJanjiTemu;
            4: TampilkanJanjiTemu;
            5: BuatResepObat;
            6: TampilkanResepObat;
            7: JadwalkanRawatInap;
            8: TampilkanRawatInap;
            9: JadwalkanOperasi;
            10: TampilkanOperasi;
            11: Exit;
        else
            Writeln('Waduh pilihan tidak valid! Silakan coba lagi.');
            Readln;
        end;
    until pilihan = 11;
end;

begin
    // Inisialisasi jumlah data
    JumlahPasien := 0;
    JumlahJanjiTemu := 0;
    JumlahResepObat := 0;
    JumlahRawatInap := 0;
    JumlahOperasi := 0;
    // Menjalankan menu utama
    MenuUtama;
end.