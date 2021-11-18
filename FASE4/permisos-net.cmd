@echo off
REM Comprobamos si existen las carpetas, en caso contrario las creamos
if NOT EXIST X:\Directorios_Personales mkdir X:\Directorios_Personales
if NOT EXIST X:\Directorios_Departamentos mkdir X:\Directorios_Departamentos
if NOT EXIST X:\Directorios_Departamentos\Informatica mkdir X:\Directorios_Departamentos\Informatica
if NOT EXIST X:\Directorios_Departamentos\Energia mkdir X:\Directorios_Departamentos\Energia
if NOT EXIST X:\Directorios_Departamentos\Industria mkdir X:\Directorios_Departamentos\Industria
if NOT EXIST X:\Directorios_Departamentos\Prensa mkdir X:\Directorios_Departamentos\Prensa
REM Compartimos en red con 'Todos' las carpetas, con los permisos NTFS filtraremos los accesos
net share Documentos_Departamentos=X:\Directorios_Departamentos /GRANT:ALCO_GL_RInformatica,read /GRANT:ALCO_GL_REnergia,read /GRANT:ALCO_GL_RIndustria,read /GRANT:ALCO_GL_RPrensa,read
net share Documentos_Informatica=X:\Directorios_Departamentos\Informatica /GRANT:ALCO_GL_RWInformatica,full /GRANT:ALCO_GL_REnergia,read /GRANT:ALCO_GL_RIndustria,read /GRANT:ALCO_GL_RPrensa,read
net share Documentos_Energia=X:\Directorios_Departamentos\Energia /GRANT:ALCO_GL_RWEnergia,full /GRANT:ALCO_GL_RInformatica,read /GRANT:ALCO_GL_RIndustria,read /GRANT:ALCO_GL_RPrensa,read
net share Documentos_Industria=X:\Directorios_Departamentos\Industria /GRANT:ALCO_GL_RWIndustria,full /GRANT:ALCO_GL_REnergia,read /GRANT:ALCO_GL_RInformatica,read /GRANT:ALCO_GL_RPrensa,read
net share Documentos_Prensas=X:\Directorios_Departamentos\Prensa /GRANT:ALCO_GL_RWPrensa,full /GRANT:ALCO_GL_REnergia,read /GRANT:ALCO_GL_RIndustria,read /GRANT:ALCO_GL_RInformatica,read
REM Eliminamos los permisos asignados al grupo 'Usuarios del dominio'
REM /inheritancelevel: [e - d - r]
REM     e: Enables inheritance - d: Disables inheritance and copies the ACESS - r: Removes all inherited ACESS
icacls X:\Directorios_Departamentos /inheritance:d /T
icacls X:\Directorios_Departamentos /remove:g Usuarios
icacls X:\Directorios_Departamentos\Informatica /inheritance:d /T
icacls X:\Directorios_Departamentos\Informatica /remove:g Usuarios
icacls X:\Directorios_Departamentos\Energia /inheritance:d /T
icacls X:\Directorios_Departamentos\Energia /remove:g Usuarios
icacls X:\Directorios_Departamentos\Industria /inheritance:d /T
icacls X:\Directorios_Departamentos\Industria /remove:g Usuarios
icacls X:\Directorios_Departamentos\Prensa /inheritance:d /T
icacls X:\Directorios_Departamentos\Prensa /remove:g Usuarios
REM Aplicamos las ACLs
REM https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/icacls
icacls X:\Directorios_Departamentos /GRANT alcoy\ALCO_GL_RInformatica:(R,RC) /GRANT alcoy\ALCO_GL_REnergia:(R,RC) /GRANT alcoy\ALCO_GL_RIndustria:(R,RC) /GRANT alcoy\ALCO_GL_RPrensa:(R,RC)
icacls X:\Directorios_Departamentos\Informatica /GRANT alcoy\ALCO_GL_RWInformatica:(R,W) /GRANT alcoy\ALCO_GL_REnergia:(R,RC) /GRANT alcoy\ALCO_GL_RIndustria:(R,RC) /GRANT alcoy\ALCO_GL_RPrensa:(R,RC)
icacls X:\Directorios_Departamentos\Energia /GRANT alcoy\ALCO_GL_RWEnergia:(R,W) /GRANT alcoy\ALCO_GL_RInformatica:(R,RC) /GRANT alcoy\ALCO_GL_RIndustria:(R,RC) /GRANT alcoy\ALCO_GL_RPrensa:(R,RC)
icacls X:\Directorios_Departamentos\Industria /GRANT alcoy\ALCO_GL_RWIndustria:(R,W) /GRANT alcoy\ALCO_GL_RInformatica:(R,RC) /GRANT alcoy\ALCO_GL_REnergia:(R,RC) /GRANT alcoy\ALCO_GL_RPrensa:(R,RC)
icacls X:\Directorios_Departamentos\Prensa /GRANT alcoy\ALCO_GL_RWPrensa:(R,W) /GRANT alcoy\ALCO_GL_RInformatica:(R,RC) /GRANT alcoy\ALCO_GL_RIndustria:(R,RC) /GRANT alcoy\ALCO_GL_REnergia:(R,RC)
