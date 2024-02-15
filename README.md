## Instalaciones necesarias
* [CLI de Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) (1.2.0+) instalada.
* [CLI de AWS](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) instalada.
* [Cuenta de AWS](https://aws.amazon.com/free) y las [credenciales asociadas](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html) que permiten crear recursos.

## Configuración de credenciales de AWS
Una vez creado el usuario de aws con los permisos necesarios ![Permisos de IAM](https://terraformblockstellart.s3.us-east-2.amazonaws.com/Permissions.jpg "")
> Para este ejemplo utilizaremos los permisos de administrador.

Ahora generamos las accessKeys y las podemos utilizar desde variables de entorno:

```js
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```
o utilizando el archivo variables.tf. En el cual configuramos los valores default.
Si en este archivo no se asignan los valores default, al momento de ejecutar el comando ```
terraform apply``` se nos preguntara por estos las credenciales


__Nota__: hay diferentes formas de configurar las variables:
1. Manual
2. Default
3. Env vars
4. terraform-tfvars/.json
5. *.tfvars no cargado -var-file ``terraform apply -var-file=./variagles.tfvars``
6. *.auto.tfvars or *.auto.tfvars.json
7. -var and -var-file

## Secciones del código
Esta sección indica que va a requerir terraform para trabajar con aws
![terraform](https://terraformblockstellart.s3.us-east-2.amazonaws.com/Terraform+aws.jpg "")
Proporciona mas información para acceder y crear los recurso de mi infraestructura en aws
![terraform region](https://terraformblockstellart.s3.us-east-2.amazonaws.com/terraform+region.jpg "")
Especifica el recurso que se va a crear (```aws_instance```) y el nombre que va a tomar dentro de terraform (```blockstellart```)
![terraform resource](https://terraformblockstellart.s3.us-east-2.amazonaws.com/terraform+resource.jpg "")

> **Importante**: El ID de AMI utilizado en esta configuración es específico de la región us-east-2. Si desea utilizar una región diferente, debe buscar el ID correspendiente

## Pasos para crear infraestructura
Cada configuración de Terraform debe estar en su propio directorio de trabajo. 
Se crea un directorio para tu configuración.

```
mkdir terraform-blockstellart
cd terraform-blockstellart
```

1. Descarga toda la información que requiere mi provider
``Terraform init`` 
![Terraform init](https://terraformblockstellart.s3.us-east-2.amazonaws.com/t1-c.jpg "")

2. Da formato a los archivos, así no importa si los desarrolladores añadieron por error algun espacio o tab, terraform le da un formato
``terraform fmt``
![before](https://terraformblockstellart.s3.us-east-2.amazonaws.com/before-f.jpg "")
![After](https://terraformblockstellart.s3.us-east-2.amazonaws.com/after-t.jpg "")

3. Mustra que es lo que vamos a  crear
``terraform plan``
![terraform plan](https://terraformblockstellart.s3.us-east-2.amazonaws.com/t-plan.jpg "")
4. Aplicara los cambios mostrados con el comando anterior y además tiene dos formas de usarlo
    1. ``terraform apply``
    ![terraform apply](https://terraformblockstellart.s3.us-east-2.amazonaws.com/t-apply.jpg "")
    ![terraform confirm](https://terraformblockstellart.s3.us-east-2.amazonaws.com/t-apply-confirm.jpg "")
    Solicita confirmación para ejecutarse
    2.  ``terraform apply -auto-approve``
    No realiza ninguna confirmación y ejecuta el comando para crear la infraestructura


![creating](https://terraformblockstellart.s3.us-east-2.amazonaws.com/t-create.jpg "")
![aws](https://terraformblockstellart.s3.us-east-2.amazonaws.com/instance+aws.jpg "")

![apply complete](https://terraformblockstellart.s3.us-east-2.amazonaws.com/apply+compleate+with+outputs.jpg "")

5. Para eliminar la instancia ec2, ejecutamos:
```terraform destroy```
![destroy](https://terraformblockstellart.s3.us-east-2.amazonaws.com/destroy.jpg "")
Confirmamos la accion
![destroy confirm](https://terraformblockstellart.s3.us-east-2.amazonaws.com/destroy+confirm.jpg "")

6. Proceso completado
![destroy confirm](https://terraformblockstellart.s3.us-east-2.amazonaws.com/destroy+complete.jpg "")
![instance aws](https://terraformblockstellart.s3.us-east-2.amazonaws.com/instance+aws.jpg "")
