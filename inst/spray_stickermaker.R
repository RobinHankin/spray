library("hexSticker")

plotseq <- function(angle){
  v <- seq(from=0,to=1,len=10)
  points(v*cos(angle),v*sin(angle),pch=16,cex=2*sqrt(1-v))
}

png(file="spray_icon.png",width=1000,height=1000,bg="#7733FF")
plot(NA,xlim=c(0,1),ylim=c(-1,1),axes=FALSE,xlab="",ylab="",asp=1)
for(angle in seq(from=-0.6,to=0.6,len=7)){plotseq(angle)}
dev.off()

sticker("spray_icon.png", package="spray", p_size=24, s_x=0.9, s_y=0.95,
s_width=2, asp=0.85, white_around_sticker=TRUE, h_fill="#7733FF",
h_color="#000000", filename="spray.png")


