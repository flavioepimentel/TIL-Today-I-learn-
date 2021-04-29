pragma solidity >=0.4.16 <0.9.0;

contract MyContract{
    string public value;
    //Declarando o estado do contrato
    enum State {Waiting, Ready, Active}
    State public state;

    constructor() public {
        value = 'myValue';
        state = State.Waiting;
    }

    function get() public view returns(string memory){
        return value;
    }

    function set(string memory _value) public{
        value = _value;
    }

    //Funções de estado

    //Alterando o estado do contrato
    function activate() public{
        state = State.Active;
    }
    //Verificando o estado do contrato
    function isActivate() public view returns(bool){
        return state == State.Active;
    }

    // Modelando estruturas "banco de dados"
    Person [] public people;
    uint256 public peopleCount;

    struct Person {
        string _primeiroNome;
        string _ultimoNome;
    }
    function addPerson(string memory _primeiroNome, string memory _ultimoNome) public{
        people.push(Person(_primeiroNome, _ultimoNome));
        peopleCount += 1;
    }




    // Outra opção de modelagem de dados utilizando o mapping
    // mapping ao invés de do item utilizar um index ele terá um hash id


    uint256 public dadoCount = 0;
    mapping(uint => Dado) public dados;

    struct Dado {
        uint _id;
        string _descricao;
        uint _algumValor;
    }

    function addDado(string memory _descricao, uint _algumValor) public{
        dadoCount += 1;
        dados[dadoCount] = Dado(dadoCount, _descricao, _algumValor);
    }

}