CREATE TABLE "StationPersonell" (
  "PersNr" int UNIQUE,
  "NameNr" int,
  "StatNr" int
);

CREATE TABLE "Station" (
  "StatNr" int UNIQUE,
  "Name" varchar
);

CREATE TABLE "Room" (
  "RoomNr" int UNIQUE,
  "BedsNr" int,
  "StatNr" int
);

CREATE TABLE "Patient" (
  "PatientNr" int UNIQUE,
  "Name" varchar,
  "Disease" varchar,
  "RoomNr" int,
  "AdmissionFrom" varchar,
  "AdmissionTo" varchar,
  "PersNr" int
);

CREATE TABLE "Caregiver" (
  "PersNr" int UNIQUE,
  "Qualification" varchar
);

CREATE TABLE "Doctor" (
  "PersNr" int UNIQUE,
  "Area" varchar,
  "Rank_" int
);

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("PersNr");
