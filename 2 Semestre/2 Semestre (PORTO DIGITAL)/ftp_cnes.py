from ftplib import FTP

def explorar_ftp():
    ftp = FTP('ftp.datasus.gov.br')
    ftp.login()
    print("Conectado ao FTP.")

    # Listar diretórios na raiz
    dirs = ftp.nlst()
    print("Diretórios e arquivos na raiz:")
    print(dirs)

    # Verificar pasta CNES em 'dissemin/publicos'
    ftp.cwd('dissemin/publicos')
    subdirs = ftp.nlst()
    print("Subdiretórios em dissemin/publicos:")
    print(subdirs)

    # Se existir CNES, listar os conteúdos
    if 'CNES' in subdirs:
        ftp.cwd('CNES')
        cnes_dirs = ftp.nlst()
        print("Conteúdo dentro de dissemin/publicos/CNES:")
        print(cnes_dirs)
    else:
        print("Pasta CNES não encontrada.")

    ftp.quit()

explorar_ftp()
