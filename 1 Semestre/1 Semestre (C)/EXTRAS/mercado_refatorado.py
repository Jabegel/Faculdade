# Refatoração do projeto mercado.py

class Produto:
    def __init__(self, codigo, nome, preco):
        self.codigo = codigo
        self.nome = nome
        self.preco = preco

    def __str__(self):
        return f"{self.codigo} | {self.nome} | R$ {self.preco:.2f}"


class ItemCarrinho:
    def __init__(self, produto, quantidade=1):
        self.produto = produto
        self.quantidade = quantidade

    def subtotal(self):
        return self.produto.preco * self.quantidade

    def __str__(self):
        return (f"Código: {self.produto.codigo} | Nome: {self.produto.nome} | "
                f"Preço: R$ {self.produto.preco:.2f} | Quantidade: {self.quantidade}")


def exibir_menu():
    opcoes = [
        "1. Cadastrar Produto",
        "2. Listar Produtos",
        "3. Comprar Produto",
        "4. Visualizar Carrinho",
        "5. Fechar Pedido",
        "6. Atualizar Produto",
        "7. Sair do Sistema"
    ]
    print("\nMenu")
    print("\n".join(opcoes))


def entrada_inteiro(mensagem):
    try:
        return int(input(mensagem))
    except ValueError:
        print("Entrada inválida. Tente novamente.")
        return None


def entrada_float(mensagem):
    try:
        return float(input(mensagem))
    except ValueError:
        print("Entrada inválida. Tente novamente.")
        return None


def cadastrar_produto(produtos):
    while True:
        print(f"\nCadastrar produto {len(produtos) + 1}")
        codigo = entrada_inteiro("Digite o código do produto: ")
        if codigo is None:
            continue

        nome = input("Digite o nome do produto: ")
        preco = entrada_float("Digite o preço do produto: ")
        if preco is None:
            continue

        produtos.append(Produto(codigo, nome, preco))
        continuar = input("Deseja cadastrar outro produto? (s/n): ").lower()
        if continuar == 'n':
            break


def listar_produtos(produtos):
    if not produtos:
        print("Nenhum produto cadastrado.")
        return
    print("\nProdutos disponíveis:")
    for p in produtos:
        print(p)


def encontrar_produto(produtos, codigo):
    return next((p for p in produtos if p.codigo == codigo), None)


def encontrar_item_carrinho(carrinho, codigo):
    return next((item for item in carrinho if item.produto.codigo == codigo), None)


def comprar_produto(produtos, carrinho):
    codigo = entrada_inteiro("\nDigite o código do produto para comprar: ")
    if codigo is None:
        return

    produto = encontrar_produto(produtos, codigo)
    if not produto:
        print("Produto não encontrado.")
        return

    item = encontrar_item_carrinho(carrinho, codigo)
    if item:
        item.quantidade += 1
    else:
        print("\nProduto adicionado ao carrinho.")
        carrinho.append(ItemCarrinho(produto))


def visualizar_carrinho(carrinho):
    if not carrinho:
        print("\nCarrinho vazio.")
        return
    print("\nItens no carrinho:")
    for item in carrinho:
        print(item)


def fechar_pedido(carrinho):
    if not carrinho:
        print("\nCarrinho vazio.")
        return

    total = 0.0
    print("\nValor do Pedido:")
    for item in carrinho:
        print(f"Produto: {item.produto.nome} | Preço: R$ {item.produto.preco:.2f} "
              f"| Quantidade: {item.quantidade} | Total: R$ {item.subtotal():.2f}")
        total += item.subtotal()

    print(f"\nTotal da compra: R$ {total:.2f}")
    print("Pedido fechado com sucesso! Carrinho esvaziado.")
    carrinho.clear()


def atualizar_produto(produtos, carrinho):
    codigo = entrada_inteiro("\nDigite o código do produto que deseja atualizar: ")
    if codigo is None:
        return

    produto = encontrar_produto(produtos, codigo)
    if not produto:
        print("Produto não encontrado.")
        return

    print(f"\nProduto encontrado: {produto.nome} | R$ {produto.preco:.2f}")
    novo_nome = input("Digite o novo nome do produto: ")
    novo_preco = entrada_float("Digite o novo preço do produto: ")
    if novo_preco is None:
        return

    produto.nome = novo_nome
    produto.preco = novo_preco
    print("Produto atualizado com sucesso!")


def main():
    produtos = []
    carrinho = []

    while True:
        exibir_menu()
        opcao = entrada_inteiro("Escolha uma opção: ")
        if opcao is None:
            continue

        match opcao:
            case 1:
                cadastrar_produto(produtos)
            case 2:
                listar_produtos(produtos)
            case 3:
                comprar_produto(produtos, carrinho)
            case 4:
                visualizar_carrinho(carrinho)
            case 5:
                fechar_pedido(carrinho)
            case 6:
                atualizar_produto(produtos, carrinho)
            case 7:
                print("O sistema está sendo encerrado!")
                break
            case _:
                print("Opção inválida! Por favor, tente novamente.")


if __name__ == "__main__":
    main()
