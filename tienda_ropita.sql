-- H2 2.1.214;
;             
CREATE USER IF NOT EXISTS "SA" SALT '30188cec954988a2' HASH '4a72675e08df2cc73f713280479f69abcfe79b8b993cea3fdb85768db88ef257' ADMIN;         
CREATE CACHED TABLE "PUBLIC"."ITEMS_VENTA"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 10) NOT NULL,
    "CANTIDAD" INTEGER NOT NULL,
    "PRENDA_ID" BIGINT NOT NULL,
    "VENTA_ID" BIGINT NOT NULL
); 
ALTER TABLE "PUBLIC"."ITEMS_VENTA" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_A" PRIMARY KEY("ID");  
-- 9 +/- SELECT COUNT(*) FROM PUBLIC.ITEMS_VENTA;             
INSERT INTO "PUBLIC"."ITEMS_VENTA" VALUES
(1, 2, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 2),
(4, 2, 1, 1),
(5, 1, 2, 1),
(6, 1, 3, 2),
(7, 2, 1, 1),
(8, 1, 2, 1),
(9, 1, 3, 2);              
CREATE CACHED TABLE "PUBLIC"."PRENDAS"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 7) NOT NULL,
    "DESCRIPCION" CHARACTER VARYING(255) NOT NULL,
    "ESTADO" CHARACTER VARYING(255) NOT NULL,
    "PRECIO_BASE" NUMERIC(10, 2) NOT NULL,
    "TIPO" CHARACTER VARYING(255) NOT NULL
);               
ALTER TABLE "PUBLIC"."PRENDAS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_17D" PRIMARY KEY("ID");    
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.PRENDAS; 
INSERT INTO "PUBLIC"."PRENDAS" VALUES
(1, 'Saco Negro', 'NUEVA', 15000.00, 'SACO'),
(2, 'Camisa Blanca', 'PROMOCION', 5000.00, 'CAMISA'),
(3, U&'Pantal\00f3n Azul', 'LIQUIDACION', 8000.00, 'PANTALON'),
(4, 'Camiseta Roja', 'NUEVA', 500.00, 'CAMISA'),
(5, U&'Pantal\00f3n Azul', 'PROMOCION', 700.00, 'PANTALON'),
(6, 'Zapatos Negros', 'LIQUIDACION', 1200.00, 'SACO');          
CREATE CACHED TABLE "PUBLIC"."TIENDAS"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 3) NOT NULL,
    "NOMBRE" CHARACTER VARYING(255) NOT NULL
);            
ALTER TABLE "PUBLIC"."TIENDAS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_D" PRIMARY KEY("ID");      
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.TIENDAS; 
INSERT INTO "PUBLIC"."TIENDAS" VALUES
(1, 'Tienda A'),
(2, 'Tienda B');     
CREATE CACHED TABLE "PUBLIC"."VENTAS"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 5) NOT NULL,
    "CUOTAS" INTEGER,
    "FECHA" DATE NOT NULL,
    "TIPO" CHARACTER VARYING(255) NOT NULL,
    "TIENDA_ID" BIGINT
);   
ALTER TABLE "PUBLIC"."VENTAS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_9" PRIMARY KEY("ID");       
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.VENTAS;  
INSERT INTO "PUBLIC"."VENTAS" VALUES
(1, NULL, DATE '2024-11-17', 'EFECTIVO', NULL),
(2, 3, DATE '2024-11-17', 'TARJETA', NULL),
(3, 3, DATE '2024-11-17', 'EFECTIVO', 1),
(4, 6, DATE '2024-11-16', 'TARJETA', 2);       
ALTER TABLE "PUBLIC"."PRENDAS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_17" CHECK("TIPO" IN('SACO', 'PANTALON', 'CAMISA')) NOCHECK;
ALTER TABLE "PUBLIC"."PRENDAS" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" CHECK("ESTADO" IN('NUEVA', 'PROMOCION', 'LIQUIDACION')) NOCHECK;        
ALTER TABLE "PUBLIC"."VENTAS" ADD CONSTRAINT "PUBLIC"."FKD7CSX28HAF7ISDAWVN31SBVU7" FOREIGN KEY("TIENDA_ID") REFERENCES "PUBLIC"."TIENDAS"("ID") NOCHECK;     
ALTER TABLE "PUBLIC"."ITEMS_VENTA" ADD CONSTRAINT "PUBLIC"."FKO6APVYMDXJO41VLTYUA17BQPE" FOREIGN KEY("PRENDA_ID") REFERENCES "PUBLIC"."PRENDAS"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."ITEMS_VENTA" ADD CONSTRAINT "PUBLIC"."FKMMEWMSH1QGJOAJJ77P9GI7LX7" FOREIGN KEY("VENTA_ID") REFERENCES "PUBLIC"."VENTAS"("ID") NOCHECK;  
