l=File.readlines("i.t").map(&:chop);s=l.index("");r,u,s,z=l[0..s],l[s+1..-1].map{|e|e.split(",")},0,0;u.each{|p|c=0;(d=c;r.map{|l|a,b=l.split("|").map{|e|p.index(e)};p[a],p[b],c=p[b],p[a],c+1 if a&&b&&a>b};break if d==c)while 1;h=p[p.size/2].to_i;c==0?z+=h:s+=h};p z;p s