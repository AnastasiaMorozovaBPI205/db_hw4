CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "year" int,
  "title" varchar,
  "author" varchar,
  "page_count" int
);

CREATE TABLE "book_object" (
  "id" int PRIMARY KEY,
  "ISBN" int UNIQUE,
  "place" varchar
);

CREATE TABLE "book_category" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "publisher" (
  "id" int PRIMARY KEY,
  "adress" varchar,
  "name" varchar
);

CREATE TABLE "book_record" (
  "id" int PRIMARY KEY,
  "return_date" date
);

CREATE TABLE "reader" (
  "id" int PRIMARY KEY,
  "birth_date" date,
  "surname" varchar,
  "name" varchar,
  "adress" varchar
);

ALTER TABLE "book_object" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book" ADD FOREIGN KEY ("ISBN") REFERENCES "publisher" ("id");

ALTER TABLE "book_record" ADD FOREIGN KEY ("id") REFERENCES "book_object" ("id");

ALTER TABLE "book_record" ADD FOREIGN KEY ("id") REFERENCES "reader" ("id");

ALTER TABLE "book" ADD FOREIGN KEY ("ISBN") REFERENCES "book_category" ("id");
