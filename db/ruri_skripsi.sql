/*
Navicat MySQL Data Transfer

Source Server         : Januar Fonti
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : ruri_skripsi

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2015-06-20 15:14:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for artikel
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(35) COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_artikel`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of artikel
-- ----------------------------
INSERT INTO `artikel` VALUES ('1', 'Tekanan Darah', '', 'Seseorang yang memiliki tekanan darah tinggi memiliki risiko terkena stroke lebih besar dibandingkan dengan orang yang memiliki tekanan darah 120/80 secara konsisten. Angka 120 disebut tekanan sistolik, angka 80 disebut tekanan diastolik dan saling berpengaruh.');
INSERT INTO `artikel` VALUES ('5', 'Diabetes', '', 'Orang yang mengidap diabetes memiliki risiko terkena stroke empat kali lebih besar dari pada orang normal.');
INSERT INTO `artikel` VALUES ('2', 'Fibrilasi Atrium', '', 'Fibrilasi atrium sering terjadi pada orang yang memiliki tekanan darah tinggi, penyakit jantung atau diabetes. Fibrilasi atrium menyebabkan risiko stroke karena dapat menyebabkan genangan darah pada jantung.');
INSERT INTO `artikel` VALUES ('3', 'Merokok', '', 'Seseorang yang merokok memiliki tingkat risiko stroke lebih tinggi dari pada seseorang yang bukan perokok. Aktifitas merokok meningkatkan pembentukan gumpalan dan darah mengental, dan meningkatkan jumlah penumpukan plak di arteri.');
INSERT INTO `artikel` VALUES ('4', 'Kolesterol', '', 'Kolesterol yang tinggi dalam arteri dapat memblokir aliran darah ke otak dan menyebabkan stroke. Kadar kolesterol yang baik adalah ? 200, jika kadar kolesterol lebih tinggi maka sangat dianjurakan untuk mengubah pola makan, olahraga dan berobat.');
INSERT INTO `artikel` VALUES ('6', 'Aktivitas Fisik', '', 'Aktifitas fisik yang dimaksud adalah olahraga yang dilakukan secara rutin untuk meningkatkan kesehatan dan kebugaran. Sebuah penelitian menunjukkan bahwa orang yang melakukan olahraga minimal lima kali dalam seminggu memiliki risiko penyakit stroke yang kecil.');
INSERT INTO `artikel` VALUES ('7', 'Diet', '', 'Melakukan diet sehat atau pola makan sehat dapat membantu seseorang mengurangi risiko terkena penyakit stroke, meningkatkan kesehatan dan mempertahankan berat badan ideal. Dikatakan pola makan sehat jika seseorang menyeimbangkan kalori dan memilih makanan dengan baik.');
INSERT INTO `artikel` VALUES ('8', 'Riwayat Keluarga', '', 'Risiko terkena penyakit stroke lebih besar apabila ada anggota keluarga pernah mengalami stroke atau serangan jantung pada usia dini');

-- ----------------------------
-- Table structure for gejala
-- ----------------------------
DROP TABLE IF EXISTS `gejala`;
CREATE TABLE `gejala` (
  `id_gejala` int(100) NOT NULL AUTO_INCREMENT,
  `nama_gejala` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tingkat` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `skor` decimal(8,2) NOT NULL,
  `bawah` decimal(8,2) NOT NULL,
  `atas` decimal(8,2) NOT NULL,
  `Keterangan` varchar(5000) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_gejala`)
) ENGINE=MyISAM AUTO_INCREMENT=508 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of gejala
-- ----------------------------
INSERT INTO `gejala` VALUES ('4', 'Diabetes', 'Tinggi', '0.00', '0.00', '0.00', 'Diabetes dengan gula darah acak lebih dari 200 mg/dL');
INSERT INTO `gejala` VALUES ('3', 'Tekanan Darah', 'Rendah', '0.00', '0.00', '0.00', 'Tekanan darah pasiean dibawah 120/80');
INSERT INTO `gejala` VALUES ('2', 'Tekanan Darah', 'Sedang', '0.00', '0.00', '0.00', 'Tekanan darah pasiean diatas 120/80 - 139/89');
INSERT INTO `gejala` VALUES ('1', 'Tekanan Darah', 'Tinggi', '0.00', '0.00', '0.00', 'Tekanan darah pasiean diatas 140/90');
INSERT INTO `gejala` VALUES ('5', 'Diebetes', 'Sedang', '0.00', '0.00', '0.00', 'Diabetes dengan gula darah acak antara 160-200');
INSERT INTO `gejala` VALUES ('6', 'Diabetes', 'Rendah', '0.00', '0.00', '0.00', 'Diabetes dengan gula darah acak Kurang dari 160');
INSERT INTO `gejala` VALUES ('7', 'Riwayat Keluarga', 'Memiliki', '0.68', '0.75', '1.00', 'Pasien yakin dan mengetahui bahwa anggota keluarga memiliki riwayat stroke dimulai dari kakek dan/ nenek');
INSERT INTO `gejala` VALUES ('8', 'Riwayat Keluarga', 'Tidak Tahu', '0.96', '0.25', '0.75', 'Pasien tidak yakin atau tidak tahu bahwa anggota keluarga memiliki riwayat stroke dimulai dari kakek dan/ nenek');
INSERT INTO `gejala` VALUES ('9', 'Riwayat Keluarga', 'Tidak', '0.88', '0.00', '0.50', 'Pasien yakin dan mengetahui bahwa anggota keluarga tidak memiliki riwayat stroke dimulai dari kakek dan/ nenek');
INSERT INTO `gejala` VALUES ('10', 'Merokok', 'Sering', '0.80', '0.75', '1.00', 'Pasien adalah seorang perokok');
INSERT INTO `gejala` VALUES ('11', 'Merokok', 'Kadang-kadang', '0.96', '0.25', '0.75', 'Pasien kadang-kadang merokok');
INSERT INTO `gejala` VALUES ('12', 'Merokok', 'Tidak', '0.88', '0.00', '0.50', 'Pasien bukan seorang perokok');
INSERT INTO `gejala` VALUES ('13', 'Kolesterol', 'Tinggi', '0.00', '0.00', '0.00', 'Kolesterol pasien lebih dari 240 atau tidak diketahui');
INSERT INTO `gejala` VALUES ('14', 'Kolesterol', 'Sedang', '0.00', '0.00', '0.00', 'Kolesterol pasien antara 200-239');
INSERT INTO `gejala` VALUES ('15', 'Kolesterol', 'Rendah', '0.00', '0.00', '0.00', 'Kolesterol pasien kurang dari 200');
INSERT INTO `gejala` VALUES ('16', 'Aktivitas Fisik', 'Tidak Pernah', '0.70', '0.50', '0.75', 'Pasien tidak pernah melakukan olahraga');
INSERT INTO `gejala` VALUES ('17', 'Aktivitas Fisik', 'Jarang Olahraga', '0.48', '0.25', '0.50', 'Pasien Jarang Melakukan Olahraga');
INSERT INTO `gejala` VALUES ('18', 'Aktivitas Fisik', 'olahraga', '0.23', '0.00', '0.25', 'Pasien Sering Melakukan Olahraga');
INSERT INTO `gejala` VALUES ('19', 'Diet', 'Obesitas', '0.00', '0.00', '0.00', 'Bersadarkan IMT lebih dari 30');
INSERT INTO `gejala` VALUES ('20', 'Diet', 'Overweight', '0.00', '0.00', '0.00', 'Berdasarkan IMT antara 25-30');
INSERT INTO `gejala` VALUES ('21', 'Diet', 'Normal', '0.00', '0.00', '0.00', 'Berdasarkan IMT Kurang dari 25');
INSERT INTO `gejala` VALUES ('22', 'Riwayat Fibrilasi Atrium', 'Tidak Beraturan', '0.71', '0.50', '0.75', '-');
INSERT INTO `gejala` VALUES ('23', 'Riwayat Fibrilasi Atrium', 'Tidak tahu', '0.41', '0.25', '0.50', 'Pasien tidak yakin detak jantungnya beraturan atau tidak');
INSERT INTO `gejala` VALUES ('24', 'Riwayat Fibrilasi Atrium', 'Beraturan', '0.21', '0.00', '0.25', 'Pasien yakin detak jantungnya beraturan');

-- ----------------------------
-- Table structure for konsul
-- ----------------------------
DROP TABLE IF EXISTS `konsul`;
CREATE TABLE `konsul` (
  `id_konsul` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `gejala` text COLLATE latin1_general_ci NOT NULL,
  `penyakit` text COLLATE latin1_general_ci NOT NULL,
  `obat` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_konsul`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of konsul
-- ----------------------------

-- ----------------------------
-- Table structure for rule2
-- ----------------------------
DROP TABLE IF EXISTS `rule2`;
CREATE TABLE `rule2` (
  `id_rule` int(11) NOT NULL AUTO_INCREMENT,
  `gejala` text COLLATE latin1_general_ci NOT NULL,
  `tingkat_risiko` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=MyISAM AUTO_INCREMENT=2325 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of rule2
-- ----------------------------
INSERT INTO `rule2` VALUES ('2105', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2106', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2107', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2108', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2109', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2110', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2111', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2112', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2113', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2114', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2115', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2116', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2117', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2118', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2119', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2120', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2121', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2122', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2123', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2124', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2125', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2126', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2127', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2128', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2129', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2130', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2131', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2132', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2133', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2134', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('15', 'Tekanan Darah=Tinggi,Diabetes=Tinggi,Riwayat Keluarga=tidak tahu,Merokok=Sering,Kolesterol=Tinggi,aktivitas fisik=jarang olahraga,Diet=Obesitas,Fibrilasi Atrium=Tidak Beraturan', 'Stroke Tinggi');
INSERT INTO `rule2` VALUES ('14', 'Tekanan Darah=Tinggi,Diabetes=Tinggi,Riwayat Keluarga=memiliki,Merokok=Sering,Kolesterol=Tinggi,aktivitas fisik=jarang olahraga,Diet=Obesitas,Fibrilasi Atrium=Tidak Beraturan', 'Stroke Tinggi');
INSERT INTO `rule2` VALUES ('13', 'Tekanan Darah=Tinggi,Diabetes=Tinggi,Riwayat Keluarga=tidak tahu,Merokok=Sering,Kolesterol=Tinggi,aktivitas fisik=Tidak pernah,Diet=Obesitas,Fibrilasi Atrium=Tidak Beraturan', 'Stroke Tinggi');
INSERT INTO `rule2` VALUES ('12', 'Tekanan Darah=Tinggi,Diabetes=Tinggi,Riwayat Keluarga=memiliki,Merokok=Sering,Kolesterol=Tinggi,aktivitas fisik=Tidak pernah,Diet=Obesitas,Fibrilasi Atrium=Tidak Beraturan', 'Stroke Tinggi');
INSERT INTO `rule2` VALUES ('11', 'Tekanan Darah=Tinggi,Diabetes=Tinggi,Riwayat Keluarga=memiliki,Merokok=Sering', 'Stroke Tinggi');
INSERT INTO `rule2` VALUES ('2104', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2103', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2102', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2101', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2100', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2099', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2098', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2097', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2096', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2095', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2094', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2093', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2092', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2091', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2090', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2089', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2088', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2087', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2086', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2085', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2084', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2083', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2082', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2081', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2080', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2079', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2078', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2077', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2076', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2075', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2074', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2073', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2072', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2071', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2070', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2069', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2068', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2067', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2066', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2065', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2064', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2063', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2062', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2061', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2060', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2059', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2058', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2057', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2056', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2055', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2054', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2053', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2052', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2051', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2050', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2049', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2048', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2047', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2046', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2045', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2044', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2043', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2042', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2041', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2040', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2039', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2038', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2037', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2036', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2035', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2034', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2033', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2032', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2031', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2030', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2029', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2028', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2027', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2026', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2025', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2024', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2023', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2022', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2021', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2020', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2019', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2018', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2017', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2016', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2015', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2014', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2013', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2012', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2011', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2010', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2009', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2008', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2007', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2006', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2005', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('364', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('363', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('362', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('361', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('360', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('359', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('358', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('357', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('356', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('355', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('354', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('353', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('352', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('351', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('350', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('349', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('348', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('347', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('346', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('345', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('344', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('343', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('342', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('341', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('340', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('339', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('338', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('337', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('336', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('335', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('334', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('333', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('332', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('331', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('330', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('329', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('328', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('327', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('326', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('325', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('324', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('323', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('322', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('321', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('320', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('319', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('318', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('317', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Normal,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('316', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('315', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('314', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('313', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('312', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('311', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('310', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('309', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Rendah,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('308', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('307', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('306', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('305', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Tidak,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('304', 'Tekanan Darah=Rendah,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('303', 'Tekanan Darah=Sedang,Diabetes=Rendah,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('2004', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('302', 'Tekanan Darah=Rendah,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('301', 'Tekanan Darah=Sedang,Diabetes=Sedang,Riwayat Keluarga=Tidak,Merokok=Kadang-kadang,Kolesterol=Sedang,Aktivitas Fisik=olahraga,Diet=Overweight,Riwayat Fibrilasi Atrium=Tidak tahu\r\n', 'Stroke Rendah');
INSERT INTO `rule2` VALUES ('2003', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan\r\n', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2002', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2001', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Beraturan\r\n', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2135', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2136', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2137', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2138', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2139', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2140', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2141', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2142', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2143', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2144', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2145', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2146', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2147', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2148', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2149', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2150', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2151', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2152', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2153', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2154', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2155', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2156', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2157', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2158', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2159', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2160', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2161', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2162', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2163', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2164', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2165', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2166', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2167', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2168', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2169', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2170', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2171', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2172', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2173', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2174', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2175', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2176', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2177', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2178', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2179', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2180', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2181', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2182', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2183', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2184', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2185', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2186', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2187', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2188', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2189', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2190', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2191', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2192', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2193', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2194', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2195', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2196', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2197', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2198', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2199', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2200', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2201', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2202', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2203', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2204', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2205', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2206', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2207', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2208', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2209', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2210', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2211', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2212', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2213', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2214', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2215', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2216', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Tidak Tahu', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2217', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2218', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2219', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2220', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2221', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2222', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2223', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2224', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2225', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2226', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2227', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2228', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2229', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2230', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2231', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2232', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2233', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2234', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2235', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2236', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2237', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2238', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2239', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2240', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2241', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2242', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2243', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2244', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2245', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2246', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2247', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2248', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2249', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2250', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2251', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2252', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Obesitas, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2253', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2254', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2255', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2256', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2257', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2258', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2259', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2260', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2261', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2262', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2263', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2264', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2265', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2266', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2267', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2268', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2269', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2270', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2271', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2272', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2273', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2274', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2275', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2276', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2277', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2278', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2279', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2280', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2281', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2282', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2283', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2284', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2285', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2286', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2287', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2288', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Overweight, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2289', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2290', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2291', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2292', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2293', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2294', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2295', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2296', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2297', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2298', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2299', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2300', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2301', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2302', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2303', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2304', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2305', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2306', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=Jarang Olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2307', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2308', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2309', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2310', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2311', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2312', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Tinggi, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2313', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2314', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2315', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2316', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2317', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2318', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Sedang, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2319', 'Tekanan Darah=Tinggi, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2320', 'Tekanan Darah=Sedang, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2321', 'Tekanan Darah=Rendah, Diabetes=Tinggi, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2322', 'Tekanan Darah=Tinggi, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2323', 'Tekanan Darah=Sedang, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');
INSERT INTO `rule2` VALUES ('2324', 'Tekanan Darah=Rendah, Diabetes=Sedang, Riwayat Keluarga=Tidak Tahu, Merokok=Kadang-kadang, Kolesterol=Rendah, Aktivitas Fisik=olahraga, Diet=Normal, Riwayat Fibrilasi Atrium=Beraturan', 'Stroke Sedang');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `alamat` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
