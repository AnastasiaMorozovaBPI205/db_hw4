CREATE TABLE "city" (
  "region" varchar,
  "name" varchar UNIQUE
);

CREATE TABLE "station" (
  "name" varchar UNIQUE,
  "tracksNr" int UNIQUE,
  "cityName" varchar,
  "previousStationName" varchar UNIQUE,
  "nextStationName" varchar UNIQUE
);

CREATE TABLE "train" (
  "trainNr" int UNIQUE,
  "length" int,
  "startStationName" varchar UNIQUE,
  "endStationName" varchar UNIQUE,
  "IDConnected" int UNIQUE
);

CREATE TABLE "connected" (
  "departure" date,
  "arrival" date,
  "id" int UNIQUE,
  "trainNr" int UNIQUE,
  "stationName" varchar UNIQUE
);

ALTER TABLE "station" ADD FOREIGN KEY ("cityName") REFERENCES "city" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("startStationName") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("endStationName") REFERENCES "station" ("name");

ALTER TABLE "connected" ADD FOREIGN KEY ("id") REFERENCES "train" ("IDConnected");

ALTER TABLE "station" ADD FOREIGN KEY ("name") REFERENCES "connected" ("stationName");
