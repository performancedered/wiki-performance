select * from nokia_msc_cgr_group_day
where mss_int_id = '383667'
and fecha = to_date('01.08.2017', 'DD.MM.YYYY')
order by fecha desc;
