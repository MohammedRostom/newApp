// قسم الشغل ساعتين ساعتين وافصل علي طول اي كان الل وصلت ليه 


// """""""When you Set up New Feature """""""

//  ----------------------------------
//  DOMAIN LAYER
//  ----------------------------------
 // userEntity
  //  --> Rebo(Abstraction) 
                            // --------------------
                            // DATA LAYER ( باقي التفاصيل معروفة )
                            // --------------------
                              // Rebo (Implements) (Locator Pased) انظر الكود 

  //      ---> UseCaase (Call Abst Methods)
   //          ---> Cubit   
    //               ---> Ui    

// --------------------------------------------------------------------------------------------

// """Locator"""" الترتيب مهم
// 1-  الربط بين    Aps , Impl
   //  Sl.registerLazySinglton <Abs> ()=> Implemnt(Data:Sl()"مش لازم يبقي موجود")   Data:Sl() -=>  في حالة الترتيب الصيحيح  Data مسجل قبل كدا  == Orginsed Flow==

// 2- Dependancy inverstion  (Aps, Impl, "Opj From Aps" Not Opj From Impl) , Class EX: DataS use Instance from  Aps
  
  //  -----------------------------
  //  Data Class
    // finl Aps aps;
        // Data({requierd this.aps})
  //  -----------------------------
  
  //  Sl.registerLazySinglton <DataS> ()=> DataS(abs:Sl()) 


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

// ==========================NOETS=================================================
// add try cach for methods to avoid carch app With Ai Copilot==========
//  reurn; تكسر الدالة عشان متكملش للاخر

// ممكن تحفظ stats في متغير عشان تستخدمه اكتر من مرة
// final CurrntState = authCubit.state;
// Callback Function = فانكشن بتتبعت كـ باراميتر لفانكشن تانية، والفانكشن التانية هي اللي بتستدعيها وقت ما تحب.
// اي داتا جاية من برا ريموت ديما اتسقبل ف الاستات  STate وابعت ووزع ال ui عليها
// ===========================================================================


// Examples of Callback Functions
    // void sayHello() {
    //   print("Hello!");
    // }


    // void sayName(String name) {
    //   print("Hello $name");
    // }
    
    // onPressed: sayHello,
    // onPressed: () => sayName("Mohamed"),

// =========== Chat GPT  to get Exmples =========
// لو عايز، أقدر:
// أرتّب لك الشرح ده بشكل احترافي.
// أو أحولّه لشرح كامل بيوضح Clean Architecture + Cubit + GetIt.
// أو أساعدك تعرف الطبقات بالضبط المفروض تكون إزاي.
// تحب أرتّب الكلام وأشرحه لك؟
