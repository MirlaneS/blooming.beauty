-- Apaga o banco de dados caso ele exista:
-- Isso é útil em "tempo de desenvolvimento".
-- Quando o aplicativo estiver pronto, isso NUNCA deve ser usado.
DROP DATABASE IF EXISTS bloomingbeauty;

-- Recria o banco de dados:
-- CHARACTER SET utf8 especifica que o banco de dados use a tabela UTF-8.
-- COLLATE utf8_general_ci especifica que as buscas serão "case-insensitive".
CREATE DATABASE bloomingbeauty CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados:
-- Todas as ações seguintes se referem a este banco de dados, até que outro
-- "USE nomedodb" seja encontrado.
USE bloomingbeauty;

-- Cria a tabela users:
CREATE TABLE users (

    -- O campo uID (PK → Primary Key) é usado para identificar cada registro 
    -- como único. Ele não pode ter valores repetidos.
    -- A opção AUTO_INCREMENT força que o próprio MySQL incremente o uID.
    uid INT PRIMARY KEY AUTO_INCREMENT,

    -- A data do cadastro está no fomrato TIMESTAMP (AAAA-MM-DD HH:II:SS).
    -- Só funciona com datas à partir de 01/01/1970 (Unix timestamp).
    -- DEFAULT especifica um valor padrão para o campo, durante a inserção.
    -- CURRENT_TIMESTAMP insere a data atual do sistema neste campo.
    udate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- NOT NULL especifica que este campo precisa de um valor.
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    photo VARCHAR(255),

    -- Formato do tipo DATE → AAAA-MM-DD.
    birth DATE,

    -- O tipo TEXT aceita strings de até 65.536 caracteres. 
   -- bio TEXT,

    -- O tipo ENUM(lista) só aceita um dos valores de "lista".
    -- DEFAULT especifica um valor padrão para o campo, durante a inserção.
    -- Neste caso, DEFAULT deve ter um avalor presente na lista de ENUM.
    type ENUM('admin', 'author', 'moderator', 'user') DEFAULT 'user',

    -- Formato do tipo DATETIME → AAAA-MM-DD HH:II:SS.
    last_login DATETIME,
    ustatus ENUM('online', 'offline', 'deleted', 'banned') DEFAULT 'online'
);

-- Cadastra alguns usuários para testes:
INSERT INTO users (
    uid,
    name,
    email,
    password,
    photo,
    birth,
    type
) VALUES (
    '1',
    'maria da Silva',
    'maria@silva.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/men/14.jpg',
    '1990-12-14',
    'author'
), (
    '2',
    'Meri Siriliano',
    'meri@neuza.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/women/72.jpg',
    '2002-03-21',
    'author'
), (
    '3',
    'walace Sirigarda',
    'walace@garda.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/women/20.jpg',
    '2004-08-19',
    'author'
), (
    '4',
    'Selso Trocatapas',
    'sels@brino.com',
    SHA1('senha123'),
    'https://randomuser.me/api/portraits/men/20.jpg',
    '1979-02-03',
    'author'
);

-- Cria tabela articles:
CREATE TABLE articles (
    aid INT PRIMARY KEY AUTO_INCREMENT,
    adate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    resume VARCHAR(255) NOT NULL,
    astatus ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    views INT DEFAULT 0,

    -- Define author como chave estrangeira.
    -- Isso faz com que a tabela "articles" seja dependente da tabela "users"
    -- para receber valores.
    -- Somente o id de um usuário já cadastrado na tabela "users" pode ser 
    -- usado no campo "author" da tabela "articles".
    FOREIGN KEY (author) REFERENCES users (uid)
);

-- Insere alguns artigos para testes:
INSERT INTO articles (
    author,
    title,
    content,
    thumbnail,
    resume
) VALUES (
    '1',
    'Por que as mulheres choram',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/200',
    'Saiba a origem da do choro.'
), (
    '2',
    'Por que somos sentidas',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/199',
    'Alguns algumas sao mais sencives que as outras. Sabe por que?'
), (
    '2',
    'Quando estamos tristes',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/198',
    'Quando lagrimas o que dizer delas chegar do nada sem ninguém vê, ela realmente caiu ou foi provocada?'
), (
    '4',
    'fal que um sisco caiu no olho',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/201',
    'tudo na vida e um apredizado.'
), (
    '3',
    'Impacto da vida',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/202',
    'Não esqueça de todos os itens necessários para adentrar uma grande vivencia.'
), (
    '3',
    'anda sempre cheirosa',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/203',
    'Conheça os melhores produto pra anda sempre cheirosa.'
);

-- Cria a tabela "comments":
CREATE TABLE comments (
    cid INT PRIMARY KEY AUTO_INCREMENT,
    cdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cautor INT NOT NULL,
    article INT NOT NULL,
    comment TEXT NOT NULL,
    cstatus ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    FOREIGN KEY (cautor) REFERENCES users (uid),
    FOREIGN KEY (article) REFERENCES articles (aid)
);

-- Insere comentários para testes:
INSERT INTO comments (
    cautor,
    comment,
    article
) VALUES (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '2',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '3',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '3'
), (
    '4',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '1',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '4'
), (
    '3',
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum.',
    '6'
);

-- Cria a tabela "contacts":
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOt NULL,
    status ENUM('sended', 'readed', 'responded', 'deleted') DEFAULT 'sended'
);

-- CRIANDO E TESTANDO:
-- Selecione todo este conteúdo teclando [Ctrl]+[A];
-- Copie o conteúdo para a área de transferência teclando [Ctrl]+[C];
-- Acesse o PHPMyAdmin → http://localhost/phpmyadmin;
-- Clique na guia [SQL] na porção esquerda;
-- Cole o código no campo, teclando [Ctrl]+[V];
-- Verifique se ocorreram erros de sintaxe.
--     Aparece um "X" dentro de uma bola vermelha.
-- Clique no botão [Continuar] que está logo abaixo;
-- Verifique se não ocorrem erros.
-- Atualize a página para ver se o banco foi corretamente criado, juntamente
-- com as tabelas e os campos destas...