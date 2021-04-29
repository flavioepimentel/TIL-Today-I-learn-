pragma solidity >=0.4.16 <0.9.0;

contract MyContract{
    /* Modificado que define quando o BD 
    estará aberto para inserção de dados

    O tempo deve ser inserido em segundos de acordo www.epochconverter.com 
    Substitua o 0000000000

    */

    uint256 itsTime = 0000000000;

    /*Quando o contrato for acessado após o horário definido
    em `itsTime` será permitido adicionar dados*/

    modifier timeToOpen(){
        require (block.timestamp >= itsTime);
        _;
    }

    uint256 public dadoCount = 0;
    mapping(uint => Dado) public dados;

    struct Dado {
        uint _id;
        string _descricao;
        uint _algumValor;
    }
    
    function addDado(string memory _descricao, uint _algumValor) public timeToOpen{
        incrementalCount();
        dados[dadoCount] = Dado(dadoCount, _descricao, _algumValor);
    }
    // Utilizando outro tipo de exposição interno de função
    function incrementalCount() internal{
        dadoCount += 1;
    }

}