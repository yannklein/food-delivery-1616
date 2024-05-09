### Food Delivery challenge day 2

```
        _______________________________________________________
       |                                                      |
       |   App                )\._.,--...,'``.                |
       |                    /,   _.. \   _\  (`._ ,.          |
       |                   `._.-(,_..'--(,_..'`-.;.'          |
       |                    |     Router     |                |
       |                    |________________|                |
       |                            |                         |
       |                     _______\/_______                 |
       |   _________        |                |                |
       |  | 1.Model |       |  3.Controller  |                |
       |  |_________|       |________________|                |
       |        \             /            \                  |
       |         \___________\/_        ___\/______________   |
 ___   |         |              |      |                   |  |
|CSV|<---- ----->| 2.Repository |      | 4.View(puts,gets) |  |
'---'  |         |______________|      |___________________|  |
       |______________________________________________________|
```

Order schema:

```
+--------------------+
|       Order        |
+--------------------+
| @id                |
|                    |
+--------------------+
|                    |
+--------------------+
```

- [X] As an employee, I can log in
- [X] As a manager, I can add a new meal
- [X] As a manager, I can list all the meals
- [X] As a manager, I can add a new customer
- [X] As a manager, I can list all the customers
- [ ] As a manager, I can add a new order
- [ ] As a manager, I can list all the undelivered orders
- [ ] As a rider, I can mark one of my orders as delivered
- [ ] As a rider, I list all my undelivered orders