open Ctypes
module Bindings(F:Cstubs.FOREIGN) =
  struct
    open F
    let hacl_Chacha20_Vec32_chacha20_encrypt_32 =
      foreign "Hacl_Chacha20_Vec32_chacha20_encrypt_32"
        (uint32_t @->
           ((ptr uint8_t) @->
              ((ptr uint8_t) @->
                 ((ptr uint8_t) @->
                    ((ptr uint8_t) @-> (uint32_t @-> (returning void)))))))
      
    let hacl_Chacha20_Vec32_chacha20_decrypt_32 =
      foreign "Hacl_Chacha20_Vec32_chacha20_decrypt_32"
        (uint32_t @->
           ((ptr uint8_t) @->
              ((ptr uint8_t) @->
                 ((ptr uint8_t) @->
                    ((ptr uint8_t) @-> (uint32_t @-> (returning void)))))))
      
  end