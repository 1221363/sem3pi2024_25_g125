**From the client clarifications:**

> **Question:** "USBD01 - As a Product Owner, I want a data dictionary/glossary to be created."
The content of the glossary for this US is only for the BDDAD part of the project or is it supposed
to be for the whole project?
>
> **Answer:** The requirements are not divided by technical speciality. As such, there are no BDDAD
requirements. There are only project requirements.

> **Question:** "Announcements Esclarecimentos sobre PI" foi a seguinte:
"Para já, podemos dizer que o produto é uma variante da família de produtos."
Uma vez que no enunciado do projeto fala em produtos terem variantes que diferem
em tamanho e cores, fiquei confuso com a frase anterior. É suposto considerar parametros
como tamanho e cores em Produto sendo esses variante da Familia de Produtos? Ou haver Familia de Produtos, Produto e ainda Variante do Produto?

> **Answer:** Considerar que apenas o tamanho e cor poderão ser as únicas variantes
de um produto é duma pobreza extrema. Trata-se de um exemplo muito simples. Na prática, pode variar imensa coisa entre produtos.
Para tornar a coisa minimamente gerível, considera-se que um produto é uma variante de uma família de produtos, porque tem algo que
o diferencia do resto da família (tamanho, material, cor, etc.).

> **Question:** In the Dataset in the table BOM there are two collumns called part number and description. Is the description refering to the part number?
>
> **Answer:** Yes.

> **Question:** A dúvida anteriormente colocada por outro colega é a mesma que a minha.
No csv que foi fornecido, na coluna BOM, um dos parâmetros é PartNumber, isso seria referente
a uma entidade Parte Produto que representa os Componentes e Materiais que
compõe o Produto (uma vez que parece me que neste sprint ainda não ha distinção entre eles)
>
> **Answer:** Dizer que um produto só tinha um componente seria uma simplificação inaceitável.
O documento de requisitos refere que um produto pode ser composto de materiais e componentes.
Mas naturalmente que também pode incluir produtos (entendendo-se estes últimos como subassemblies vendidas pela empresa).
Em BDDAD, podemos dizer que um produto pode ser constituído por muitas "parts" (um componente é uma "part", uma matéia prima é uma "part", etc.).
Para perceberem melhor a forma de lidar com isto, recomendo a análise do problema do aeroporto, em que um controlador e um mecânico/técnico são colaboradores.

> **Question:** Hello, in the BOM sheet provided in the legacy system file the parts don't have a name, only a description.
Assuming that the parts are also products, how are we able to turn them into products in the new data base system without knowing their name?
>
> **Answer:** Not all parts are products. If a part is also a product, I would design the model so that the ProductID
of that product is the same as the PartNumber (one to one relationship between Product and Part).

> **Question:** Considere o seguinte excerto do ficheiro excel:
9847	A4588	Press 03	220-630t precision cold forging press	 
9855	A4588	Press 04	160-1000t precison cold forging press
sendo A4588 o id do workstation type e 9847 e 9855 duas workstations diferentes. Claramente podemos concluir que duas workstations 
diferentes podem conter/ser o mesmo tipo de workstation. Não está clara a relação entre workstation type e workstation uma vez que 
o enunciado também não clarifica esta relação. Já li as outras respostas no fórum e também não encontrei nada que clarifique a 100%.
É uma workstation que contém vários tipos de workstations ou cada workstation type contém diferentes workstations?
Em qualquer um dos casos a relação com a operação terá que ser com a workstation type uma vez que no ficheiro cada
operação está relacionada a uma ou mais workstationType, o que implica que uma operação é feita numa workstationType.
Porém, voltando ao excerto de excel, é uma workstationType que contém diversas workstations, dando entender que as operações são feitas pelas workstations.
>
> **Answer:** Há uma relação 1:N entre WorkstationType e Workstation. É o normal quando nos referimos a um "tipo" de qualquer coisa. 
Pode haver várias workstations do mesmo tipo.
Também é óbvio que as operações são realizadas por workstations, não WorkstationType. O contrário não fazia qualquer sentido, não é verdade?
Mas não fazia qualquer sentido alguém dizer que uma operação da BOO seria realizada numa Workstation em particular, porque estaria a fazer-se
escalonamento na fase de projeto do produto. Uma operação está relacionada com uma ou mais entidades do tipo WorkstationType e, aquando do escalonamento da produção, faz-se a atribuição a uma workstation em concreto. Mas o escalonamento da produção nada tem a ver com o trabalho de BDDAD do sprint 1.

> **Question:** Uma resposta dada pelo professor a outra pergunta foi a seguinte:
"Não sei se um quadrado de aço inox é material ou componente. Pode ser os dois.
Parafusos garantidamente que são componentes."
Mas por exemplo para a us4 que tinhamos de gerar os scripts sql automaticamente apartir do dataset,
como seria feito isso visto que depende da interpretação? além disso temos vários tipos de dados
por exemplo em description de product no dataset, que no modelo atual respondem a vários parâmetros de product,
mas não me parece haver nenhum critério automático que os consiga separar.
>
> **Answer:** Pode ter de acrescentar informação ao ficheiro dado (colunas) para poder integrar os dados no novo modelo.
Não me choca se considerar que todos os elementos das BOM dadas sejam componentes.

> **Question:** In the assignment, it is specified that each customer is identified by their tax number (NIF),
and that other information, such as their name, address, and contact details are also stored.
But it is also said that customers can be divided into individuals and companies:
Do we assume that the information stored about companies is exactly the same, or are there differences
between how we identify individuals (with their tax number) and companies (with some other criteria)?
>
> **Answer:** If there aren't rules that allow the system determine the type of customer, the user will have to make that distinction.

> **Question:** Dear client, can the machine and station be considered as the same thing? In the section 3.2,
it says "These operations are carried out by machines/stations installed in the factory" while in the section 2.4
it says "These stations can be composed of robotic units, automated machines, machines operated by human operators,
or human operators’ workstations". With the last statement, we understand that a station is composed of multiple machines,
but in the first it "says" they are the same thing.
>
> **Answer:** yes, operations are performed by machines or human operators, in either case, at a workstation. There is only one machine at each workstation.
Not to be mistaken with the concept of island (not introduced in the text), which can comprise multiple machines.

> **Question:** Is it possible for a product to have multiple Bill Of Materials? For example, a product that has a variant with the size small and another with the size big will require different quantities of materials, thus having more than one Bill Of Materials for a single product.
>
> **Answer:** no; different BOMs implies different articles/products.
Although products from same family or variants may share almost similar BOMs or BOOs.

> **Question:** can we consider that a workstation is the same as a machine?
>
> **Answer:** no, in the text says:
these [work]stations can be composed of robotic units, automated machines, machines operated by human operators,
or human operators’ workstations. The stations are capable of performing a set of manufacturing operations that depend on the type of industry; for example, in the furniture industry, the most common operations include cutting, drilling, gluing, assembly, polishing, varnishing, and painting.
But you can consider that an workstation don't have more than one machine.

> **Question:**
>
> **Answer:** 

> **Question:**
>
> **Answer:** 

> **Question:**
>
> **Answer:** 

> **Question:**
>
> **Answer:** 

> **Question:**
>
> **Answer:** 

> **Question:**
>
> **Answer:** 







