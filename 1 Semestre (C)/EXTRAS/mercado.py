class Produto:
    def __init__(self, codigo, nome, preco):
        self.codigo = codigo
        self.nome = nome
        self.preco = preco


class ItemCarrinho:
    def __init__(self, produto, quantidade=1):
        self.produto = produto
        self.quantidade = quantidade


def menu():
    print("\nMenu")
    print("1. Cadastrar Produto")
    print("2. Listar Produtos")
    print("3. Comprar Produto")
    print("4. Visualizar Carrinho")
    print("5. Fechar Pedido")
    print("6. Atualizar Produto")
    print("7. Sair do Sistema")


def cadastrar_produto(produtos):
    while True:
        print(f"\nCadastrar produto {len(produtos) + 1}")
        try:
            codigo = int(input("Digite o código do produto: "))
            nome = input("Digite o nome do produto: ")
            preco = float(input("Digite o preço do produto: "))
            produtos.append(Produto(codigo, nome, preco))
        except ValueError:
            print("Entrada inválida. Tente novamente.")
            continue

        continuar = input("Deseja cadastrar outro produto? (s/n): ").lower()
        if continuar == 'n':
            break


def listar_produtos(produtos):
    if not produtos:
        print("Nenhum produto cadastrado.")
        return

    print("\nProdutos disponíveis:")
    for p in produtos:
        print(f"{p.codigo} | {p.nome} | R$ {p.preco:.2f}")


def pegar_produto_por_codigo(produtos, codigo):
    for i, p in enumerate(produtos):
        if p.codigo == codigo:
            return i
    return -1


def tem_no_carrinho(carrinho, codigo):
    for i, item in enumerate(carrinho):
        if item.produto.codigo == codigo:
            return i
    return -1


def comprar_produto(produtos, carrinho):
    try:
        codigo = int(input("\nDigite o código do produto para comprar: "))
    except ValueError:
        print("Código inválido.")
        return

    pos = pegar_produto_por_codigo(produtos, codigo)
    if pos == -1:
        print("Produto não encontrado.")
        return

    pos_carrinho = tem_no_carrinho(carrinho, codigo)
    if pos_carrinho != -1:
        carrinho[pos_carrinho].quantidade += 1
    else:
        print("\nProduto adicionado ao carrinho.")
        carrinho.append(ItemCarrinho(produtos[pos]))


def visualizar_carrinho(carrinho):
    if not carrinho:
        print("\nCarrinho vazio.")
        return

    print("\nItens no carrinho:")
    for item in carrinho:
        print(f"\nCódigo: {item.produto.codigo} | Nome: {item.produto.nome} | "
              f"Preço: R$ {item.produto.preco:.2f} | Quantidade: {item.quantidade}")


def fechar_pedido(carrinho):
    if not carrinho:
        print("\nCarrinho vazio.")
        return

    total = 0.0
    print("\nValor do Pedido:")
    for item in carrinho:
        subtotal = item.produto.preco * item.quantidade
        print(f"Produto: {item.produto.nome} | Preço: R$ {item.produto.preco:.2f} "
              f"| Quantidade: {item.quantidade} | Total: R$ {subtotal:.2f}")
        total += subtotal

    print(f"\nTotal da compra: R$ {total:.2f}")
    print("Pedido fechado com sucesso! Carrinho esvaziado.")
    carrinho.clear()


def atualizar_produto(produtos, carrinho):
    try:
        codigo = int(input("\nDigite o código do produto que deseja atualizar: "))
    except ValueError:
        print("Código inválido.")
        return

    pos = pegar_produto_por_codigo(produtos, codigo)
    if pos == -1:
        print("Produto não encontrado.")
        return

    print(f"\nProduto encontrado: {produtos[pos].nome} | R$ {produtos[pos].preco:.2f}")
    novo_nome = input("Digite o novo nome do produto: ")
    try:
        novo_preco = float(input("Digite o novo preço do produto: "))
    except ValueError:
        print("Preço inválido.")
        return

    produtos[pos].nome = novo_nome
    produtos[pos].preco = novo_preco
    print("Produto atualizado com sucesso!")

    for item in carrinho:
        if item.produto.codigo == codigo:
            item.produto = produtos[pos]


def main():
    produtos = []
    carrinho = []

    while True:
        menu()
        try:
            opcao = int(input("Escolha uma opção: "))
        except ValueError:
            print("Entrada inválida. Tente novamente.")
            continue

        if opcao == 1:
            cadastrar_produto(produtos)
        elif opcao == 2:
            listar_produtos(produtos)
        elif opcao == 3:
            comprar_produto(produtos, carrinho)
        elif opcao == 4:
            visualizar_carrinho(carrinho)
        elif opcao == 5:
            fechar_pedido(carrinho)
        elif opcao == 6:
            atualizar_produto(produtos, carrinho)
        elif opcao == 7:
            print("O sistema está sendo encerrado!")
            break
        else:
            print("Opção inválida! Por favor, tente novamente.")


if __name__ == "__main__":
    main()
