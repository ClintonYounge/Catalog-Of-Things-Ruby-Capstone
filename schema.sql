-- music_albums table
CREATE TABLE music_albums (
    on_spotify BOOLEAN NOT NULL,
    can_be_archived BOOLEAN NOT NULL
);

-- genres table
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    items ARRAY[1000]
);