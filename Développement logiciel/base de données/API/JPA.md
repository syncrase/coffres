
Signifie Jakarta Persistence API

Référence : https://stackoverflow.com/questions/2302802/how-to-fix-the-hibernate-object-references-an-unsaved-transient-instance-save

## Introduction

When using JPA and Hibernate, an entity can be in one of the following 4 states:

-   **New** - A newly created object that hasn’t ever been associated with a Hibernate Session (a.k.a Persistence Context) and is not mapped to any database table row is considered to be in the New or Transient state.

To become persisted we need to either explicitly call the `persist` method or make use of the transitive persistence mechanism.

-   **Persistent** - A persistent entity has been associated with a database table row and it’s being managed by the currently running Persistence Context.

Any change made to such an entity is going to be detected and propagated to the database (during the Session flush-time).

-   **Detached** - Once the currently running Persistence Context is closed all the previously managed entities become detached. Successive changes will no longer be tracked and no automatic database synchronization is going to happen.
    
-   **Removed** - Although JPA demands that managed entities only are allowed to be removed, Hibernate can also delete detached entities (but only through a `remove` method call).
    

## Entity state transitions

To move an entity from one state to the other, you can use the `persist`, `remove` or `merge` methods.

[![JPA entity states](https://i.stack.imgur.com/QSdMl.png)](https://vladmihalcea.com/a-beginners-guide-to-jpa-hibernate-entity-state-transitions/)

## Fixing the problem

The issue you are describing in your question:

```java
object references an unsaved transient instance - save the transient instance before flushing
```

is caused by associating an entity in the state of **New** to an entity that's in the state of _Managed_.

This can happen when you are associating a child entity to a one-to-many collection in the parent entity, and the collection does not `cascade` the entity state transitions.

So, you can fix this by adding cascade to the entity association that triggered this failure, as follows:

## The `@OneToOne` association

```java
@OneToOne(
    mappedBy = "post",
    orphanRemoval = true,
    cascade = CascadeType.ALL)
private PostDetails details;
```

> Notice the `CascadeType.ALL` value we added for the `cascade` attribute.

## The `@OneToMany` association

```java
@OneToMany(
    mappedBy = "post", 
    orphanRemoval = true,
    cascade = CascadeType.ALL)
private List<Comment> comments = new ArrayList<>();
```

Again, the `CascadeType.ALL` is suitable for the bidirectional `@OneToMany` associations.

Now, in order for the cascade to work properly in a bidirectional, you also need to make sure that the parent and child associations are in sync.

## The `@ManyToMany` association

```java
@ManyToMany(
    mappedBy = "authors",
    cascade = {
        CascadeType.PERSIST, 
        CascadeType.MERGE
    }
)
private List<Book> books = new ArrayList<>();
```

In a `@ManyToMany` association, you cannot use `CascadeType.ALL` or `orphanRemoval` as this will propagate the delete entity state transition from one parent to another parent entity.

Therefore, for `@ManyToMany` associations, you usually cascade the `CascadeType.PERSIST` or `CascadeType.MERGE` operations. Alternatively, you can expand that to `DETACH` or `REFRESH`.