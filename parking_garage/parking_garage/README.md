# ParkingGarage

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `parking_garage` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:parking_garage, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/parking_garage](https://hexdocs.pm/parking_garage).

## General Description

parking garage:
- [x] three different vehicles (truck, car, motorcycles)
- [ ] store car license plate and state to ID vehicles.
- [ ] different prices for dif sized spaces (e.g. truck vs motorcycle). 
	Allow small vehicles to go into large spots if they pay more for them.
	Normally, Trucks are 10x normal price, motorcycle 1/2x normal price.
- [ ] data structure suiting parking lot (not array)
	- [ ] 100 spots, 10 motor, 10 truck
- [ ] fixed in size
- [ ] favor near entrance parking
- [ ] retrieve location of car
- [ ] find info about any vehicle (e.g. how long it been there).
- [ ] be able to charge customer, generate ticket
- [ ] actor: attendant (also note who handled the car)
- [ ] actor: manager
- [ ] attendants and managers must log in (user+pass log in system needed, username unique, data structure required).
	- [ ] they input name, address, etc.
	- [ ] 1 num, 1 capital letter, 1 lower letter, in generated password.
- [ ] generate ticket: attendants type in license # and state (time automatically recorded).
	- [ ] ticket used for payment when customer gives it back
- [ ] payment schedule (less or more money depending on time; flat early bird, monthly, hourly...)
	- [ ] 1min = 1hr for testing, but make it easy to switch to hours or something else
	- [ ] payment info is stored inside car objects, upon check in and out
- [ ] cash only, receipt
- [ ] round up payment

- [ ] Be able to search for car and users quickly (? structure) using different key fields.
- [ ] Date recorded in car objects just so it can be used to search if desired.
- [ ] More than one data structures will be needed (e.g. parking spots/one closest to entrance).

- [x] Customers don't park own car
- [x] Don't account for overnight parking

-------------
Class uml diagram:
- abstract classes are italicized
- multiplicity in variables
- {id} after field means unique value
- "generalization" means extends 
- associations/has-a relationships may be shown separate (or in line)
- aggregation: has a relationship
- composition: owns a relationship (has-a relationship where class loses meaning if relationship is destroyed).
