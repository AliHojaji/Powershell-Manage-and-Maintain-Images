#--- Author : Ali Hojaji ---#

#--*---------------------------*--#
#---> DISM Powershell Cmdlets <---#
#--*---------------------------*--#

#--> Desktop Experience & Server Core <--#

#--> display help
dism /?

#--> view images within a .win
dism /get-imageinfo /imagefile:.\images\install.win

#--> mount server core datacenter image
dism /mount-image /imagefile:.\image\install.wim /index:3 /mountdir:.\mount

#-->add drivers (.inf)
dism /image:.\mount /get-drivers
dism /image:.\mount /add-driver /driver:.\drivers
dism /image:.\mount /remove-driver /driver:.\drivers\iaStorAC.inf

#--> add patches, hotfixes, and updates (.msu or .cab)
dism /image:.\mount /get-packages
dism /image:.\mount /add-package /packagepath:.\updates
dism /image:.\mount /remove-package /packagepath:.\updates\windows10.0-kb3150513.msu

#--> install roles and features
dism /image:.\mount /get-features
dism /image:.\mount /get-featureinfo /featurename:web-server
dism /image:.\mount /enable-feature /featurename:web-server /all
dism /image:.\mount /disable-feature /featurename:web-server

#--> dismount and commit all changes
dism /unmount-image /mountdir:.\mount /commit


#--> Nano server <--#

#--> view nano server images
dism /get-imageinfo /imagefile:.\images\nanoserver.wim

#--> mount nano server datacenter image
dism /mount-image /imagefile:.\images\nanoserver.wim /index:2 /mountdir:.\mount

#--> add nano server package
dism /image:.\mount /add-package /packagepath:d:\nanoserver\packages\microsoft-nanoserver-containers-package.cab

#--> dismount and commit all changes
dism /unmount-image /mountdir:.\mount /discard