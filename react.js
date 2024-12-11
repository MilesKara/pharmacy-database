import React, { useEffect, useState } from "react";
import axios from "axios";
import "./App.css"; // Optional CSS file for custom styles

const App = () => {
  const [manufacturers, setManufacturers] = useState([]);
  const [patients, setPatients] = useState([]);
  const [prescriptions, setPrescriptions] = useState([]);
  const [medications, setMedications] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    // Fetch Manufacturers
    axios.get("http://localhost:8080/api/manufacturers")
      .then((response) => setManufacturers(response.data))
      .catch(() => setError("Error fetching manufacturers"));

    // Fetch Patients
    axios.get("http://localhost:8080/api/patients")
      .then((response) => setPatients(response.data))
      .catch(() => setError("Error fetching patients"));

      // Fetch providers
    axios.get("http://localhost:8080/api/provider")
      .then((response) => setProviders(response.data))
      .catch(() => setError("Error fetching providers"));

    // Fetch Prescriptions
    axios.get("http://localhost:8080/api/prescriptions")
      .then((response) => setPrescriptions(response.data))
      .catch(() => setError("Error fetching prescriptions"));

    // Fetch Medications
    axios.get("http://localhost:8080/api/medications")
      .then((response) => setMedications(response.data))
      .catch(() => setError("Error fetching medications"));
  }, []);

  if (error) {
    return <div className="container my-5 text-center">{error}</div>;
  }

  return (
    <div className="container my-5">
      <h1 className="text-center mb-4">Pharmacy Management</h1>

      <div className="row">
        <div className="col-md-6">
          <h2>Manufacturers</h2>
          <ul className="list-group">
            {manufacturers.map((manufacturer) => (
              <li key={manufacturer.manufacturerID} className="list-group-item">
                {manufacturer.brandName}
              </li>
            ))}
          </ul>
        </div>

        <div className="col-md-6">
          <h2>Patients</h2>
          <ul className="list-group">
            {patients.map((patient) => (
              <li key={patient.personID} className="list-group-item">
                {patient.firstName} {patient.lastName}
              </li>
            ))}
          </ul>
        </div>
      </div>

      <div className="row mt-4">
        <div className="col-md-6">
          <h2>Prescriptions</h2>
          <ul className="list-group">
            {prescriptions.map((prescription) => (
              <li key={prescription.rxNumber} className="list-group-item">
                Rx #{prescription.rxNumber}, Patient ID: {prescription.patientID}
              </li>
            ))}
          </ul>
        </div>

        <div className="col-md-6">
          <h2>Medications</h2>
          <ul className="list-group">
            {medications.map((medication) => (
              <li key={medication.medicationID} className="list-group-item">
                {medication.name} ({medication.form}, {medication.strength})
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default App;
