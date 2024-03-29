# text - character, text to be plotted
# side - numeric, 1=bottom 2=left 3=top 4=right
# off  - numeric, offset in inches from the edge of the plotting region
# srt  - string rotation in degrees
# ...  - additional arguments passed to text()
mtexti <- function(text, side, off = 0.25,
                   srt = if(side == 2) 90  else
                       if(side == 4) 270 else 0, ...) {
    # dimensions of plotting region in user units
    usr <- par('usr')
    # dimensions of plotting region in inches
    pin <- par('pin')
    # user units per inch
    upi <- c(usr[2]-usr[1],
             usr[4]-usr[3]) / pin
    # default x and y positions
    xpos <- (usr[1] + usr[2])/2
    ypos <- (usr[3] + usr[4])/2
    if(1 == side)
        ypos <- usr[3] - upi[2] * off
    if(2 == side)
        xpos <- usr[1] - upi[1] * off
    if(3 == side)
        ypos <- usr[4] + upi[2] * off
    if(4 == side)
        xpos <- usr[2] + upi[1] * off
    text(x=xpos, y=ypos, text, xpd=NA, srt=srt, ...)
}