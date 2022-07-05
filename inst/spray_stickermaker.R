## NB: this seems to work nicely under windows but not on the mac (the
## text is too big) or on linux (the colour comes out wrong).

library("hexSticker")

plotseq <- function(angle){
  v <- seq(from=0,to=1,len=10)
  points(v*sin(angle),-v*cos(angle),pch=16,cex=3.5*sqrt(1-v))
}

png(file="spray_icon.png",width=1000,height=1000,bg="#7733FF")
par(mai=c(0,0,0,0))
plot(NA,xlim=c(-1,1),ylim=c(-1,1),axes=FALSE,xlab="",ylab="",asp=1)
for(angle in seq(from=-0.6,to=0.6,len=7)){plotseq(angle)}
# abline(v=0,lwd=4)  # here for centering
dev.off()

sticker("spray_icon.png", package="spray", p_size=24, s_x=1, s_y=1.8,
s_width=2, asp=0.85, white_around_sticker=TRUE, h_fill="#7733FF",
h_color="#000000", filename="spray.png")


