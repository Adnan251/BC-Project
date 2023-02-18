//SPDX-License-Identifier: MIT

pragma solidity^0.8.7;

contract SendETH{

    struct reservation{
        string name;
        string date;
        int8 pl;
    }

    uint256 private balance = 0;
    string private nameOfReservation;
    string private date;
    int8 private pl;
    reservation[] private reservations;

    function storeValue() payable external {
        balance += msg.value;
    }

    function setReservationName(string calldata nameOfRes, string calldata dateSent, int8 places) external{
        nameOfReservation = nameOfRes;
        date = dateSent;
        pl = places;
    }

    function sendAmount(address payable recipiant) external payable{
        recipiant.transfer(balance);
        reservations.push(reservation(nameOfReservation, date, pl));
        balance = 0;
    }

    function getTransactions(uint256 num) external view returns (reservation memory){
        return reservations[num];
    }

}