CREATE TABLE regions (
    id SERIAL NOT NULL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE users (
    id SERIAL NOT NULL PRIMARY KEY,
    user_region INT NOT NULL REFERENCES regions,
    email_address text NOT NULL UNIQUE
);


CREATE TABLE categories (
    id SERIAL NOT NULL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE posts (
    id SERIAL NOT NULL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users,
    category_id INT NOT NULL REFERENCES categories,
    region_id INT NOT NULL REFERENCES regions,
    location text NOT NULL,
    price INT NOT NULL,
    post_content text NOT NULL
);