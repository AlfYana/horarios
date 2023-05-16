CREATE TABLE horallamado (
    id SERIAL PRIMARY KEY,
    id_emp INTEGER UNIQUE,
    hora_llamado_e TIME WITHOUT TIME ZONE,
    hora_llamado_s TIME WITHOUT TIME ZONE,
    fecha_llamado DATE,
    llamado VARCHAR(30)
);