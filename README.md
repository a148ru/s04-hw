## 

### Задание 1

![alt text](image-1.png)

![alt text](image.png)

![alt text](image-2.png)

### Задание 2

[vpc doc.md](./04/src/modules/vpc/doc.md)

### Задание 3

1. ``` terraform state list```

![alt text](image-3.png)

2. remote vpc

![alt text](image-4.png)

3. 

![alt text](image-5.png)

4.

![alt text](image-6.png)
![alt text](image-7.png)
![alt text](image-8.png)

тут я не понял почему предлагает изменить labels и name


![alt text](image-9.png)

![alt text](image-10.png)

```terraform apply``` (
![alt text](image-12.png)

удалил и создал по новой 

```sh

$ terraform destroy -target="module.marketing.yandex_compute_instance.vm_instance[0]"
$ terraform destroy -target="module.analytic.yandex_compute_instance.vm_instance[0]"
$ terraform plan
$ terraform apply
```
![alt text](image-13.png)

### Задание 4
