SELECT
	srid,
	scale_x::numeric(16, 10),
	scale_y::numeric(16, 10),
	blocksize_x,
	blocksize_y,
	same_alignment,
	regular_blocking,
	num_bands,
	pixel_types,
	nodata_values::numeric(16,10)[],
	out_db,
	ST_Equals(extent, 'POLYGON((0 -50,0 0,90 0,90 -50,0 -50))'::geometry)
FROM raster_columns
WHERE r_table_name = 'loadedrast'
	AND r_raster_column = 'rast';
SELECT ST_AsEWKT(geom), val FROM (SELECT (ST_PixelAsPolygons(rast, 1)).* FROM loadedrast WHERE rid = 12) foo WHERE x = 1 AND y = 1;
SELECT ST_AsEWKT(geom), val FROM (SELECT (ST_PixelAsPolygons(rast, 2)).* FROM loadedrast WHERE rid = 12) foo WHERE x = 1 AND y = 1;
SELECT ST_AsEWKT(geom), val FROM (SELECT (ST_PixelAsPolygons(rast, 2)).* FROM loadedrast WHERE rid = 44) foo WHERE x = 1 AND y = 1;
SELECT ST_AsEWKT(geom), val FROM (SELECT (ST_PixelAsPolygons(rast, 3)).* FROM loadedrast WHERE rid = 84) foo WHERE x = 1 AND y = 1;
