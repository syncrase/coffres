[The Spring Inversion of Control (IoC) container](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/beans.html) has three main logical components: 
- a **registry** (called the `ApplicationContext`) of components (beans) that are available to be used by the application, 
- a **configurer system** that injects objects' dependencies into them by matching up the dependencies with beans in the context
- a **dependency solver** that can look at a configuration of many different beans and determine how to instantiate and configure them in the necessary order.

# Autowired service is null
The IoC container isn't magic, and it has no way of knowing about Java objects unless you somehow inform it of them. When you call `new`, the JVM instantiates a copy of the new object and hands it straight to you--it never goes through the configuration process. There are three ways that you can get your beans configured.

I have posted all of this code, using Spring Boot to launch, at [this GitHub project](https://github.com/chrylis/spring_autowired_npe_example); you can look at a full running project for each approach to see everything you need to make it work. **Tag with the `NullPointerException`: [`nonworking`](https://github.com/chrylis/spring_autowired_npe_example/tree/nonworking)**

## Inject your beans

The most preferable option is to let Spring autowire all of your beans; this requires the least amount of code and is the most maintainable. To make the autowiring work like you wanted, also autowire the `MileageFeeCalculator` like this:

```java
@Controller
public class MileageFeeController {

    @Autowired
    private MileageFeeCalculator calc;

    @RequestMapping("/mileage/{miles}")
    @ResponseBody
    public float mileageFee(@PathVariable int miles) {
        return calc.mileageCharge(miles);
    }
}
```

If you need to create a new instance of your service object for different requests, you can still use injection by using [the Spring bean scopes](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/beans.html#beans-factory-scopes).

**Tag that works by injecting the `@MileageFeeCalculator` service object: [`working-inject-bean`](https://github.com/chrylis/spring_autowired_npe_example/tree/working-inject-bean)**

## Use @Configurable

If you really need objects created with `new` to be autowired, you can [use the Spring `@Configurable` annotation along with AspectJ compile-time weaving](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/aop.html#aop-atconfigurable) to inject your objects. This approach inserts code into your object's constructor that alerts Spring that it's being created so that Spring can configure the new instance. This requires a bit of configuration in your build (such as compiling with `ajc`) and turning on Spring's runtime configuration handlers (`@EnableSpringConfigured` with the JavaConfig syntax). This approach is used by the Roo Active Record system to allow `new` instances of your entities to get the necessary persistence information injected.

```java
@Service
@Configurable
public class MileageFeeCalculator {

    @Autowired
    private MileageRateService rateService;

    public float mileageCharge(final int miles) {
        return (miles * rateService.ratePerMile());
    }
}
```

**Tag that works by using `@Configurable` on the service object: [`working-configurable`](https://github.com/chrylis/spring_autowired_npe_example/tree/working-configurable)**

## Manual bean lookup: not recommended

This approach is suitable only for interfacing with legacy code in special situations. It is nearly always preferable to create a singleton adapter class that Spring can autowire and the legacy code can call, but it is possible to directly ask the Spring application context for a bean.

To do this, you need a class to which Spring can give a reference to the `ApplicationContext` object:

```java
@Component
public class ApplicationContextHolder implements ApplicationContextAware {
    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;   
    }

    public static ApplicationContext getContext() {
        return context;
    }
}
```

Then your legacy code can call `getContext()` and retrieve the beans it needs:

```java
@Controller
public class MileageFeeController {    
    @RequestMapping("/mileage/{miles}")
    @ResponseBody
    public float mileageFee(@PathVariable int miles) {
        MileageFeeCalculator calc = ApplicationContextHolder.getContext().getBean(MileageFeeCalculator.class);
        return calc.mileageCharge(miles);
    }
}
```

**Tag that works by manually looking up the service object in the Spring context: [`working-manual-lookup`](https://github.com/chrylis/spring_autowired_npe_example/tree/working-manual-lookup)**

References :
- https://stackoverflow.com/questions/19896870/why-is-my-spring-autowired-field-null