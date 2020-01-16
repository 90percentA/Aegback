--[[由于要公开并不使用A3shape的b站教程，
    所以将Yutils的生成绘图进行补齐，
	以应对各种需要完整“绘图代码”的情况，
	比如描边效果就是完整的，不会少边、断腿
--]]
text="m 12 12 l 18 12 18 31 b 18 40 18 47 17 51 15 55 13 59 11 63 9 62 6 60 4 59 7 56 9 52 10 49 11 45 12 40 12 32 l 12 12 m 21 14 l 52 14 52 21 39 21 39 26 50 26 50 48 b 50 50 50 51 49 52 49 54 48 54 47 55 46 55 44 55 41 55 40 53 40 51 39 48 l 39 63 32 63 32 32 28 32 28 55 21 55 21 26 32 26 32 21 21 21 21 14 m 44 47 l 44 32 39 32 39 48 b 40 49 41 49 41 49 43 49 44 48 44 47 l 44 47 m 3 16 l 9 16 9 49 3 49 3 16"
tbl={}     text_tbl={}
for k in string.gmatch(text,"m( [ -.%dlb]+)") do
	tbl[#tbl+1]=k
end
if #tbl==1 then
	if string.match(tbl[1],"^ [-.%d]+ [-.%d]+")~= string.match(tbl[1]," [-.%d]+ [-.%d]+$") then
	text="m"..tbl[1].." l"..string.match(tbl[1],"^ [-.%d]+ [-.%d]+")..string.match(tbl[1],"^ [-.%d]+ [-.%d]+").." "
	else 
	text="m"..tbl[1].." "
	end 
 else 
for i=1,#tbl do
	if string.match(tbl[i],"^ [-.%d]+ [-.%d]+")~= string.match(tbl[i]," [-.%d]+ [-.%d]+$") then
		textstart=string.match(tbl[i],"^ [-.%d]+ [-.%d]+")
		tbl[i]="m"..tbl[i].." l"..textstart..textstart.." "
		else 
		tbl[i]="m"..tbl[i].." "
	end
	text=_G.table.concat(tbl)
end
end
if string.match(text,"b")~=nil then
	if string.match(text,"b [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+")~=nil then
		repeat
		textb=string.match(text,"[%dlmb -.]*b ([-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+) [-.%d]+ [-.%d]+")
		textstart=string.match(text,"([%dlmb -.]*b )[-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+")
		textend=string.match(text,"[%dlmb -.]*b [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+( [-.%d]+ [-.%d]+ [%dlmb -.]*)")
		textb=textb.." b"
		text=textstart..textb..textend
		until string.match(text,"b [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+ [-.%d]+")==nil
		else
		text=text
	end
end
if string.match(text,"[%dlmb -.]*l ([-.%d]+ [-.%d]+)[ ]? [-.%d]+ [-.%d]+")~=nil then
	repeat
	textl=string.match(text,"[%dlmb -.]*l ([-.%d]+ [-.%d]+)[ ]? [-.%d]+ [-.%d]+")
	textstart=string.match(text,"([%dlmb -.]*l )[-.%d]+ [-.%d]+[ ]? [-.%d]+ [-.%d]+")
	textend=string.match(text,"[%dlmb -.]*l [-.%d]+ [-.%d]+([ ]? [-.%d]+ [-.%d]+ [%dlmb -.]*)")
	textl=string.gsub(textl,"$"," l")
	text=textstart..textl..textend
	until string.match(text,"l [-.%d]+ [-.%d]+[ ]? [-.%d]+ [-.%d]+")==nil
end
text=string.gsub(text,"  "," ")
if string.match(text,"b [-.%d]+ [-.%d]+$")~=nil then
	textend=string.match(text," [-.%d]+ [ -.%d]+$")
	text=string.gsub(text,"b [-.%d]+ [ -.%d]+$","l")
	text=text..textend
end
































