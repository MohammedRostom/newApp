# 📘 Clean Architecture & Cubit – Practical README (بأمثلة بسيطة)

> الملف ده معمول عشان يبسط التفكير، ويشرح **إزاي بنشتغل Feature جديدة خطوة خطوة** بنفس الكومنتات اللي بتكتبها، بس بشكل أوضح وأسهل.

---

## 🧠 فلسفة الشغل (Mindset)

```txt
قسم الشغل ساعتين ساعتين
افصل مهما كان وصلت لإيه
```

- مش كل حاجة ليها قواعد ثابتة.
- خليك بنفس كودك وطريقتك.
- التنظيم مش تعقيد… التنظيم راحة دماغ 😍

---

## 🚀 When You Set Up New Feature

الفلو دايمًا كده (من غير لف):

```
Entity
 └── Repository (Abstraction)
      └── UseCase
           └── Cubit
                └── UI

Repository (Implementation)
 └── DataSource
      └── Model (from json)
      └── Mapper
```

---

## 🟢 DOMAIN LAYER

### 1️⃣ Entity

**يعني إيه؟**
- الداتا اللي التطبيق محتاجها.
- من غير أي تفاصيل API أو Firebase.

```dart
class UserEntity {
  final String id;
  final String name;

  UserEntity({required this.id, required this.name});
}
```

---

### 2️⃣ Repository (Abstraction)

**ليه؟**
- الدومين مايعرفش الداتا جاية منين.

```dart
abstract class AuthRepo {
  Future<UserEntity> login();
}
```

---

### 3️⃣ UseCase

**وظيفته**
- ينادي على Abstraction بس.

```dart
class LoginUseCase {
  final AuthRepo repo;

  LoginUseCase(this.repo);

  Future<UserEntity> call() {
    return repo.login();
  }
}
```

---

## 🔵 DATA LAYER

### 1️⃣ Model (from json)

> ❌ مفيش لعب هنا

```dart
class UserModel {
  final String? id;
  final String? name;

  UserModel({this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
```

---

### 2️⃣ Mapper (مهم جدًا)

**هو اللي:**
- يعالج null
- يحط default values

```dart
extension UserMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      name: name ?? 'Unknown',
    );
  }
}
```

---

### 3️⃣ Repository Implementation

```dart
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource data;

  AuthRepoImpl(this.data);

  @override
  Future<UserEntity> login() async {
    final model = await data.login();
    return model.toEntity();
  }
}
```

---

## 🔌 Service Locator (مهم جدًا)

### ⚠️ الترتيب مهم

### 1️⃣ Register DataSource
```dart
Sl.registerLazySingleton<AuthRemoteDataSource>(
  () => AuthRemoteDataSourceImpl(),
);
```

### 2️⃣ Register Repo
```dart
Sl.registerLazySingleton<AuthRepo>(
  () => AuthRepoImpl(Sl()),
);
```

### 3️⃣ Dependency Inversion

> دايمًا استخدم Abstraction مش Implementation

---

## 🎛️ Cubit

### 1️⃣ BlocProvider

```dart
BlocProvider(
  create: (_) => Sl<AuthCubit>(),
  child: LoginPage(),
)
```

✔️ استخدم create مش value (أداء أحسن)

---

### 2️⃣ استخدام Cubit

```dart
final cubit = context.read<AuthCubit>();
```

---

### 3️⃣ Error Handling (ضروري)

```dart
Future<void> login() async {
  try {
    emit(Loading());
    final user = await loginUseCase();
    emit(Success(user));
  } catch (e) {
    emit(Error());
    return; // يكسر الدالة
  }
}
```

---


### ✅ PolymerPhism 
دا نفس الدالة هي هي الاسم وال بودي لكن مش نفس التصرف 
showSateus زي دالة  snaKbar بيطلع التسجيل تم بنجاح و نفس الوقت No On Inernet نفس الالهكيل للديالة مع اختلاف المحتوي   


## 🟣 UI Layer

> الـ UI يستقبل State بس

```dart
BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    if (state is Loading) return CircularProgressIndicator();
    if (state is Success) return Text(state.user.name);
    return Container();
  },
)
```

---

## 🧩 Callback Functions (ببساطة)

```dart
void sayHello() {
  print('Hello');
}

void sayName(String name) {
  print('Hello $name');
}
```

```dart
onPressed: sayHello,
onPressed: () => sayName('Mohamed'),
```

---

## 🧠 Notes مهمة

- دايمًا try / catch في Cubit و Services
- أي داتا جاية من برا تدخل State
- ممكن تحفظ state في متغير:

```dart
final currentState = authCubit.state;
```

---

## 🏆 Golden Rule (Mapper)

- Model = زي ما الريموت باعت
- Entity = زي ما الدومين محتاج
- Mapper = هو اللي يصلّح الدنيا

---

## 📚 Reference
- Tharwat Samy – Fruits Hub

