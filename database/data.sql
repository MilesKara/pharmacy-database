-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.40 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- -------------------------------------------------------
INSERT INTO `manufacturer` (`manufacturerID`, `brandName`) VALUES
	(1, 'Brand A'),
	(2, 'Brand B'),
	(3, 'Brand C'),
	(4, 'Brand D'),
	(5, 'Brand E'),
	(6, 'Brand F'),
	(7, 'Brand G'),
	(8, 'Brand H'),
	(9, 'Brand I'),
	(10, 'Brand J');

INSERT INTO `medication` (`medicationID`, `name`, `form`, `strength`, `manufacturerID`) VALUES
	(1, 'Aspirin', 'Tablet', '500mg', 1),
	(2, 'Ibuprofen', 'Tablet', '200mg', 2),
	(3, 'Paracetamol', 'Tablet', '500mg', 3),
	(4, 'Amoxicillin', 'Capsule', '250mg', 4),
	(5, 'Cetirizine', 'Tablet', '10mg', 5),
	(6, 'Loratadine', 'Tablet', '10mg', 6),
	(7, 'Metformin', 'Tablet', '500mg', 7),
	(8, 'Simvastatin', 'Tablet', '20mg', 8),
	(9, 'Omeprazole', 'Capsule', '20mg', 9),
	(10, 'Prednisone', 'Tablet', '5mg', 10);

INSERT INTO `patients` (`personID`, `insuranceType`, `medicationHistory`) VALUES
	(1, 'Health Insurance', 'Aspirin, Ibuprofen'),
	(2, 'Private Insurance', 'Ibuprofen'),
	(3, 'Private Insurance', 'Amoxicillin'),
	(4, 'Health Insurance', 'Cetirizine'),
	(5, 'Health Insurance', 'Paracetamol, Cetirizine'),
	(6, 'Public Insurance', 'Metformin'),
	(7, 'Private Insurance', 'Loratadine'),
	(8, 'Public Insurance', 'Metformin'),
	(9, 'Private Insurance', 'Simvastatin'),
	(10, 'Health Insurance', 'Omeprazole, Prednisone');

INSERT INTO `persons` (`personID`, `firstName`, `lastName`, `DOB`, `phoneNum`) VALUES
	(1, 'John', 'Doe', '1985-06-15', '123-456-7890'),
	(2, 'Jane', 'Smith', '1990-12-20', '234-567-8901'),
	(3, 'Dr. Mary', 'Johnson', '1978-03-25', '345-678-9012'),
	(4, 'Dr. James', 'Williams', '1982-01-10', '456-789-0123'),
	(5, 'Alice', 'Brown', '1987-02-20', '567-890-1234'),
	(6, 'Bob', 'Davis', '1992-05-25', '678-901-2345'),
	(7, 'Dr. Emily', 'Wilson', '1980-07-05', '789-012-3456'),
	(8, 'Dr. Sarah', 'Moore', '1995-11-15', '890-123-4567'),
	(9, 'Charlie', 'Taylor', '1983-03-30', '901-234-5678'),
	(10, 'Daniel', 'Anderson', '1990-04-12', '012-345-6789');

INSERT INTO `prescription` (`rxNumber`, `providerID`, `patientID`, `medicationID`, `dosage`, `prescriptionWritten`) VALUES
	(1, 3, 1, 1, '1 tablet daily', '2024-01-01'),
	(2, 3, 2, 2, '2 tablets daily', '2024-01-02'),
	(3, 7, 5, 6, '1 tablet daily', '2024-02-15'),
	(4, 4, 6, 3, '1 capsule daily', '2024-03-01'),
	(5, 8, 9, 8, '1 tablet daily', '2024-04-20'),
	(6, 10, 10, 9, '1 tablet daily', '2024-05-10'),
	(7, 5, 3, 7, '2 tablets daily', '2024-06-01'),
	(8, 6, 4, 5, '1 tablet daily', '2024-07-01'),
	(9, 9, 8, 4, '1 tablet daily', '2024-08-20'),
	(10, 2, 7, 10, '1 tablet daily', '2024-09-10');


INSERT INTO `providers` (`personID`, `licenseNum`, `type`) VALUES
	(1, '99887', 'Doctor'),
	(2, '55432', 'Dentist'),
	(3, '12345', 'Doctor'),
	(4, '67890', 'Dentist'),
	(5, '76543', 'Veterinarian'),
	(6, '33411', 'Doctor'),
	(7, '11223', 'Veterinarian'),
	(8, '44556', 'Doctor'),
	(9, '22334', 'Dentist'),
	(10, '99876', 'Veterinarian');
