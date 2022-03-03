(def;cek gejala diabetes
(defrule intro
    =>
    (printout t crlf "(NOTES : Jawab seluruh pertanyaan berikut dengan mengetik 0 untuk 'tidak' dan 1 untuk 'iya'" crlf)
	(assert (check_umur1)))
)
)

(defrule umur1
	(check_umur1)
	=>
	(printout t crlf "Apakah Anda berumur 5-15 tahun?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (umur1 no))
			 (assert (check_umur2)))
	(if (= ?x 1)
		then (assert (umur1 yes))
			(assert (check_gejalaanak)))
)

(defrule umur2
	(check_umur2)
	=>
	(printout t crlf "Apakah Anda berumur 15-30 tahun?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (umur2 no))
			 (assert (check_umur3)))
	(if (= ?x 1)
		then (assert (umur2 yes))
			(assert (check_gejala)))
)

(defrule umur3
	(check_umur3)
	=>
	(printout t crlf "Apakah Anda berumur lebih dari 30 tahun?" crlf)
	(bind ?x (read))
	(if (= ?x 1)
		then (assert (umur3 yes))
			(assert (check_gejala)))
)

(defrule gejalaanak
	(check_gejalaanak)
	=>
	(printout t crlf "Berikut gejala utama diabetes:
    1. Mudah lelah
    2. Mudah haus dan lapar
    3. Sering buang air kecil, terutama pada malam hari
    4. Berat badan turun
    5. Luka membutuhkan waktu lebih lama untuk sembuh" crlf)
	(printout t crlf "Apakah Anda merasakan 3 atau lebih gejala diatas?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (gejalaanak no))
        		(assert (check_riwayat)))
	(if (= ?x 1)
		then (assert (gejalaanak yes))
             		(assert (check_riwayat)))
)

(defrule gejala
	(check_gejala)
	=>
	(printout t crlf "Berikut gejala utama diabetes:
    1. Mudah lelah
    2. Mudah haus dan lapar
    3. Sering buang air kecil, terutama pada malam hari
    4. Berat badan turun
    5. Pandangan kabur
    6. Luka membutuhkan waktu lebih lama untuk sembuh" crlf)
	(printout t crlf "Apakah Anda merasakan 3 atau lebih gejala diatas?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (gejala no))
        		(assert (check_riwayat)))
	(if (= ?x 1)
		then (assert (gejala yes))
             		(assert (check_waktu)))
)

(defrule waktu
	(check_waktu)
	=>
	(printout t crlf "Apakah gejala diatas muncul dalam waktu yang cepat?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (waktu no))
			 (assert (check_riwayat)))
	(if (= ?x 1)
		then (assert (waktu yes))
			(assert (check_riwayat)))
)

(defrule riwayat
	(check_riwayat)
	=>
	(printout t crlf "Apakah Anda memiliki keluarga dengan riwayat diabetes?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (riwayat no))
			 (assert (check_BMI1)))
	(if (= ?x 1)
		then (assert (riwayat yes))
			(assert (check_BMI1)))
)

(defrule BMI1
	(check_BMI1)
	=>
	(printout t crlf "Berikut cara menghitung BMI (Body Mass Index) :
	BMI = berat badan (kg) / (tinggi badan (m))^2
Apakah hasil BMI Anda kurang dari 18,5?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (BMI1 no))
			 (assert (check_BMI2)))
	(if (= ?x 1)
		then (assert (BMI1 yes)))
)

(defrule BMI2
	(check_BMI2)
	=>
	(printout t crlf "Apakah hasil BMI Anda berada pada rentang 18,5-24,9?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (BMI2 no))
			 (assert (check_BMI3)))
	(if (= ?x 1)
		then (assert (BMI2 yes)))
)

(defrule BMI3
	(check_BMI3)
	=>
	(printout t crlf "Apakah hasil BMI Anda lebih dari 25?" crlf)
	(bind ?x (read))
	(if (= ?x 0)
		then (assert (BMI3 no)))
	(if (= ?x 1)
		then (assert (BMI3 yes)))
)

;hasil anak dengan gejala diabetes
(defrule anakgejalariwayat1
	(umur1 yes)
	(gejalaanak yes)
	(riwayat yes)
	(BMI1 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, dengan berat badan yang kurang dan riwayat 
keluarga diabetes, segera cek ke dokter." crlf)
)

(defrule anakgejalariwayat2
	(umur1 yes)
	(gejalaanak yes)
	(riwayat yes)
	(BMI2 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, dengan memiliki riwayat keluarga diabetes,
 segera cek ke dokter." crlf)
)

(defrule anakgejalariwayat3
	(umur1 yes)
	(gejalaanak yes)
	(riwayat yes)
	(BMI3 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, dengan berat badan berlebih dan
 memiliki riwayat keluarga diabetes, segera cek ke dokter." crlf)
)

(defrule anakgejala1
	(umur1 yes)
	(gejalaanak yes)
	(riwayat no)
	(BMI1 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, dengan berat badan yang kurang, 
disarankan untuk mengonsumsi makanan yang bergizi dan segera cek ke dokter." crlf)
)

(defrule anakgejala2
	(umur1 yes)
	(gejalaanak yes)
	(riwayat no)
	(BMI2 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, disarankan untuk mengonsumsi makanan 
yang bergizi dan cek ke dokter." crlf)
)

(defrule anakgejala3
	(umur1 yes)
	(gejalaanak yes)
	(riwayat no)
	(BMI3 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes 1, dengan berat badan berlebih, disaranka
n untuk mengonsumsi makanan yang bergizi dan cek ke dokter." crlf)
)

;hasil anak tanpa gejala diabetes
(defrule anakriwayatnogejala1
	(umur1 yes)
	(gejalaanak no)
	(riwayat yes)
	(BMI1 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang kurang dan memiliki riwayat keluarga diabetes, 
disarankan untuk mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule anakriwayatnogejala2
	(umur1 yes)
	(gejalaanak no)
	(riwayat yes)
	(BMI2 yes)
	=>
	(printout t crlf "Anda memiliki berat badan ideal namun memiliki riwayat keluarga diabetes, 
disarankan untuk tetap menjaga kesehatan, mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule anakriwayatnogejala3
	(umur1 yes)
	(gejalaanak no)
	(riwayat yes)
	(BMI3 yes)
	=>
	(printout t crlf "Anda memiliki berat badan berlebih dan memiliki riwayat keluarga diabetes, 
disarankan untuk mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule anaknogejalariwayat1
	(umur1 yes)
	(gejalaanak no)
	(riwayat no)
	(BMI1 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang kurang, disarankan untuk mengonsumsi 
makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule anaknogejalariwayat2
	(umur1 yes)
	(gejalaanak no)
	(riwayat no)
	(BMI2 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang ideal, disarankan untuk tetap menjaga kesehatan,
 mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule anaknogejalariwayat3
	(umur1 yes)
	(gejalaanak no)
	(riwayat no)
	(BMI3 yes)
	=>
	(printout t crlf "Anda memiliki berat badan berlebih, mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)


;hasil remaja dengan gejala diabetes
(defrule remajagejalacepatriwayat1
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat yes)
	(BMI1 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat 
sehingga memungkinkan Anda terkena diabetes tipe 1, dengan berat badan yang kurang 
dan riwayat keluarga diabetes, segeralah cek ke dokter." crlf)
)

(defrule remajagejalacepatriwayat2
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat yes)
	(BMI2 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat sehingga
 memungkinkan Anda terkena diabetes tipe 1, dengan riwayat keluarga diabetes, segeralah cek ke dokter." crlf)
)

(defrule remajagejalacepatriwayat3
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat yes)
	(BMI3 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat sehingga
 memungkinkan Anda terkena diabetes tipe 1, dengan berat badan berlebih dan riwayat keluarga diabetes,
 segeralah cek ke dokter." crlf)
)

(defrule remajagejalalamariwayat1
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat yes)
	(BMI1 yes)
	=>
	(printout t crlf "Dengan berat badan yang kurang dan riwayat keluarga diabetes, Anda juga 
memiliki gejala diabetes dan memungkinkan terkena diabetes tipe 2, segeralah memulai
 pola hidup sehat dan  cek ke dokter untuk mendapatkan penanganan yang cepat." crlf)
)

(defrule remajagejalalamariwayat2
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat yes)
	(BMI2 yes)
	=>
	(printout t crlf "Dengan memiliki riwayat keluarga diabetes, Anda juga memiliki gejala diabetes 
dan memungkinkan terkena diabetes tipe 2, segeralah memulai pola hidup sehat dan 
cek ke dokter untuk mendapatkan penanganan yang cepat." crlf)
)

(defrule remajagejalalamariwayat3
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat yes)
	(BMI3 yes)
	=>
	(printout t crlf "Dengan berat badan berlebih dan riwayat keluarga diabetes, 
Anda memiliki gejala diabetes dan memungkinkan terkena diabetes tipe 2, 
segeralah memulai pola hidup sehat dan  cek ke dokter untuk mendapatkan penanganan yang cepat." crlf)
)

(defrule remajagejalacepat1
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat no)
	(BMI1 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat 
sehingga memungkinkan Anda terkena diabetes tipe 1, dengan berat badan yang kurang, 
disarankan untuk mengonsumsi makanan yang bergizi dan segeralah cek ke dokter." crlf)
)

(defrule remajagejalacepat2
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat no)
	(BMI2 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat 
sehingga memungkinkan Anda terkena diabetes tipe 1, disarankan untuk mengonsumsi makanan yang
 bergizi dan segeralah cek ke dokter." crlf)
)

(defrule remajagejalacepat3
	(umur2 yes)
	(gejala yes)
	(waktu yes)
	(riwayat no)
	(BMI3 yes)
	=>
	(printout t crlf "Anda telah memiliki gejala diabetes dan gejala tersebut muncul dengan cepat 
sehingga memungkinkan Anda terkena diabetes tipe 1, dengan berat badan berlebih, 
disarankan untuk mengonsumsi makanan yang bergizi dan segeralah cek ke dokter." crlf)
)

(defrule remajagejalalama1
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat no)
	(BMI1 yes)
	=>
	(printout t crlf "Anda memiliki gejala diabetes dengan berat badan yang kurang 
memungkinkan Anda terkena diabetes tipe 2, segeralah memulai pola hidup sehat dan cek ke dokter 
untuk mendapatkan penanganan yang cepat." crlf)
)

(defrule remajagejalalama2
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat no)
	(BMI2 yes)
	=>
	(printout t crlf "Anda memiliki gejala diabetes yang memungkinkan Anda terkena diabetes tipe 2,
 segeralah memulai pola hidup sehat dan cek ke dokter untuk mendapatkan penanganan yang cepat." crlf)
)

(defrule remajagejalalama3
	(umur2 yes)
	(gejala yes)
	(waktu no)
	(riwayat no)
	(BMI3 yes)
	=>
	(printout t crlf "Anda memiliki gejala diabetes dengan berat badan berlebih, memungkinkan Anda 
terkena diabetes tipe 2, segeralah memulai pola hidup sehat dan cek ke dokter untuk mendapatkan penanganan yang cepat." crlf)
)


;hasil remaja tanpa gejala diabetes
(defrule remajariwayatnogejala1
	(umur2 yes)
	(gejala no)
	(riwayat yes)
	(BMI1 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang kurang dan memiliki riwayat keluarga diabetes, 
disarankan untuk mengonsumsi makanan yang bergizi dan rutin berolahraga serta menaikkan berat badan Anda." crlf)
)
l
(defrule remajariwayatnogejala2
	(umur2 yes)
	(gejala no)
	(riwayat yes)
	(BMI2 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang idealdan memiliki riwayat keluarga diabetes, 
disarankan untuk mengonsumsi makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule remajariwayatnogejala3
	(umur2 yes)
	(gejala no)
	(riwayat yes)
	(BMI3 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang kurang dan memiliki riwayat keluarga diabetes,
 disarankan untuk mengonsumsi makanan yang bergizi dan rutin berolahraga serta menurunkan berat badan Anda." crlf)
)

(defrule remajanogejalariwayat1
	(umur2 yes)
	(gejala no)
	(riwayat no)
	(BMI1 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang kurang, disarankan untuk mengonsumsi makanan
 yang bergizi dan rutin berolahraga serta menaikkan berat badan Anda." crlf)
)

(defrule remajanogejalariwayat2
	(umur2 yes)
	(gejala no)
	(riwayat no)
	(BMI2 yes)
	=>
	(printout t crlf "Anda memiliki berat badan yang ideal, tetap jaga kesehatan dengan mengonsumsi 
makanan yang bergizi dan rutin berolahraga." crlf)
)

(defrule remajanogejalariwayat3
	(umur2 yes)
	(gejala no)
	(riwayat no)
	(BMI3 yes)
	=>
	(printout t crlf "Anda memiliki berat badan berlebih, disarankan untuk mengonsumsi makanan yang
 bergizi dan rutin berolahraga serta menaikkan berat badan Anda." crlf)
)