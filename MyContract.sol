//SPDX-License-Identifier: MIT

pragma solidity^0.8.7;

contract SendETH{

    struct reservation{
        string name;
        string date;
        int8 pl;
    }

    uint256 public balance = 0;
    string public nameOfReservation;
    string public date;
    int8 public pl;
    reservation[] public reservations;

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

    function getTransactions() external view returns (reservation[] memory){
        return reservations;
    }

}