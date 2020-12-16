SELECT
  property_type,
  COUNT(*),
  AVG(price_aprox_usd) as average_price,
  AVG(surface_total_in_m2) as m2,
  AVG(price_aprox_usd/surface_total_in_m2) as usd_per_m2,
  STDDEV(price_aprox_usd/surface_total_in_m2) as stdev
FROM
  `properati-data-public.properties_mx.properties_rent_201501`
  WHERE price_aprox_usd IS NOT NULL AND price_aprox_usd > 0 AND surface_total_in_m2 IS NOT NULL AND surface_total_in_m2 > 0
  GROUP BY property_type
  ORDER BY COUNT(*) DESC
  LIMIT 20;
