// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarComponentDetails {
    string private constant validSerialNumber = "DL13SN3489";
    string private constant validInvoiceNumber = "12345678";

    string[] private carComponentCategories;
    mapping(string => string[]) private carComponentDetails;

    constructor() {
        carComponentCategories = [
            "Engine and Transmission",
            "Electrical System",
            "Drivetrain",
            "Suspension and Steering",
            "Braking System",
            "Exhaust System",
            "Fuel System",
            "Cooling System",
            "Climate Control",
            "Body and Interior",
            "Tires and Wheels"
        ];

        carComponentDetails["Engine and Transmission"] = [
            "Engine: The main power source of the vehicle.",
            "Transmission: Transfers power from the engine to the wheels.",
            "Radiator: Cools the engine by dissipating heat.",
            "Alternator: Charges the battery and powers the electrical system when the engine is running.",
            "Starter Motor: Cranks the engine to start it.",
            "Timing Belt/Chain: Synchronizes the engine's functions.",
            "Fuel Injector/Carburetor: Supplies fuel to the engine.",
            "Turbocharger/Supercharger: Increases engine power."
        ];

        carComponentDetails["Electrical System"] = [
            "Battery: Provides electrical power for starting the car and running electrical systems when the engine is off.",
            "Spark Plugs: Ignite the air/fuel mixture in the engine cylinders.",
            "Fuses and Relays: Protect electrical circuits.",
            "Wiring Harness: Connects all electrical components.",
            "ECU (Engine Control Unit): Manages engine functions."
        ];

        carComponentDetails["Drivetrain"] = [
            "Drive Shaft: Transfers power from the transmission to the differential.",
            "Differential: Distributes power to the wheels.",
            "Axles: Transmit power from the differential to the wheels.",
            "Clutch (manual transmission): Engages and disengages power from the engine to the transmission."
        ];

        carComponentDetails["Suspension and Steering"] = [
            "Shock Absorbers/Struts: Dampen road shocks.",
            "Springs: Support vehicle weight and absorb road shocks.",
            "Control Arms: Connect the suspension to the vehicle frame.",
            "Steering Rack/Box: Translates steering wheel movement into wheel direction.",
            "Tie Rods: Connect the steering rack to the steering knuckles."
        ];

        carComponentDetails["Braking System"] = [
            "Brake Pedal: Activates the braking system.",
            "Brake Master Cylinder: Converts pedal force into hydraulic pressure.",
            "Brake Calipers: Clamp the brake pads onto the rotors.",
            "Brake Pads: Create friction to stop the vehicle.",
            "Brake Rotors/Discs: Provide a surface for the pads to clamp onto.",
            "Brake Lines/Hoses: Carry hydraulic fluid to the brakes."
        ];

        carComponentDetails["Exhaust System"] = [
            "Exhaust Manifold: Collects exhaust gases from the engine cylinders.",
            "Catalytic Converter: Reduces harmful emissions.",
            "Muffler: Reduces exhaust noise.",
            "Exhaust Pipe: Channels exhaust gases out of the vehicle."
        ];

        carComponentDetails["Fuel System"] = [
            "Fuel Tank: Stores fuel.",
            "Fuel Pump: Delivers fuel from the tank to the engine.",
            "Fuel Filter: Removes impurities from the fuel.",
            "Fuel Lines: Transport fuel to the engine."
        ];

        carComponentDetails["Cooling System"] = [
            "Water Pump: Circulates coolant through the engine.",
            "Thermostat: Regulates engine temperature.",
            "Coolant Reservoir: Stores excess coolant.",
            "Radiator Hoses: Carry coolant to and from the radiator."
        ];

        carComponentDetails["Climate Control"] = [
            "AC Compressor: Circulates refrigerant through the air conditioning system.",
            "Condenser: Removes heat from the refrigerant.",
            "Evaporator: Absorbs heat from the vehicle interior.",
            "Heater Core: Provides heat to the vehicle interior."
        ];

        carComponentDetails["Body and Interior"] = [
            "Frame/Chassis: The main structural component.",
            "Body Panels: Exterior surface components (doors, hood, fenders).",
            "Windows and Windshield: Provide visibility and protection.",
            "Seats: Provide seating for occupants.",
            "Dashboard: Houses controls and displays.",
            "Instrument Cluster: Displays speed, fuel level, and other important information.",
            "Airbags: Provide occupant protection in a crash."
        ];

        carComponentDetails["Tires and Wheels"] = [
            "Tires: Provide traction and absorb road shocks.",
            "Wheels/Rims: Support the tires and connect them to the axles.",
            "Wheel Bearings: Allow wheels to rotate smoothly."
        ];
    }

    function getCarComponentDetails(string memory serialNumber, string memory invoiceNumber) public view returns (string memory) {
        if (keccak256(abi.encodePacked(serialNumber)) == keccak256(abi.encodePacked(validSerialNumber)) && keccak256(abi.encodePacked(invoiceNumber)) == keccak256(abi.encodePacked(validInvoiceNumber))) {
            string memory details = "";
            for (uint i = 0; i < carComponentCategories.length; i++) {
                string memory category = carComponentCategories[i];
                details = string(abi.encodePacked(details, category, ":\n"));
                for (uint j = 0; j < carComponentDetails[category].length; j++) {
                    details = string(abi.encodePacked(details, carComponentDetails[category][j], "\n"));
                }
                details = string(abi.encodePacked(details, "\n"));
            }
            return details;
        } else {
            return "Vehicle with these credentials doesn't exist.";
        }
    }
}
