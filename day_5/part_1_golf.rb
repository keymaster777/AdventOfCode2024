l=File.readlines("i.t");s=l.index("\n");r,u,s=l[0..s],l[s+1..-1],0;u.each{|p|next unless r.each{|m|a,b=m.strip.split("|").map{|e| p.index(e)};break if a && b && a > b};a=p.split(",");s+=a[a.size/2].to_i};p s
