# ACID
4 properties of RDBs - atomicity, consistency isolation, durability

**transaction** - collection of queries that will run within one unit of work. This is used to ensure atomicity of business operation
* begin
* commit
* rollback

e.g. transfer money

**Account**

account_id | balance
----------|--------
1         | $1000
2         | $500

```
begin tx1
select balance from account where id=1
if > 100
update account set balance = balance - 100 where id =1
update account set balance = balance + 100 where id =2
commit tx1
```
### Atomicity 
all queries from transaction must succeed. If one fails all should rollback.

If not atomicity, in example from above if we have a crash - data will be in inconsistent state (like money subtracted and not added to other account)

### Isolation 
isolation - can my transaction see changes made by other transactions?

#### read phenomena
* **dirty reads** - we see **uncommitted** changes made by other transactions. This can be rolled-back. SOmetimes we don't want exact number of stuff (instagram likes)
![dirty](dirtyread.png)
* **non-repeatable reads** - read some value, but when did it again within the same transaction - got different result. Other transaction changed that - and committed!
Same as before, but committed
![NRR](non-repeatable.png)
* **phantom reads** - other transaction inserted a row in case of double read. 
![phantom](phantom.png)

additionally:

**lost update** - i started to change something and other transaction overwrote my data before I committed

#### isolation levels
levels implemented by DB to fix read phenomenas

* **read uncommitted** - no isolation, any change from the outside is visible to us. All phenomenas present
* **read committed** - each query in transaction sees only committed stuff (at a time of each query). This is the best tradeoff.
 **We can see changes committed at the time of each query**
* **repeatable read** - each query in a transaction only sees committed updates at the beginning of the transaction. 
Sees committed stuff at the beginning of the transaction (not by each query!). **We can see changes committed BEFORE this transaction**   
* **serialized** - transactions are serialized. SLOW!

![isolation](isolation.png)


### Consistency 
* `consistency in data` - all constraints on tables are still obligatory
* `consistency in reads` - update X, read X - always get the same data as you wrote it. 
    * opposite - NoSQL got `eventual consistency` - reads are not always 100% correct, but they will be in future. (data replication propagation, network latency etc.)
    * horizontal scaling might screw this property

#### eventual consistency


### Durability
* persistency on non-volatile storage


# Normalization
https://en.wikipedia.org/wiki/Database_normalization

way to keep data independent of another. Summarize in 
**does this column really belong to this table?**

Sometimes we violate this for peformance.

# Indexing

structure that makes queries faster. Inserts (or updates on indexed column) are slower.

2 types of indexes - `b tree` and `LSM tree`

`explain analyze select * from employees where id = 2000;`
will give us some info about the query, analyzing performance. Sequential scan (full table scan) - super slow, one by one

execute the query 2 times - cache will get involved (db or ssd cache), so it's faster.

primary key is always indexed by default. By hand:
`create index employees_name on employees(name);`

`like '%asd%;` queries are always slow, even when indexed

### explain - info about query (estimations)
* read the output from most indented directive
* seq scan (full table scan) - full table, row by row
* cost - how many ms took to fetch first and all rows. Sometimes we need lot of calculations before starting fetching
* rows - aproximation how many rows will be fetched - can be used instead of count(*)
* width of selected - in bytes (might be average)
* index scan - use index to speed up the process
* index only scan - no table fetch, pure index
* bitmap index scan - combination of idx scan and index scan. Might slow down everything, doubling the work

### explain analyze - does actual query, no estimation

## indexing

table:
```
create table grades (
    id long primary key,
    name varchar(30),
    g integer
);

create index g_idx on grades(g);
select name from grades where g = 30;
```

This will be **slower** than the same query without idx!!! We still need to go through index AND table! We filtered through g (index), and selected names (actual table). Here even full table scan would be better.

note: where id = someID - this will be fast (index scan), even if we fetch something outside the idx

We can create an index on non key columns to fix it. 
Index on data that is frequently fetched with a query. This will increase size of index of course
`create index g_idx on grades (g) include (name);`

now we'll have an index only scan (sweet!)

on ... - what we're searching for, include - what we're selecting

