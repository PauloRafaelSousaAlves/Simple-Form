class FormEntity {
  String email;
  String name;
  String lastName;
  String age;
  String gender;
  String job;
  String schooling;

  String lifeGoal;
  FormEntity(
    this.email,
    this.name,
    this.lastName,
    this.age,
    this.gender,
    this.job,
    this.schooling,
    this.lifeGoal,
  );

  String toEmailBody() {
    return '''Dados coletados:

Nome: $name
Sobrenome: $lastName
Idade: $age
Gênero Sexual: $gender
Emprego Atual: $job
Escolaridade: $schooling

Objetivo de vida: $lifeGoal
    
    
    ''';
  }
}
