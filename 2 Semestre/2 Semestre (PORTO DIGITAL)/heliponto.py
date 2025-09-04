from ftplib import FTP

def listar_cnes():
    ftp = FTP('ftp.datasus.gov.br')
    ftp.login()
    print("Conectado ao FTP.")

    caminho_cnes = 'dissemin/publicos/CNES'
    ftp.cwd(caminho_cnes)
    lista = ftp.nlst()
    print(f"Conteúdo dentro de {caminho_cnes}: {lista}")

    pastas = []
    arquivos = []

    for item in lista:
        try:
            # Testa se consegue entrar na pasta
            ftp.cwd(f"{caminho_cnes}/{item}")
            pastas.append(item)
            # Volta para o caminho principal
            ftp.cwd(caminho_cnes)
        except:
            arquivos.append(item)

    print(f"\nPastas em {caminho_cnes}: {pastas}")
    print(f"Arquivos em {caminho_cnes}: {arquivos}")

    ftp.quit()

if __name__ == "__main__":
    listar_cnes()
