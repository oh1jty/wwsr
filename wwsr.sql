create table wwsr (
  dtKey int(11) NOT NULL auto_increment,
  hindoor int(3),
  houtdoor int(3),  
  tindoor float(5),
  toutdoor float(5),  
  windspeed float(5),
  windgust float(5),
  winddirect char(3),
  prain float(5),
  srain float(5),
  pressure float(8),
  time_date datetime,
  timestamp timestamp(14) NOT NULL,
  PRIMARY KEY (dtKey),
  KEY time_key (timestamp)
) TYPE=MyISAM;
                        