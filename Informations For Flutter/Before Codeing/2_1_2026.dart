// قسم الشغل ساعتين ساعتين وافصل علي طول اي كان الل وصلت ليه 
// لازم تعرف مش كل حاجة ليها قواعد ثابتة علي فكرة خليك بنفس كودك زي م انت يا معلم 😍😍😍

// """""""When you Set up New Feature """""""

//  ----------------------------------
//  DOMAIN LAYER
//  ----------------------------------
 // userEntity
  //  --> Rebo(Abstraction) 
                            // --------------------
                            // DATA LAYER ( باقي التفاصيل معروفة ) 
                            // --------------------
                              // dataSours اللي فيها from json <Model Type> Reruen fromModel(user)    From Result
                              // Rebo (Implements) (Locator Pased) انظر الكود  فيها ال mapper يرضو و  Reruen ToEntitiy(user) From Result

  //      ---> UseCaase (Call Abst Methods)
   //          ---> Cubit   
    //               ---> Ui    

// --------------------------------------------------------------------------------------------

// """Locator """" الترتيب مهم
// 1-  الربط بين    Aps , Impl
   //  Sl.registerLazySinglton <Abs> ()=> Implemnt(Data:Sl()"مش لازم يبقي موجود")   Data:Sl() -=>  في حالة الترتيب الصيحيح  Data مسجل قبل كدا  == Orginsed Flow==

// 2- Dependancy inverstion  (Aps, Impl, "Opj From Aps" Not Opj From Impl) , Class EX: DataS use Instance from  Aps
  
  //  -----------------------------
  //  Data Class
    // finl Aps aps;
        // Data({requierd this.aps})
  //  -----------------------------
  
  //  Sl.registerLazySinglton <DataS> ()=> DataS(abs:Sl()) 

// 3- مش لازم تعمل locatorApp Class خلي كل شي جلولبل 



// """CUbit""""
//  1-  Use (Create) not (Value) For "performance" ====> blocProvider
// 
      // BlocProvider(
      //   create: (context) => Sl<Cubit>  ===== From locator ,
      //   child: Container(),
      // )

//  2   Use  context.read<Cubit>()
      // ---------------------------
      // BlocBuilder<SubjectBloc, SubjectState>(
      //   builder: (context, state) {
        // $$$$$$$$$ final cubit =context.read<Cubit>();$$$$$$$


      //     return Container();
      //   },
      // )
      // --------------------------- 

//  3     حاول تستخدم ال ال النتايج  الاستقابل كدا //  جرب تستخدم  جرب تستخدم Either Dart Z in Usecase
      // Future<void> login(String email, String password) async {
      //   emit(LoginLoading());

      //   try {
      //     final result = await loginUseCase(email, password);
      //     result.fold(
      //       (error) => emit(LoginError(error)),
      //       (user) => emit(LoginSuccess(user)),
      //     );
      //   } catch (e) {
      //     emit(LoginError('Something went wrong'));
      //   }
      // }









// ========================== NOETS=================================================
  // add try cach for methods to avoid carch app With Ai Copilot in (Cupit && Services ) ==========
  // reurn; تكسر الدالة عشان متكملش للاخر  Ex: Connection Error
  // states مع Conumer حاول مستخدمس الكيوبس شكل مباشر  يعني استخدم ال 
  // ديما استخدم ال try  cach  في الكيوبت والسرفيس 
  // ممكن تحفظ stats في متغير عشان تستخدمه اكتر من مرة
    // final CurrntState = authCubit.state;
  // Callback Function = فانكشن بتتبعت كـ باراميتر لفانكشن تانية، والفانكشن التانية هي اللي بتستدعيها وقت ما تحب.
  // اي داتا جاية من برا ريموت ديما اتسقبل ف الاستات  STate وابعت ووزع ال ui 
  // ال PolymerPhism دا نفس الدالة هي هي الاسم وال بودي لكن مش نفس التصرف 
    //  زي دالة showSateus  snaKbar بيطلع التسجيل تم بنجاح و نفس الوقت No On Inernet نفس الالهكيل للديالة مع اختلاف المحتوي 
// ===========================================================================


// Examples of Callback Functions
    // void sayHello() {
    //   print("Hello!");
    // }


    // void sayName(String name) {
    //   print("Hello $name");
    // }
    

    // ========== click مستنيين ال  ========
    // onPressed: sayHello,    "Callback Functions" من غير درعات مستني الامر 
    // onPressed: () => sayName("Mohamed"), 



// *************** 23/12/2025 ***************
//  حاجات لازز تعملها ال mapper  يعني من الاخر الموديل زي ما خو و الانتتتي زي ما هي المابر بيعمل اي ؟
//  بص هة اللي بيعمل القيمة الافترافضية ؟؟ مثلا  nullsafty  مفيش لعب ف الداتا الموديل والانتتي 


// الي نظرة كدا هنا ثروت سامي 
// https://github.com/tharwatsamy/fruits_hub/blob/main/lib/features/auth/domain/repos/auth_repo.dart

// =========== Chat GPT  to get Exmples =========
// لو عايز، أقدر:
// أرتّب لك الشرح ده بشكل احترافي.
// أو أحولّه لشرح كامل بيوضح Clean Architecture + Cubit + GetIt.
// أو أساعدك تعرف الطبقات بالضبط المفروض تكون إزاي.
// تحب أرتّب الكلام وأشرحه لك؟


