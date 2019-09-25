(module
    (import "wasi_unstable" "args_sizes_get" 
        (func $get_argc (param i32 i32) (result i32)))
    (import "wasi_unstable" "proc_exit" 
        (func $exit (param i32)))

    (memory 1)
    (export "memory" (memory 0))

    (func $mymain (local i32 i32 i32)
        i32.const 0  ;; offset for argc pointer
        i32.const 0  ;; value 
        i32.store    ;;

        i32.const 4  ;; offset for argv_buf_size
        i32.const 0  ;; value 
        i32.store    ;;

        i32.const 0  
        i32.const 4  
        call $get_argc 
	i32.load offset=0
	call $exit
    )

    (func $main (export "_start")
        call $mymain
    )
)
