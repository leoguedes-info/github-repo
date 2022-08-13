#!/bin/bash

#iaC para gestão de usuarios, diretorios, grupos e permissões - v0.1
#o script usa linhas em arquivos de texto como parametros de comando
#script ainda sem verificações de estrutura nem excessões para tratamentos de erros
#as funções de comanando reais estão comentadas
#esse script atua na pasta em que está sendo executado para criação e modificação de diretórios

criaDiretorio () {
 dir=$line
 echo "_mkdir $dir"
#echo "$(mkdir $dir)"
}

criarGrupo () {
 grp=$line
 echo "_groupadd $grp"
#echo "$(groupadd $grp)"
}

criaUsuario () {
 usr=$line
 echo "Escolha o numero do grupo"
 for line in $(cat grupos.txt);
  do
   let i++
   echo -e "($i)$line \c"
  done
  read aux
  let i=0
  grp=$(cat grupos.txt | sed -n "$aux p")
  echo -e "_useradd $usr -c \"$usr\" -m -s /bin/bash -p \$(openssl passwd -crypt pass123) -G $grp"
#echo "$(useradd $usr -c "$usr" -m -s /bin/bash -p $(openssl passwd -crypt pass123 -G $grp))"
}

echo "###Diretorios###"
for line in $(cat diretorios.txt);
 do
  criaDiretorio $line;
 done

echo "###Grupos###"
for line in $(cat grupos.txt);
 do
  criarGrupo $line;
 done

echo "###Usuarios###"
for line in $(cat usuarios.txt);
 do
  criaUsuario $line;
 done

echo "###Permissões###"
#Melhoria futura para escolha em tempo de execução e baseado em arquivo ou database.

#pseudo comandos
echo "_chown root:grp01 dir01"
echo "_chown root:grp02 dir02"
echo "_chown root:grp03 dir03"
echo "_chown root:root dir04"

echo "_chmod 770 dir01"
echo "_chmod 770 dir02"
echo "_chmod 770 dir03"
echo "_chmod 777 dir04"

#comandos comentados
#echo $(chown root:grp01 dir01)
#echo $(chown root:grp02 dir02)
#echo $(chown root:grp03 dir03)
#echo $(chown root:root dir04)

#echo $(chmod 770 dir01)
#echo $(chmod 770 dir02)
#echo $(chmod 770 dir03)
#echo $(chmod 777 dir04)

echo "script concluido"



