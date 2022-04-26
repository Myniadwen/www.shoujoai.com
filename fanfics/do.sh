shopt -s globstar

prename -v 's{index\.html\?series=(.+)&fanfic=(.+)&parte=([0-9]+)$}{$1/$2-ch$3.html}' index*
prename -v 's{index\.html\?series=(.+)&fanfic=(.+)&parte=(-1)$}{$1/$2-index.html}' index*
prename -v 's{index\.html\?series=(.+)$}{$1/index.html}' index*
prename -v 's{index\.html\?author=(.+)$}{authors/$1.html}' index*

sed -ri 's,"\?series=([^&"]+)&fanfic=([^&"]+)&parte=([0-9]+)","../\1/\2-ch\3.html",g' **/*.html
sed -ri 's,"\?series=([^&"]+)&fanfic=([^&"]+)&parte=-1","../\1/\2-index.html",g' **/*.html
sed -ri 's,"\?series=([^&"]+)","../\1/index.html",g' **/*.html
sed -ri 's,"\?author=([^&"]+)","../authors/\1.html",g' **/*.html

sed -ri 's,"/(resource/),"../../\1,g' **/*.html
sed -ri 's,"/(images/),"../../\1,g' **/*.html
sed -ri 's,"/(main\.css),"../../resource/\1,g' **/*.html
