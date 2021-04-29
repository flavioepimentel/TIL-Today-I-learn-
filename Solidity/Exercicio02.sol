pragma solidity >=0.4.16 <0.9.0;

contract MyContract{
    string public value;
    //Declarando o estado do contrato
    enum State {Waiting, Ready, Active}
    State public state;

    address owner;
    // `onlyOwner()` é um modificador criado para restringir quem pode utilizar a função
    modifier onlyOwner(){
        require (msg.sender == owner);
        _;
    }

    constructor() public {
        value = 'myValue';
        state = State.Waiting;
        owner = msg.sender;
    }

    function get() public view returns(string memory){
        return value;
    }

    function set(string memory _value) public{
        value = _value;
    }

    //Alterando o estado do contrato
    function activate() public onlyOwner{
        state = State.Active;
    }
    //Verificando o estado do contrato
    function isActivate() public view returns(bool){
        return state == State.Active;
    }

    uint256 public dadoCount = 0;
    mapping(uint => Dado) public dados;

    struct Dado {
        uint _id;
        string _descricao;
        uint _algumValor;
    }
    
    function addDado(string memory _descricao, uint _algumValor) public onlyOwner{
        // dadoCount += 1; <- Transformando isso em uma função interna
        incrementalCount();
        dados[dadoCount] = Dado(dadoCount, _descricao, _algumValor);
    }
    // Utilizando outro tipo de exposição interno de função
    function incrementalCount() internal{
        dadoCount += 1;
    }

}