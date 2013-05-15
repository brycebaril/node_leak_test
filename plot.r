versions <- c("0_8_23", "0_10_5", "0_10_6", "0_11_1", "0_11_2")

append_file <- function(version) {
  log_only <- cbind(c(1:3000), read.csv(sprintf("log_only_%s.csv", version))[c("rss", "heapUsed", "heapTotal")])
  colnames(log_only) <-
    c("request", sprintf("log_only_%s.rss", version), sprintf("log_only_%s.heapUsed", version), sprintf("log_only_%s.heapTotal", version))
  http <- cbind(c(1:3000), read.csv(sprintf("http_%s.csv", version))[c("rss", "heapUsed", "heapTotal")])
  colnames(http) <-
    c("request", sprintf("http_%s.rss", version), sprintf("http_%s.heapUsed", version), sprintf("http_%s.heapTotal", version))
  https <- cbind(c(1:3000), read.csv(sprintf("https_%s.csv", version))[c("rss", "heapUsed", "heapTotal")])
  colnames(https) <-
    c("request", sprintf("https_%s.rss", version), sprintf("https_%s.heapUsed", version), sprintf("https_%s.heapTotal", version))

  merged = Reduce(function (...) merge(..., by="request", all=T), list(log_only, http, https))
  return(merged)
}

merged = Reduce(function (...) merge(..., by="request", all=T), Map(append_file, versions))


# HTTPS
plot_colors <- c("blue", "red", "forestgreen", "cyan", "darkorange")
png(file="https_rss.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$https_0_8_23.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_10_5.rss, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_10_6.rss, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$https_0_11_1.rss, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$https_0_11_2.rss, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTPS Client", font.main=4)
legend("topleft", c("0_8_23 rss", "0_10_5 rss", "0_10_6 rss", "0_11_1 rss", "0_11_2 rss"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="https_heapUsed.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$http_0_8_23.heapUsed, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_10_5.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_10_6.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$https_0_11_1.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$https_0_11_2.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTPS Client", font.main=4)
legend("topleft", c("0_8_23 heapUsed", "0_10_5 heapUsed", "0_10_6 heapUsed", "0_11_1 heapUsed", "0_11_2 heapUsed"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="https_heapTotal.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$http_0_8_23.heapTotal, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_10_5.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_10_6.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$https_0_11_1.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$https_0_11_2.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTPS Client", font.main=4)
legend("topleft", c("0_8_23 heapTotal", "0_10_5 heapTotal", "0_10_6 heapTotal", "0_11_1 heapTotal", "0_11_2 heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

# HTTP
png(file="http_rss.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$http_0_8_23.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$http_0_10_5.rss, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$http_0_10_6.rss, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$http_0_11_1.rss, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$http_0_11_2.rss, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 rss", "0_10_5 rss", "0_10_6 rss", "0_11_1 rss", "0_11_2 rss"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="http_heapUsed.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$http_0_8_23.heapUsed, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$http_0_10_5.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$http_0_10_6.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$http_0_11_1.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$http_0_11_2.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 heapUsed", "0_10_5 heapUsed", "0_10_6 heapUsed", "0_11_1 heapUsed", "0_11_2 heapUsed"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="http_heapTotal.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$http_0_8_23.heapTotal, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$http_0_10_5.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$http_0_10_6.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$http_0_11_1.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$http_0_11_2.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 heapTotal", "0_10_5 heapTotal", "0_10_6 heapTotal", "0_11_1 heapTotal", "0_11_2 heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

# LOG ONLY
png(file="log_only_rss.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$log_only_0_8_23.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$log_only_0_10_5.rss, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$log_only_0_10_6.rss, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$log_only_0_11_1.rss, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$log_only_0_11_2.rss, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 rss", "0_10_5 rss", "0_10_6 rss", "0_11_1 rss", "0_11_2 rss"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="log_only_heapUsed.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$log_only_0_8_23.heapUsed, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$log_only_0_10_5.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$log_only_0_10_6.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$log_only_0_11_1.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$log_only_0_11_2.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 heapUsed", "0_10_5 heapUsed", "0_10_6 heapUsed", "0_11_1 heapUsed", "0_11_2 heapUsed"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

png(file="log_only_heapTotal.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$log_only_0_8_23.heapTotal, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$log_only_0_10_5.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$log_only_0_10_6.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
lines(merged$log_only_0_11_1.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[4])
lines(merged$log_only_0_11_2.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[5])
title(main="HTTP Client", font.main=4)
legend("topleft", c("0_8_23 heapTotal", "0_10_5 heapTotal", "0_10_6 heapTotal", "0_11_1 heapTotal", "0_11_2 heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()

# SERVER (HTTP + HTTPS)
# TODO (more data points, not in above merge)

# 0.8.23 HTTPS
png(file="0_8_23_https.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$https_0_8_23.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_8_23.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_8_23.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
title(main="0.8.23 HTTPS Client", font.main=4)
legend("topleft", c("rss", "heapUsed", "heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()
# 0.10.6 HTTPS
png(file="0_10_6_https.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$https_0_10_6.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_10_6.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_10_6.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
title(main="0.10.6 HTTPS Client", font.main=4)
legend("topleft", c("rss", "heapUsed", "heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()
# 0.11.2 HTTPs
png(file="0_11_2_https.png", height=300, width=600)
par(mar=c(4.2, 3.8, 3, 0.2), oma=c(0,0,0,0))
plot(merged$https_0_11_2.rss, type="l", col=plot_colors[1], ylim=range(merged), axes=F, ann=T, xlab="Time/Requests", ylab="Memory", cex.lab=0.8, lwd=2)
axis(1, lab=F)
axis(2, las=1, cex.axis=0.8)
box()
lines(merged$https_0_11_2.heapUsed, type="l", lty=1, lwd=2, col=plot_colors[2])
lines(merged$https_0_11_2.heapTotal, type="l", lty=1, lwd=2, col=plot_colors[3])
title(main="0.10.2 HTTPS Client", font.main=4)
legend("topleft", c("rss", "heapUsed", "heapTotal"), cex=0.8, col=plot_colors, lty=1, lwd=2, bty="n");
dev.off()
