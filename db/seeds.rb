User.destroy_all
u1 = User.create(:name => "Katrina", :password => 'chicken', :password_confirmation => 'chicken', :email => 'katrinamarielee@gmail.com', :age=> 27, :image => "http://www.checkmate.io/wordpress/wp-content/uploads/2015/05/Katrina_Marie_Lee.png", :weight => '64.6')
u2 = User.create(:name => "Gary", :password => 'chicken', :password_confirmation => 'chicken', :email => 'kml66@cornell.edu', :age=> 26, :image => "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAjWAAAAJDM2ODMzYzI1LWMzMDEtNGQ3Ni1hNWNkLTFiYWU3ZTdiMWVlOQ.jpg", :weight => '72.6')

Record.destroy_all
r1 = Record.create(:outcome => 1400, :target => 2000, :created_at => DateTime.strptime("2016-08-16 10:45", "%Y-%m-%d %H:%M"))
r2 = Record.create(:outcome => 1600, :target => 2000, :created_at => DateTime.strptime("2016-08-17 10:45", "%Y-%m-%d %H:%M"))
r3 = Record.create(:outcome => 1900, :target => 2000, :created_at => DateTime.strptime("2016-08-18 10:45", "%Y-%m-%d %H:%M"))
r4 = Record.create(:outcome => 1500, :target => 2000, :created_at => DateTime.strptime("2016-08-19 10:45", "%Y-%m-%d %H:%M"))
r5 = Record.create(:outcome => 1500, :target => 2000, :created_at => DateTime.strptime("2016-08-19 20:45", "%Y-%m-%d %H:%M"))
r6 = Record.create(:outcome => 1300, :target => 2000, :created_at => DateTime.strptime("2016-08-20 10:45", "%Y-%m-%d %H:%M"))
r7 = Record.create(:outcome => 1700, :target => 2000, :created_at => DateTime.strptime("2016-08-21 10:45", "%Y-%m-%d %H:%M"))
r8 = Record.create(:outcome => 2000, :target => 2000, :created_at => DateTime.strptime("2016-08-22 10:45", "%Y-%m-%d %H:%M"))
r9 = Record.create(:outcome => 1400, :target => 2000, :created_at => DateTime.strptime("2016-08-16 10:45", "%Y-%m-%d %H:%M"))
r10 = Record.create(:outcome => 1300, :target => 2000, :created_at => DateTime.strptime("2016-08-17 10:45", "%Y-%m-%d %H:%M"))
r11 = Record.create(:outcome => 1450, :target => 2000, :created_at => DateTime.strptime("2016-08-18 10:45", "%Y-%m-%d %H:%M"))
r12 = Record.create(:outcome => 1600, :target => 2000, :created_at => DateTime.strptime("2016-08-19 10:45", "%Y-%m-%d %H:%M"))
r13 = Record.create(:outcome => 1700, :target => 2000, :created_at => DateTime.strptime("2016-08-20 10:45", "%Y-%m-%d %H:%M"))
r14 = Record.create(:outcome => 1750, :target => 2000, :created_at => DateTime.strptime("2016-08-21 10:45", "%Y-%m-%d %H:%M"))
r15 = Record.create(:outcome => 1800, :target => 2000, :created_at => DateTime.strptime("2016-08-22 10:45", "%Y-%m-%d %H:%M"))

t1 = Total.create(:total_consumed => 1800, :date => DateTime.strptime("2016-09-07", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-07 10:45", "%Y-%m-%d %H:%M"))
t2 = Total.create(:total_consumed => 1700, :date => DateTime.strptime("2016-09-08", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-08 10:45", "%Y-%m-%d %H:%M"))
t3 = Total.create(:total_consumed => 1470, :date => DateTime.strptime("2016-09-09", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-09 10:45", "%Y-%m-%d %H:%M"))
t4 = Total.create(:total_consumed => 1900, :date => DateTime.strptime("2016-09-10", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-10 10:45", "%Y-%m-%d %H:%M"))
t5 = Total.create(:total_consumed => 2000, :date => DateTime.strptime("2016-09-11", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-11 10:45", "%Y-%m-%d %H:%M"))
t6 = Total.create(:total_consumed => 1930, :date => DateTime.strptime("2016-09-12", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-12 10:45", "%Y-%m-%d %H:%M"))
t7 = Total.create(:total_consumed => 1800, :date => DateTime.strptime("2016-09-13", "%Y-%m-%d"), :created_at => DateTime.strptime("2016-09-13 10:45", "%Y-%m-%d %H:%M"))

u1.totals << t1 << t2 << t3 << t4 << t5 << t6 << t7

u1.records << r1 << r2 << r3 << r4 << r5 << r6 << r7 << r8

u2.records << r9 << r10 << r11 << r12 << r13 << r14 << r15
