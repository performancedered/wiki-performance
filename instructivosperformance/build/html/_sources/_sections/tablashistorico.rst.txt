Migrar Historico de Smart a Data Warehouse
==========================================

1. OBJETIVO 
-----------
El presente instructivo busca detallar la migracion de tablas historicas de UMTS de Smart a Data Warehouse, con la finalidad de liberar espacio en el servidor Perdido.

2.DEFINICIONES
--------------

**Data WareHouse:** Almacén de datos orientada a un determinado ámbito, en este caso para almacenar el historico de tablas UMTS


2.INSTRUCCIONES
---------------

Las 20 tablas históricas creadas son las siguientes: 

.. _UMTS_C_NSN_CELLRES_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTS_C_NSN_CELLRES_WCEL_BHC_short.sql
.. _UMTS_C_NSN_CELLRES_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTS_C_NSN_CELLRES_WCEL_BHP_short.sql
.. _UMTS_C_NSN_HSDPAW_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTS_C_NSN_HSDPAW_WCEL_BHC_short.sql
.. _UMTS_C_NSN_HSDPAW_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTS_C_NSN_HSDPAW_WCEL_BHC_short.sql
.. _UMTS_C_NSN_HSDPAW_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTS_C_NSN_HSDPAW_WCEL_DAY_short.sql
.. _UMTS_C_NSN_SERVLEV_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTS_C_NSN_SERVLEV_WCEL_BHC_short.sql
..	_UMTS_C_NSN_SERVLEV_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTS_C_NSN_SERVLEV_WCEL_BHP_short.sql
.. _UMTS_C_NSN_SERVLEV_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTS_C_NSN_SERVLEV_WCEL_DAY_short.sql
..	_UMTS_C_NSN_TRAFFIC_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTS_C_NSN_TRAFFIC_WCEL_BHC_short.sql
..	_UMTS_C_NSN_TRAFFIC_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTS_C_NSN_TRAFFIC_WCEL_BHC_short.sql
..	_UMTS_C_NSN_TRAFFIC_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTS_C_NSN_TRAFFIC_WCEL_DAY_short.sql
..	_UMTS_D_NSN_SERVICE_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTS_D_NSN_SERVICE_WCEL_BHC_short.sql
..	_UMTS_D_NSN_SERVICE_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTS_D_NSN_SERVICE_WCEL_BHP_short.sql
..	_UMTS_D_NSN_SERVICE_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTS_D_NSN_SERVICE_WCEL_DAY_short.sql
..	_UMTSC_NSN_HO_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTSC_NSN_HO_WCEL_DAY_short.sql
..	_UMTSC_NSN_HSDPA_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTSC_NSN_HSDPA_WCEL_DAY_short.sql
..	_UMTSC_NSN_SERVICE_WCEL_BHC: ../_static/images/querieshistoricoumts/UMTSC_NSN_SERVICE_WCEL_BHC_short.sql
..	_UMTSC_NSN_SERVICE_WCEL_BHP: ../_static/images/querieshistoricoumts/UMTSC_NSN_SERVICE_WCEL_BHP_short.sql
..	_UMTSC_NSN_SERVICE_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTSC_NSN_SERVICE_WCEL_DAY_short.sql
..	_UMTSC_NSN_TRAFFIC_WCEL_DAY: ../_static/images/querieshistoricoumts/UMTSC_NSN_TRAFFIC_WCEL_DAY_short.sql



+	UMTS_C_NSN_CELLRES_WCEL_BHC_.
+	UMTS_C_NSN_CELLRES_WCEL_BHP_.
+	UMTS_C_NSN_HSDPAW_WCEL_BHC_.
+	UMTS_C_NSN_HSDPAW_WCEL_BHP_.
+	UMTS_C_NSN_HSDPAW_WCEL_DAY_.
+	UMTS_C_NSN_SERVLEV_WCEL_BHC_.
+	UMTS_C_NSN_SERVLEV_WCEL_BHP_.
+	UMTS_C_NSN_SERVLEV_WCEL_DAY_.
+	UMTS_C_NSN_TRAFFIC_WCEL_BHC_.
+	UMTS_C_NSN_TRAFFIC_WCEL_BHP_.
+	UMTS_C_NSN_TRAFFIC_WCEL_DAY_.
+	UMTS_D_NSN_SERVICE_WCEL_BHC_.
+	UMTS_D_NSN_SERVICE_WCEL_BHP_.
+	UMTS_D_NSN_SERVICE_WCEL_DAY_.
+	UMTSC_NSN_HO_WCEL_DAY_.
+	UMTSC_NSN_HSDPA_WCEL_DAY_.
+	UMTSC_NSN_SERVICE_WCEL_BHC_.
+	UMTSC_NSN_SERVICE_WCEL_BHP_.
+	UMTSC_NSN_SERVICE_WCEL_DAY_.
+	UMTSC_NSN_TRAFFIC_WCEL_DAY_.


