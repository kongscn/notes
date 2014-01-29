
data = read.csv("../datasets/raw/charity.csv")

lmobj = lm(gift~mailsyear+giftlast+propresp, data=data)

summary(lmobj)

summary(lm(gift~mailsyear, data=data))

summary(lm(gift~mailsyear+giftlast+propresp+avggift, data=data))