const contractABI = [
    {
        "inputs": [],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "serialNumber",
                "type": "string"
            },
            {
                "internalType": "string",
                "name": "invoiceNumber",
                "type": "string"
            }
        ],
        "name": "getCarComponentDetails",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    }
];

// Replace with your contract address
const contractAddress = '0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8';

async function getCarComponentDetails(serialNumber, invoiceNumber) {
    if (window.ethereum) {
        try {
            const web3 = new Web3(window.ethereum);
            await window.ethereum.request({ method: 'eth_requestAccounts' });

            const contract = new web3.eth.Contract(contractABI, contractAddress);
            const details = await contract.methods.getCarComponentDetails(serialNumber, invoiceNumber).call();
            return details;
        } catch (error) {
            console.error(error);
            return "Error fetching details.";
        }
    } else {
        return "Please install MetaMask!";
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const getDetailsBtn = document.getElementById('getDetailsBtn');

    getDetailsBtn.addEventListener('click', async () => {
        const serialNumber = document.getElementById('serialNumber').value;
        const invoiceNumber = document.getElementById('invoiceNumber').value;
        const detailsOutput = document.getElementById('detailsOutput');

        detailsOutput.textContent = 'Fetching details...';

        const details = await getCarComponentDetails(serialNumber, invoiceNumber);
        detailsOutput.textContent = details;
    });
});
