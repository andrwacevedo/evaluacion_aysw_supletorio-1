-- ===========================================================================
--  Junta de acueducto veredal  ·  SQL Server
--  Se entrega HECHO. No hay que disenarlo: hay que construir encima.
-- ===========================================================================

CREATE DATABASE bdacueducto;
GO
USE bdacueducto;
GO

CREATE TABLE tipo_suscriptor (
    id_tipo     INT IDENTITY(1,1) NOT NULL,
    codigo      VARCHAR(10)       NOT NULL,
    nombre      VARCHAR(60)       NOT NULL,
    se_factura  BIT               NOT NULL DEFAULT 1,

    CONSTRAINT pk_tipo_suscriptor PRIMARY KEY (id_tipo),
    CONSTRAINT uq_tipo_codigo     UNIQUE (codigo)
);
GO

CREATE TABLE suscriptor (
    id_suscriptor   INT IDENTITY(1,1) NOT NULL,
    numero          VARCHAR(15)       NOT NULL,
    nombre_titular  VARCHAR(120)      NOT NULL,
    predio          VARCHAR(150)      NOT NULL,
    telefono        VARCHAR(20)       NULL,
    fk_tipo         INT               NOT NULL,
    activo          BIT               NOT NULL DEFAULT 1,

    CONSTRAINT pk_suscriptor      PRIMARY KEY (id_suscriptor),
    -- de 03:20: el numero de suscripcion no se repite
    CONSTRAINT uq_suscriptor_num  UNIQUE (numero),
    CONSTRAINT fk_suscriptor_tipo FOREIGN KEY (fk_tipo)
        REFERENCES tipo_suscriptor (id_tipo)
);
GO

CREATE TABLE lectura (
    id_lectura     INT IDENTITY(1,1) NOT NULL,
    fk_suscriptor  INT               NOT NULL,
    periodo        CHAR(7)           NOT NULL,   -- 'AAAA-MM'
    valor          INT               NOT NULL,
    fecha_toma     DATE              NOT NULL,
    observacion    VARCHAR(200)      NULL,

    CONSTRAINT pk_lectura        PRIMARY KEY (id_lectura),
    CONSTRAINT fk_lectura_susc   FOREIGN KEY (fk_suscriptor)
        REFERENCES suscriptor (id_suscriptor),
    -- de 18:40: una sola lectura por casa y por periodo
    CONSTRAINT uq_lectura_per    UNIQUE (fk_suscriptor, periodo),
    -- un medidor no marca negativo
    CONSTRAINT chk_lectura_valor CHECK (valor >= 0)
);
GO

-- --------------------------------------------------------------------------
--  Datos de prueba
-- --------------------------------------------------------------------------
INSERT INTO tipo_suscriptor (codigo, nombre, se_factura) VALUES
    ('RES', 'Residencial',  1),
    ('COM', 'Comercial',    1),
    ('OFI', 'Oficial',      0);   -- la escuela: se mide, NO se cobra
GO

INSERT INTO suscriptor (numero, nombre_titular, predio, telefono, fk_tipo, activo) VALUES
    ('AC-001', 'Rosa Elena Munoz',  'Lote 4, sector alto',   '3104455667', 1, 1),
    ('AC-002', 'Jairo Restrepo',    'Finca La Esperanza',    '3115566778', 1, 1),
    ('AC-003', 'Tienda La Cascada', 'Via principal km 2',    '3126677889', 2, 1),
    ('AC-004', 'Escuela Rural',     'Vereda centro',         NULL,         3, 1),
    ('AC-005', 'Omar Zapata',       'Lote 11, sector bajo',  '3137788990', 1, 0),
    ('AC-006', 'Tienda El Molino',  'Cruce de la quebrada',  '3148899001', 2, 1);
GO

INSERT INTO lectura (fk_suscriptor, periodo, valor, fecha_toma, observacion) VALUES
    (1, '2026-07',  1240, '2026-07-05', NULL),
    (1, '2026-08',  1298, '2026-08-05', NULL),
    (2, '2026-07',   870, '2026-07-05', NULL),
    (2, '2026-08',   902, '2026-08-05', NULL),
    (3, '2026-07',  3110, '2026-07-06', NULL),
    (3, '2026-08',  3405, '2026-08-06', 'Se reviso, no hay fuga'),
    (4, '2026-08',   560, '2026-08-06', NULL),
    (6, '2026-08',    45, '2026-08-06', 'Medidor nuevo, empieza en cero');
GO
