#Compare new data with its previous version-----

#load data
  #original data
olddat<-read_tsv("./DATA-PROCESSED/county_migration_data_previous.txt")
  #new data
newdat<-read_tsv("./DATA-PROCESSED/county_migration_data_current.txt")

#Compare dimensions
dim(olddat);dim(newdat)

#Check what FIPS code are changed
fips.old <- unique(as.numeric(c(olddat$origin,olddat$destination)))
fips.new <- unique(as.numeric(c(newdat$origin,newdat$destination)))
only.old <- setdiff(fips.old,fips.new)
summary(only.old)
only.new <- setdiff(fips.new,fips.old)
summary(only.new)
  #no new FIPS codes were generated

#Check those entries in previous data that has FIPS codes no longer existing
vanish.dat <- olddat[as.numeric(olddat$origin) %in% only.old | as.numeric(olddat$destination) %in% only.old,]
summary(vanish.dat)
#All of them come only have non-zero entries in 1998
#except one case in 2003:
vanish.dat[vanish.dat$`2003`!=0,]
olddat[olddat$`origin`=="99999" & olddat$destination=="1717",]
rbind(olddat[olddat$`origin`=="99999" & olddat$destination=="17017",],
      newdat[newdat$`origin`=="99999" & newdat$destination=="17017",])


#deal with a discrepancy in yr 2003 data----
vanish.dat[vanish.dat$`2003`!=0,]
newdat[newdat$`2003`==459424,]
olddat[olddat$`origin`=="99999" & olddat$destination=="17017",]
#2003 only influence one entry: origin=99999, destination=17017, its 2003 entry
  #Let's go to the raw data to confirm the results
sum(olddat$`2003`[olddat$destination=="17017"])
sum(newdat$`2003`[newdat$destination==17017])
#see /2003to2004CountyMigrationInflow/co0304ILi.xls: 11486+597=12083
#so this is actually a bug on my end
testdat <- migration_19952003[org_state=="99" & org_county=="999" & year=="2003" & des_state="17" & des_county="17",]
testdat <- county_migration_data[origin==99999 & destination==17017 & year==2003,]
  #There are two entries from the same file one has des_county=17, another has des_county=017
  #This comes from a coding error in /2003to2004CountyMigrationInflow/co0304ILi.xls
  #the first data entry, should have destination county (cell B9) to be 000 rather than 17


#
bothfips <- intersect(fips.new,fips.old)
olddat.match <- olddat[olddat$origin %in% bothfips & olddat$destination %in% bothfips,]
newdat.match <- newdat[newdat$origin %in% bothfips & newdat$destination %in% bothfips,]
table(olddat.match==newdat.match)
#This is a bit too complicated; better to work directly on replicated data below:

#First, compare replicated data with existing data-----
#First make sure we replicate the results, before processing new ones
  #original data
dat0<-read_tsv("DATA-PROCESSED/county_migration_data_previous.txt")
  #replicated data
dat1<-read_tsv("DATA-PROCESSED/county_migration_data_replica.txt")
  #compare
dim(dat0);dim(dat1)
table(dat0==dat1)
for (i in colnames(dat0)) {
  cat(i,"\n")
  print(table(dat0[,i]==dat1[,i]))
}
  #all differences happen to 1990-1991
#Investigate them
diff.id <- which(dat0$`1990` !=dat1$`1990` | dat0$`1991` !=dat1$`1991`)
table(dat0[diff.id,"destination"])
table(dat0[diff.id,"destination"])
#all with destination as unidentified
View(dat0[diff.id,])

diff.id <- which(dat0$`1990` !=dat1$`1990`)
View(dat0[diff.id,])
View(dat1[diff.id,])
#The difference comes from that current we include mig flow to/from foreign places
#we should remove them in calculation so that they are also counted in 99999