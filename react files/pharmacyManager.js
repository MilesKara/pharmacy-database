import React, { useEffect, useState } from "react"; 
import axios from "axios";

const PharmacyManager = () => {
  const [manufacturers, setManufacturers] = useState([]);
  const [patients, setPatients] = useState([]);
  const [prescriptions, setPrescriptions] = useState([]);
  const [medications, setMedications] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Fetch data for manufacturers
    axios.get("http://localhost:8080/api/manufacturers")
      .then((response) => setManufacturers(response.data))
      .catch((error) => {
        console.error("Error fetching manufacturers:", error);
        setError("Error fetching manufacturers");
      });

    // Fetch data for patients
    axios.get("http://localhost:8080/api/patients")
      .then((response) => setPatients(response.data))
      .catch((error) => {
        console.error("Error fetching patients:", error);
        setError("Error fetching patients");
      });

    // Fetch data for prescriptions
    axios.get("http://localhost:8080/api/prescriptions")
      .then((response) => setPrescriptions(response.data))
      .catch((error) => {
        console.error("Error fetching prescriptions:", error);
        setError("Error fetching prescriptions");
      });

    // Fetch data for medications
    axios.get("http://localhost:8080/api/medications")
      .then((response) => setMedications(response.data))
      .catch((error) => {
        console.error("Error fetching medications:", error);
        setError("Error fetching medications");
      });
  }, []);

  if (error) {
    return <div>{error}</div>;  // Display error message if there's an issue
  }

  return (
    <div>
      <h1>Pharmacy Manager</h1>

      <section>
        <h2>Manufacturers</h2>
        <ul>
          {manufacturers.map((manufacturer) => (
            <li key={manufacturer.manufacturerID}>
              {manufacturer.brandName}
            </li>
          ))}
        </ul>
      </section>

      <section>
        <h2>patients</h2>
        <ul>
          {patients.map((patient) => (
            <li key={patient.personID}>
              {patient.firstName} {patient.lastName}  {patient.DOB} {patient.phoneNumber}
            </li>
          ))}
        </ul>
      </section>

      <section>
        <h2>prescriptions</h2>
        <ul>
          {prescriptions.map((prescription) => (
            <li key={prescription.rxNumber}>
              Rx #{prescription.rxNumber}, Patient ID: {prescription.patientID}, Medication ID: {prescription.medicationID}, Dosage: {prescription.dosage}, Date Written: {prescription.prescriptionWritten}
            </li>
          ))}
        </ul>
      </section>

      <section>
        <h2>medications</h2>
        <ul>
          {medications.map((medication) => (
            <li key={medication.medicationID}>
              {medication.name} ({medication.form}, {medication.strength})
            </li>
          ))}
        </ul>
      </section>

      <section>
        <h2>provider</h2>
        <ul>
          {providers.map((provider) => (
            <li key={provider.personID}>
              {provider.licenseNum} {provider.type}
            </li>
          ))}
        </ul>
      </section>

    </div>
  );
};

export default PharmacyManager;
